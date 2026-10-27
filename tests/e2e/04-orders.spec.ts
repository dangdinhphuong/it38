import { test, expect } from '@playwright/test';
import { login, logout } from './helpers/auth.js';

test.describe('Luồng Đặt Hàng & Quản Lý Đơn Hàng Người Dùng (Orders)', () => {

  test('TC-ORD-01: Chưa đăng nhập truy cập /VwDonHang/Dashboard bị chuyển hướng', async ({ page }) => {
    await page.goto('/VwTaiKhoan/DangXuat');
    await page.goto('/VwDonHang/Dashboard');
    await page.waitForLoadState('networkidle');

    // Phải bị chuyển hướng về /VwTaiKhoan/DangNhap
    expect(page.url()).toContain('/VwTaiKhoan/DangNhap');
  });

  test('TC-ORD-02: Bấm thanh toán khi chưa chọn sản phẩm nào trong giỏ', async ({ page }) => {
    await login(page, 'user04', '123456');

    // Đảm bảo có ít nhất 1 sản phẩm trong giỏ
    await page.goto('/VwSanPham/ChiTietSanPham?id=4');
    page.once('dialog', async d => await d.accept());
    await page.click('button.btn-add');
    await page.waitForTimeout(1000);

    await page.goto('/VwGioHang/Dashboard');

    // Bỏ chọn tất cả nếu đang chọn
    const checkedItems = page.locator('.item-check:checked');
    const checkedCount = await checkedItems.count();
    for (let i = 0; i < checkedCount; i++) {
      await checkedItems.nth(0).uncheck();
    }

    let dialogMessage = '';
    page.once('dialog', async dialog => {
      dialogMessage = dialog.message();
      await dialog.accept();
    });

    await page.click('button.btn-checkout');
    await page.waitForTimeout(500);

    expect(dialogMessage).toMatch(/chọn sản phẩm/i);
  });

  test('TC-ORD-03: Đặt hàng thành công từ giỏ hàng và chuyển hướng sang danh sách đơn mua', async ({ page }) => {
    await login(page, 'user05', '123456');

    // Thêm sản phẩm vào giỏ
    await page.goto('/VwSanPham/ChiTietSanPham?id=1');
    page.once('dialog', async d => await d.accept());
    await page.click('button.btn-add');
    await page.waitForTimeout(1000);

    await page.goto('/VwGioHang/Dashboard');

    // Chọn sản phẩm đầu tiên
    const firstCheck = page.locator('.item-check').first();
    await firstCheck.check();

    page.once('dialog', async dialog => {
      await dialog.accept();
    });

    await page.click('button.btn-checkout');
    await page.waitForLoadState('networkidle');

    // Chuyển hướng sang /VwDonHang/Dashboard
    await expect(page).toHaveURL(/\/VwDonHang\/Dashboard/);

    // Kiểm tra danh sách đơn hàng có đơn vừa tạo
    const orderCards = page.locator('.card:has(.badge)');
    await expect(orderCards.first()).toBeVisible();
  });

  test('TC-ORD-04: Xem danh sách đơn mua và chi tiết đơn hàng', async ({ page }) => {
    await login(page, 'user01', '123456');

    await page.goto('/VwDonHang/Dashboard');

    const heading = page.locator('h2');
    await expect(heading).toContainText(/Đơn hàng của tôi/i);

    // Đơn hàng hiển thị mã đơn, trạng thái, ngày đặt, tổng thanh toán
    const orders = page.locator('.card.shadow-sm');
    if (await orders.count() > 0) {
      const firstOrder = orders.first();
      await expect(firstOrder.locator('.card-header')).toContainText(/Mã đơn/i);
      await expect(firstOrder.locator('.badge')).toBeVisible();
      await expect(firstOrder.locator('.card-footer')).toContainText(/Tổng thanh toán/i);
    }
  });
});
