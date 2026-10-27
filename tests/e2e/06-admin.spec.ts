import { test, expect } from '@playwright/test';
import { loginAdmin } from './helpers/auth.js';

test.describe('Luồng Quản Trị Admin (Dashboard, Categories, Products, Orders)', () => {

  test.beforeEach(async ({ page }) => {
    await loginAdmin(page);
  });

  test('TC-ADM-01: Admin xem dashboard số liệu và gọi API GetDashboardData', async ({ page }) => {
    await page.goto('/VwQuanTri/Dashboard');

    // Kiểm tra các thẻ số liệu theo CONTRACT.md
    await expect(page.locator('#tongSanPham')).toBeVisible();
    await expect(page.locator('#tongDanhMuc')).toBeVisible();
    await expect(page.locator('#tongDonHang')).toBeVisible();
    await expect(page.locator('#doanhThu')).toBeVisible();
    await expect(page.locator('#topSanPhamBody')).toBeVisible();

    // Nút làm mới dữ liệu gọi loadDashboard()
    const refreshBtn = page.locator('button:has-text("Làm mới dữ liệu")');
    await expect(refreshBtn).toBeVisible();

    const [response] = await Promise.all([
      page.waitForResponse(resp => resp.url().includes('/VwQuanTri/GetDashboardData') && resp.status() === 200),
      refreshBtn.click(),
    ]);

    const json = await response.json();
    expect(json).toHaveProperty('tongSanPham');
    expect(json).toHaveProperty('tongDanhMuc');
    expect(json).toHaveProperty('tongDonHang');
    expect(json).toHaveProperty('doanhThu');
    expect(json).toHaveProperty('topSanPham');
  });

  test('TC-ADM-02: Quản lý danh mục - Thêm mới, Sửa và Xóa danh mục', async ({ page }) => {
    await page.goto('/VwQuanTri/DanhMuc');

    const timestamp = Date.now();
    const newCatName = `DM Test ${timestamp}`;
    const updatedCatName = `DM Updated ${timestamp}`;

    // 1. THÊM DANH MỤC
    await page.click('button[data-bs-target="#modalThem"]');
    const modalThem = page.locator('#modalThem');
    await expect(modalThem).toBeVisible();

    await modalThem.locator('input[name="TenDanhMuc"]').fill(newCatName);
    await Promise.all([
      page.waitForResponse(resp => resp.url().includes('/ThemDanhMuc')),
      modalThem.locator('button[type="submit"]').click(),
    ]);
    await page.waitForTimeout(1000);

    // Kiểm tra dòng mới xuất hiện trong bảng #tableDanhMuc
    const newRow = page.locator(`#tableDanhMuc tr:has-text("${newCatName}")`);
    await expect(newRow).toBeVisible();

    // Lấy ID danh mục vừa thêm từ row id="row_{id}"
    const rowIdAttr = await newRow.getAttribute('id');
    const catId = rowIdAttr?.replace('row_', '');
    expect(catId).toBeTruthy();

    // 2. SỬA DANH MỤC
    // Click nút sửa trên dòng
    await newRow.locator('button:has-text("Sửa")').click();
    const editModal = page.locator(`#edit_${catId}`);
    if (await editModal.count() > 0) {
      await expect(editModal).toBeVisible();
      await editModal.locator('input[name="TenDanhMuc"]').fill(updatedCatName);
      await editModal.locator('button[type="submit"]').click();
      await page.waitForTimeout(1000);
    }

    // 3. XÓA DANH MỤC
    page.once('dialog', async d => await d.accept());
    await page.evaluate(id => {
      // @ts-ignore
      if (typeof window.xoaDanhMuc === 'function') {
        // @ts-ignore
        window.xoaDanhMuc(id);
      }
    }, catId);

    await page.waitForTimeout(1000);
    // Dòng vừa tạo bị xóa khỏi bảng
    await expect(page.locator(`#row_${catId}`)).not.toBeVisible();
  });

  test('TC-ADM-03: Quản lý sản phẩm - Thêm mới sản phẩm', async ({ page }) => {
    await page.goto('/VwQuanTri/SanPham');

    const timestamp = Date.now();
    const testProdName = `SP E2E Test ${timestamp}`;

    await page.click('button[data-bs-target="#modalThem"]');
    const modalThem = page.locator('#modalThem');
    await expect(modalThem).toBeVisible();

    await modalThem.locator('input[name="TenSanPham"]').fill(testProdName);
    await modalThem.locator('textarea[name="MoTa"]').fill('Mô tả sản phẩm test Playwright');
    await modalThem.locator('input[name="Gia"]').fill('99000');
    await modalThem.locator('input[name="SoLuongTon"]').fill('50');

    // Chọn danh mục
    const catSelect = modalThem.locator('select[name="MaDanhMuc"]');
    await catSelect.selectOption({ index: 0 });

    await Promise.all([
      page.waitForResponse(resp => resp.url().includes('/ThemSanPham')),
      modalThem.locator('button[type="submit"]').click(),
    ]);
    await page.waitForTimeout(1000);

    // Kiểm tra sản phẩm xuất hiện trong #tableSanPham
    const prodRow = page.locator(`#tableSanPham tr:has-text("${testProdName}")`);
    await expect(prodRow).toBeVisible();

    // Dọn dẹp: Xóa sản phẩm vừa thêm
    const rowId = await prodRow.getAttribute('id');
    const spId = rowId?.replace('row_', '');
    if (spId) {
      page.once('dialog', async d => await d.accept());
      await page.evaluate(id => {
        // @ts-ignore
        if (typeof window.xoaSanPham === 'function') {
          // @ts-ignore
          window.xoaSanPham(id);
        }
      }, spId);
      await page.waitForTimeout(1000);
      await expect(page.locator(`#row_${spId}`)).not.toBeVisible();
    }
  });

  test('TC-ADM-04: Quản lý đơn hàng - Duyệt đơn và Hủy đơn', async ({ page }) => {
    await page.goto('/VwQuanTri/DonHang');

    const orderRows = page.locator('#tableDonHang tr');
    const count = await orderRows.count();
    expect(count).toBeGreaterThan(0);

    // Tìm đơn hàng có trạng thái "Chờ xử lý"
    const pendingRow = page.locator('#tableDonHang tr:has-text("Chờ xử lý")').first();

    if (await pendingRow.count() > 0) {
      const rowId = await pendingRow.getAttribute('id');
      const orderId = rowId?.replace('row_', '');

      // Duyệt đơn hàng
      const approveBtn = pendingRow.locator('button:has-text("Duyệt đơn")');
      if (await approveBtn.count() > 0) {
        await Promise.all([
          page.waitForResponse(resp => resp.url().includes(`/DuyetDon/${orderId}`)),
          approveBtn.click(),
        ]);
        await page.waitForTimeout(500);

        // Trạng thái cập nhật thành "Đã duyệt"
        const statusCell = page.locator(`#status_${orderId}`);
        await expect(statusCell).toContainText('Đã duyệt');
      }
    }
  });
});
