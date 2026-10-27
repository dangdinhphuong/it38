import { Page, expect } from '@playwright/test';

export async function login(page: Page, username = 'user01', password = '123456') {
  await page.goto('/VwTaiKhoan/DangNhap');
  await page.fill('.auth-page input[name="TenDangNhap"]', username);
  await page.fill('.auth-page input[name="MatKhau"]', password);
  await page.click('.auth-page button.btn-auth');
  await page.waitForLoadState('networkidle');
}

export async function loginAdmin(page: Page) {
  await login(page, 'Admin', '123456');
}

export async function logout(page: Page) {
  await page.goto('/VwTaiKhoan/DangXuat');
  await page.waitForLoadState('networkidle');
}
