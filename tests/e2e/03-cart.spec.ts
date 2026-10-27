import { test, expect } from '@playwright/test';
import { login, logout } from './helpers/auth.js';

test.describe('Luồng Giỏ Hàng (Cart Management)', () => {

  test('TC-CART-01: Chưa đăng nhập - Thêm sản phẩm vào giỏ yêu cầu đăng nhập', async ({ page }) => {
    // Đảm bảo không có session
    await logout(page);

    await page.goto('/VwSanPham/ChiTietSanPham?id=1');

    let dialogMessage = '';
    page.on('dialog', async dialog => {
      dialogMessage = dialog.message();
      await dialog.accept();
    });

    await page.click('button.btn-add');
    await page.waitForTimeout(1000);

    const toastMsg = (await page.locator('#toast-container, .toast, .alert').textContent().catch(() => '')) || '';
    expect((dialogMessage + ' ' + toastMsg).toLowerCase()).toContain('đăng nhập');
  });

  test('TC-CART-02: Đã đăng nhập - Thêm sản phẩm vào giỏ thành công', async ({ page }) => {
    await login(page, 'user02', '123456');

    await page.goto('/VwSanPham/ChiTietSanPham?id=2');

    let dialogMessage = '';
    page.once('dialog', async dialog => {
      dialogMessage = dialog.message();
      await dialog.accept();
    });

    await page.click('button.btn-add');
    await page.waitForTimeout(1500);

    const toastMsg = (await page.locator('#toast-container, .toast, .alert').textContent().catch(() => '')) || '';
    expect(dialogMessage + ' ' + toastMsg).toMatch(/thành công|đã thêm/i);
  });

  test('TC-CART-03: Xem trang giỏ hàng và kiểm tra các selector chuẩn DOM', async ({ page }) => {
    await login(page, 'user01', '123456');

    await page.goto('/VwGioHang/Dashboard');

    // Kiểm tra container giỏ hàng
    const cartContainer = page.locator('.cart-container');
    await expect(cartContainer).toBeVisible();

    const items = page.locator('.item-check');
    const itemCount = await items.count();

    if (itemCount > 0) {
      // Có sản phẩm: kiểm tra #checkAll, #checkAllFooter, #tongTien
      await expect(page.locator('#checkAll')).toBeVisible();
      await expect(page.locator('#checkAllFooter')).toBeVisible();
      await expect(page.locator('#tongTien')).toBeVisible();

      // Kiểm tra input số lượng #qty-{id}
      const firstItem = items.first();
      const itemId = await firstItem.getAttribute('data-id');
      expect(itemId).toBeTruthy();
      await expect(page.locator(`#qty-${itemId}`)).toBeVisible();
    } else {
      // Giỏ hàng trống
      await expect(page.locator('.empty-cart')).toBeVisible();
    }
  });

  test('TC-CART-04: Tương tác chọn sản phẩm (Check All, Check Item) và cập nhật #tongTien', async ({ page }) => {
    await login(page, 'user01', '123456');
    await page.goto('/VwGioHang/Dashboard');

    const items = page.locator('.item-check');
    const itemCount = await items.count();

    if (itemCount > 0) {
      const checkAll = page.locator('#checkAll');
      const tongTien = page.locator('#tongTien');

      // Chọn tất cả
      await checkAll.check();
      await expect(page.locator('#checkAllFooter')).toBeChecked();

      // Kiểm tra tất cả item được check
      for (let i = 0; i < itemCount; i++) {
        await expect(items.nth(i)).toBeChecked();
      }

      // Tổng tiền phải lớn hơn 0
      const totalText = await tongTien.innerText();
      expect(totalText).not.toBe('0 ₫');

      // Bỏ check item đầu tiên -> Check All phải uncheck
      await items.first().uncheck();
      await expect(checkAll).not.toBeChecked();
    }
  });

  test('TC-CART-05: Tăng và Giảm số lượng sản phẩm trong giỏ', async ({ page }) => {
    await login(page, 'user01', '123456');
    await page.goto('/VwGioHang/Dashboard');

    const items = page.locator('.item-check');
    if (await items.count() > 0) {
      const firstItem = items.first();
      const itemId = await firstItem.getAttribute('data-id');
      const qtyInput = page.locator(`#qty-${itemId}`);
      const initialQty = parseInt(await qtyInput.inputValue() || '1');

      // Click nút tăng (+)
      const row = page.locator(`.cart-item:has(input[data-id="${itemId}"])`);
      const plusBtn = row.locator('.quantity-control button:has-text("+")');

      await Promise.all([
        page.waitForResponse(resp => resp.url().includes('/VwGioHang/Tang')),
        plusBtn.click(),
      ]);
      await page.waitForLoadState('networkidle');

      // Chờ input cập nhật giá trị mới
      await expect(page.locator(`#qty-${itemId}`)).toHaveValue(String(initialQty + 1));

      // Click nút giảm (-)
      const minusBtn = page.locator(`.cart-item:has(input[data-id="${itemId}"]) .quantity-control button:has-text("-")`);
      await Promise.all([
        page.waitForResponse(resp => resp.url().includes('/VwGioHang/Giam')),
        minusBtn.click(),
      ]);
      await page.waitForLoadState('networkidle');

      await expect(page.locator(`#qty-${itemId}`)).toHaveValue(String(initialQty));
    }
  });

  test('TC-CART-06: Mua ngay chuyển sang giỏ hàng hoặc xác nhận thanh toán', async ({ page }) => {
    await login(page, 'user03', '123456');

    await page.goto('/VwSanPham/ChiTietSanPham?id=3');

    page.once('dialog', async dialog => {
      await dialog.accept();
    });

    await page.click('button.btn-buy');
    await page.waitForLoadState('networkidle');

    // Theo CONTRACT.md Section 2.4: Mua ngay là "Thêm vào giỏ và chuyển sang thanh toán" (/VwGioHang/Dashboard)
    // Baseline Bug: ChiTietSanPham.cshtml có 2 khối script muaNgay trùng lặp, khối sau redirect nhầm sang /VwDonHang/Dashboard
    await expect(page).toHaveURL(/\/VwGioHang\/Dashboard/);
  });
});
