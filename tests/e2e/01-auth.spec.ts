import { test, expect } from '@playwright/test';
import { login, loginAdmin, logout } from './helpers/auth.js';

test.describe('Luồng Tài Khoản (Authentication & Account Management)', () => {

  test('TC-AUTH-01: Đăng ký tài khoản mới thành công', async ({ page }) => {
    const ts = Date.now();
    const newUser = `reg_${ts}`;

    await page.goto('/VwTaiKhoan/DangKy');
    await page.fill('.auth-page input[name="HoTen"]', 'Test Automation User');
    await page.fill('.auth-page input[name="TenDangNhap"]', newUser);
    await page.fill('.auth-page input[name="Email"]', `${newUser}@example.com`);
    await page.fill('.auth-page input[name="SoDienThoai"]', `09${Math.floor(10000000 + Math.random() * 90000000)}`);
    await page.fill('.auth-page textarea[name="DiaChi"]', '123 Đường Test, Quận 1, TP HCM');
    await page.fill('.auth-page input[name="MatKhau"]', 'Pass123!');
    await page.fill('.auth-page input[name="XacNhanMatKhau"]', 'Pass123!');

    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    // Sau khi đăng ký thành công, hệ thống phải chuyển về trang Đăng nhập
    expect(page.url()).toContain('/VwTaiKhoan/DangNhap');

    // Kiểm tra thông báo thành công (Baseline: VwTaiKhoan/DangNhap.cshtml thiếu render TempData["Success"])
    const successMsg = page.locator('.alert-success');
    await expect(successMsg).toBeVisible();
  });

  test('TC-AUTH-02: Đăng ký thất bại khi trùng tên đăng nhập', async ({ page }) => {
    await page.goto('/VwTaiKhoan/DangKy');

    // Dùng tên đăng nhập đã tồn tại trong DB (user01)
    await page.fill('.auth-page input[name="HoTen"]', 'Test Duplicate User');
    await page.fill('.auth-page input[name="TenDangNhap"]', 'user01');
    await page.fill('.auth-page input[name="Email"]', `diff_user01_${Date.now()}@example.com`);
    await page.fill('.auth-page input[name="SoDienThoai"]', '0999888777');
    await page.fill('.auth-page textarea[name="DiaChi"]', '456 Đường Test');
    await page.fill('.auth-page input[name="MatKhau"]', 'Pass123!');
    await page.fill('.auth-page input[name="XacNhanMatKhau"]', 'Pass123!');

    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    const alertError = page.locator('.alert-danger');
    await expect(alertError).toBeVisible();
    await expect(alertError).toContainText(/tồn tại/i);
  });

  test('TC-AUTH-03: Đăng nhập thất bại khi sai mật khẩu', async ({ page }) => {
    await page.goto('/VwTaiKhoan/DangNhap');

    await page.fill('.auth-page input[name="TenDangNhap"]', 'user01');
    await page.fill('.auth-page input[name="MatKhau"]', 'WrongPassword!@#');
    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    expect(page.url()).toContain('/VwTaiKhoan/DangNhap');
    const alertError = page.locator('.alert-danger');
    await expect(alertError).toBeVisible();
    await expect(alertError).toContainText(/sai|không đúng/i);
  });

  test('TC-AUTH-04: Đăng nhập thành công với User thường', async ({ page }) => {
    await page.goto('/VwTaiKhoan/DangNhap');

    await page.fill('.auth-page input[name="TenDangNhap"]', 'user01');
    await page.fill('.auth-page input[name="MatKhau"]', '123456');
    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    // Chuyển hướng về trang chủ
    await expect(page).toHaveURL(/(\/$|\/Home|\/Home\/Index)/);
    // Menu header hiển thị tên người dùng
    const userMenu = page.locator('.btn-account');
    await expect(userMenu).toBeVisible();
    await expect(userMenu).toContainText('user01');
  });

  test('TC-AUTH-05: Đăng nhập thành công với Admin', async ({ page }) => {
    await page.goto('/VwTaiKhoan/DangNhap');

    await page.fill('.auth-page input[name="TenDangNhap"]', 'Admin');
    await page.fill('.auth-page input[name="MatKhau"]', '123456');
    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    // Admin phải được chuyển hướng đến trang quản trị Dashboard
    await expect(page).toHaveURL(/\/VwQuanTri\/Dashboard/);
    await expect(page.locator('h2').first()).toContainText(/Dashboard/i);
  });

  test('TC-AUTH-06: Đăng xuất người dùng', async ({ page }) => {
    // Đăng nhập trước
    await login(page, 'user01', '123456');

    // Click đăng xuất hoặc điều hướng đến /VwTaiKhoan/DangXuat
    await page.goto('/VwTaiKhoan/DangXuat');
    await page.waitForLoadState('networkidle');

    // Phải về trang chủ và hiển thị nút Đăng nhập / Đăng ký
    await expect(page).toHaveURL(/(\/$|\/Home|\/Home\/Index)/);
    await expect(page.locator('.btn-login, a[href*="DangNhap"]').first()).toBeVisible();
  });

  test('TC-AUTH-07: Đổi mật khẩu thành công', async ({ page }) => {
    const ts = Date.now();
    const chUser = `chpass_${ts}`;
    const p1 = 'OldPass123!';
    const p2 = 'NewPass123!';

    // Đăng ký user riêng cho test này
    await page.goto('/VwTaiKhoan/DangKy');
    await page.fill('.auth-page input[name="HoTen"]', 'User Change Pass');
    await page.fill('.auth-page input[name="TenDangNhap"]', chUser);
    await page.fill('.auth-page input[name="Email"]', `${chUser}@example.com`);
    await page.fill('.auth-page input[name="SoDienThoai"]', `09${Math.floor(10000000 + Math.random() * 90000000)}`);
    await page.fill('.auth-page textarea[name="DiaChi"]', '123 Test');
    await page.fill('.auth-page input[name="MatKhau"]', p1);
    await page.fill('.auth-page input[name="XacNhanMatKhau"]', p1);
    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    // Đăng nhập user vừa tạo
    await login(page, chUser, p1);

    // Đến trang đổi mật khẩu
    await page.goto('/VwTaiKhoan/DoiMatKhau');
    await page.fill('.card-body input[name="MatKhauCu"]', p1);
    await page.fill('.card-body input[name="MatKhauMoi"]', p2);
    await page.fill('.card-body input[name="XacNhanMatKhauMoi"]', p2);
    await page.click('.card-body button[type="submit"]');
    await page.waitForLoadState('networkidle');

    // Hệ thống báo thành công và chuyển về TaiKhoan
    expect(page.url()).toContain('/VwTaiKhoan/TaiKhoan');
    await expect(page.locator('.alert-success')).toBeVisible();

    // Thử đăng xuất và đăng nhập lại bằng mật khẩu mới
    await logout(page);
    await login(page, chUser, p2);
    const userMenu = page.locator('.btn-account');
    await expect(userMenu).toContainText(chUser);
  });

  test('TC-AUTH-08: Quên mật khẩu - khôi phục mật khẩu thành công', async ({ page }) => {
    const ts = Date.now();
    const resetUser = `reset_${ts}`;
    const resetPhone = `08${Math.floor(10000000 + Math.random() * 90000000)}`;
    const pass1 = 'InitPass123!';
    const pass2 = 'ResetPass123!';

    // Đăng ký tài khoản riêng cho luồng quên mật khẩu
    await page.goto('/VwTaiKhoan/DangKy');
    await page.fill('.auth-page input[name="HoTen"]', 'User Reset Test');
    await page.fill('.auth-page input[name="TenDangNhap"]', resetUser);
    await page.fill('.auth-page input[name="Email"]', `${resetUser}@example.com`);
    await page.fill('.auth-page input[name="SoDienThoai"]', resetPhone);
    await page.fill('.auth-page textarea[name="DiaChi"]', '789 Đường Reset');
    await page.fill('.auth-page input[name="MatKhau"]', pass1);
    await page.fill('.auth-page input[name="XacNhanMatKhau"]', pass1);
    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    // Đến trang Quên mật khẩu
    await page.goto('/VwTaiKhoan/QuenMatKhau');
    await page.fill('.auth-page input[name="TenDangNhap"]', resetUser);
    await page.fill('.auth-page input[name="SoDienThoai"]', resetPhone);
    await page.fill('.auth-page input[name="MatKhauMoi"]', pass2);
    await page.fill('.auth-page input[name="XacNhanMatKhauMoi"]', pass2);
    await page.click('.auth-page button.btn-auth');
    await page.waitForLoadState('networkidle');

    // Mong đợi chuyển hướng về DangNhap
    expect(page.url()).toContain('/VwTaiKhoan/DangNhap');

    // Đăng nhập với mật khẩu mới
    await login(page, resetUser, pass2);

    const userMenu = page.locator('.btn-account');
    await expect(userMenu).toContainText(resetUser);
  });
});
