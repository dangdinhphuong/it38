import { test, expect } from '@playwright/test';
import { login, logout } from './helpers/auth.js';

test.describe('Luồng Phân Quyền & Kiểm Soát Truy Cập (Authorization & Access Control)', () => {

  test('TC-AUTHZ-01: Khách chưa đăng nhập truy cập /VwQuanTri/Dashboard phải bị chặn hoặc chuyển hướng', async ({ page }) => {
    // Đảm bảo không có session
    await logout(page);

    await page.goto('/VwQuanTri/Dashboard');
    await page.waitForLoadState('networkidle');

    // Theo CONTRACT.md: Chưa có session phải redirect về /VwTaiKhoan/DangNhap hoặc trả về 401/403
    // Không được phép truy cập xem dashboard admin khi chưa đăng nhập
    const currentUrl = page.url();
    const isRedirectedToLogin = currentUrl.includes('/VwTaiKhoan/DangNhap');
    const isForbidden = page.locator('text=401, text=403, text="Không có quyền"');

    expect(
      isRedirectedToLogin || (await isForbidden.count() > 0),
      `LỖI BẢO MẬT: Khách vãng lai chưa đăng nhập vẫn truy cập được /VwQuanTri/Dashboard (URL hiện tại: ${currentUrl})`
    ).toBeTruthy();
  });

  test('TC-AUTHZ-02: User thường (VaiTro="User") truy cập /VwQuanTri/Dashboard phải bị chặn', async ({ page }) => {
    // Đăng nhập bằng tài khoản User thường
    await login(page, 'user01', '123456');

    await page.goto('/VwQuanTri/Dashboard');
    await page.waitForLoadState('networkidle');

    // User thường không có quyền Admin, không được phép vào trang Admin Dashboard
    const currentUrl = page.url();
    const isBlocked = !currentUrl.includes('/VwQuanTri/Dashboard') || (await page.locator('text=403, text="Không có quyền"').count() > 0);

    expect(
      isBlocked,
      `LỖI PHÂN QUYỀN: Người dùng vai trò 'User' (user01) vẫn truy cập được vào /VwQuanTri/Dashboard`
    ).toBeTruthy();
  });

  test('TC-AUTHZ-03: Khách chưa đăng nhập truy cập /VwGioHang/Dashboard phải chuyển hướng về DangNhap', async ({ page }) => {
    await logout(page);

    await page.goto('/VwGioHang/Dashboard');
    await page.waitForLoadState('networkidle');

    expect(page.url()).toContain('/VwTaiKhoan/DangNhap');
  });

  test('TC-AUTHZ-04: Khách chưa đăng nhập truy cập /VwTaiKhoan/TaiKhoan phải chuyển hướng về DangNhap', async ({ page }) => {
    await logout(page);

    await page.goto('/VwTaiKhoan/TaiKhoan');
    await page.waitForLoadState('networkidle');

    expect(page.url()).toContain('/VwTaiKhoan/DangNhap');
  });

  test('TC-AUTHZ-05: Khách chưa đăng nhập truy cập các endpoint quản trị (/VwQuanTri/DanhMuc, /SanPham, /DonHang)', async ({ page }) => {
    await logout(page);

    for (const adminPath of ['/VwQuanTri/DanhMuc', '/VwQuanTri/SanPham', '/VwQuanTri/DonHang']) {
      await page.goto(adminPath);
      await page.waitForLoadState('networkidle');

      const isRedirectedToLogin = page.url().includes('/VwTaiKhoan/DangNhap');
      const isForbidden = (await page.locator('text=401, text=403').count()) > 0;

      expect(
        isRedirectedToLogin || isForbidden,
        `LỖI BẢO MẬT: Khách chưa đăng nhập vẫn truy cập được endpoint admin ${adminPath}`
      ).toBeTruthy();
    }
  });
});
