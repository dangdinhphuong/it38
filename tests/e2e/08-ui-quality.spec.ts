import { test, expect } from '@playwright/test';
import { login, loginAdmin } from './helpers/auth.js';

test.describe('Chất Lượng Giao Diện, Console, Network & Responsive (UI Quality)', () => {

  const testPages = [
    { name: 'Trang chủ', path: '/' },
    { name: 'Chi tiết sản phẩm', path: '/VwSanPham/ChiTietSanPham?id=1' },
    { name: 'Đăng nhập', path: '/VwTaiKhoan/DangNhap' },
    { name: 'Đăng ký', path: '/VwTaiKhoan/DangKy' },
    { name: 'Danh mục sản phẩm', path: '/VwSanPham/Dashboard?id=1' },
  ];

  test('TC-UI-01: Kiểm tra JavaScript Console Errors và Page Uncaught Exceptions', async ({ page }) => {
    const errorLogs: { page: string; error: string }[] = [];

    page.on('pageerror', exception => {
      errorLogs.push({ page: page.url(), error: exception.message });
    });

    page.on('console', msg => {
      if (msg.type() === 'error') {
        // Lọc bỏ cảnh báo tracking hoặc favicons nếu có
        const text = msg.text();
        if (!text.includes('favicon.ico')) {
          errorLogs.push({ page: page.url(), error: text });
        }
      }
    });

    for (const p of testPages) {
      await page.goto(p.path);
      await page.waitForLoadState('networkidle');
    }

    // Ghi nhận lỗi console nếu có
    expect(
      errorLogs.length,
      `Phát hiện ${errorLogs.length} lỗi console JS trên các trang: ${JSON.stringify(errorLogs, null, 2)}`
    ).toBe(0);
  });

  test('TC-UI-02: Kiểm tra Network 4xx / 5xx Failed Requests', async ({ page }) => {
    const failedRequests: { url: string; status: number }[] = [];

    page.on('response', resp => {
      const status = resp.status();
      const url = resp.url();
      // Bỏ qua favicon 404 nếu không nghiêm trọng, nhưng ghi nhận tất cả tài nguyên web app khác
      if (status >= 400 && !url.includes('favicon.ico')) {
        failedRequests.push({ url, status });
      }
    });

    for (const p of testPages) {
      await page.goto(p.path);
      await page.waitForLoadState('networkidle');
    }

    expect(
      failedRequests.length,
      `Phát hiện các request trả về lỗi HTTP 4xx/5xx: ${JSON.stringify(failedRequests, null, 2)}`
    ).toBe(0);
  });

  test('TC-UI-03: Kiểm tra ảnh vỡ (Broken Images) trên trang chủ và chi tiết', async ({ page }) => {
    for (const path of ['/', '/VwSanPham/ChiTietSanPham?id=1']) {
      await page.goto(path);
      await page.waitForLoadState('networkidle');

      const brokenImages = await page.evaluate(async () => {
        const images = Array.from(document.querySelectorAll('img'));
        const broken: string[] = [];

        for (const img of images) {
          // Bỏ qua ảnh 1x1 tracking nếu có
          if (img.src && !img.complete || img.naturalWidth === 0) {
            broken.push(img.src);
          }
        }
        return broken;
      });

      expect(
        brokenImages.length,
        `Phát hiện ${brokenImages.length} ảnh vỡ tại ${path}: ${brokenImages.join(', ')}`
      ).toBe(0);
    }
  });

  const viewports = [
    { width: 375, height: 667, name: 'Mobile (375px)' },
    { width: 768, height: 1024, name: 'Tablet (768px)' },
    { width: 1280, height: 800, name: 'Desktop (1280px)' },
  ];

  for (const vp of viewports) {
    test(`TC-UI-04: Kiểm tra Responsive Layout trên ${vp.name}`, async ({ page }) => {
      await page.setViewportSize({ width: vp.width, height: vp.height });
      await page.goto('/');
      await page.waitForLoadState('networkidle');

      // 1. Kiểm tra header và logo hiển thị
      await expect(page.locator('.logo')).toBeVisible();

      // 2. Kiểm tra ô tìm kiếm hiển thị
      await expect(page.locator('input[name="keyword"]')).toBeVisible();

      // 3. Kiểm tra không bị tràn chiều ngang (horizontal scroll bar ngoài ý muốn)
      const isOverflowing = await page.evaluate(() => {
        return document.documentElement.scrollWidth > window.innerWidth;
      });

      expect(
        isOverflowing,
        `Giao diện bị tràn màn hình theo chiều ngang (overflow-x) ở độ phân giải ${vp.width}px`
      ).toBeFalsy();
    });
  }
});
