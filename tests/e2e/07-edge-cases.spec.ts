import { test, expect } from '@playwright/test';
import { login } from './helpers/auth.js';

test.describe('Ca Biên & Bảo Mật (Edge Cases & Security)', () => {

  test('TC-EDGE-01: Thêm giỏ hàng với số lượng <= 0 (Số âm hoặc 0)', async ({ page, request }) => {
    await login(page, 'user06', '123456');

    // Thử gửi trực tiếp API POST /VwGioHang/ThemVaoGio với soLuong = -5
    const cookies = await page.context().cookies();
    const cookieHeader = cookies.map(c => `${c.name}=${c.value}`).join('; ');

    const resNegative = await request.post('/VwGioHang/ThemVaoGio', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': cookieHeader
      },
      data: 'maSanPham=1&soLuong=-5'
    });

    expect(resNegative.status()).toBe(200);
    const dataNegative = await resNegative.json();

    // Mong đợi: Hệ thống từ chối thêm số lượng âm hoặc số 0 vào giỏ hàng
    expect(
      dataNegative.success,
      `LỖI HỆ THỐNG: Cho phép thêm số lượng âm (${dataNegative.message}) vào giỏ hàng!`
    ).toBeFalsy();

    // Thử với soLuong = 0
    const resZero = await request.post('/VwGioHang/ThemVaoGio', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': cookieHeader
      },
      data: 'maSanPham=1&soLuong=0'
    });

    const dataZero = await resZero.json();
    expect(
      dataZero.success,
      `LỖI HỆ THỐNG: Cho phép thêm số lượng 0 (${dataZero.message}) vào giỏ hàng!`
    ).toBeFalsy();
  });

  test('TC-EDGE-02: Thêm giỏ hàng vượt quá số lượng tồn kho', async ({ page }) => {
    await login(page, 'user07', '123456');

    await page.goto('/VwSanPham/ChiTietSanPham?id=1');

    // Điền số lượng vượt xa tồn kho (ví dụ 999999)
    const qtyInput = page.locator('#qtyInput');
    await qtyInput.fill('999999');

    let dialogMessage = '';
    page.once('dialog', async dialog => {
      dialogMessage = dialog.message();
      await dialog.accept();
    });

    await page.click('button.btn-add');
    await page.waitForTimeout(1000);

    const toastMsg = (await page.locator('#toast-container, .toast, .alert').textContent().catch(() => '')) || '';
    expect((dialogMessage + ' ' + toastMsg).toLowerCase()).toMatch(/vượt quá|tồn kho|không đủ/i);
  });

  test('TC-EDGE-03: Tìm kiếm với payload XSS (<script>alert(1)</script>)', async ({ page }) => {
    await page.goto('/');

    let xssTriggered = false;
    page.on('dialog', async dialog => {
      if (dialog.message() === '1' || dialog.message().includes('XSS')) {
        xssTriggered = true;
      }
      await dialog.dismiss();
    });

    const xssPayload = '<script>alert("XSS")</script><img src=x onerror=alert(1)>';
    const searchInput = page.locator('input[name="keyword"]');
    await searchInput.fill(xssPayload);
    await page.locator('.search-box button[type="submit"], .btn-search').click();
    await page.waitForLoadState('networkidle');

    // Không được kích hoạt alert/dialog từ script injection
    expect(xssTriggered, 'LỖI BẢO MẬT XSS: Mã JavaScript được thực thi thông qua ô tìm kiếm').toBeFalsy();

    // Payload hiển thị trong input phải được escape an toàn
    const inputValue = await searchInput.inputValue();
    expect(inputValue).toBe(xssPayload);
  });

  test('TC-EDGE-04: Tìm kiếm với cú pháp SQL Injection (\' OR \'1\'=\'1)', async ({ page }) => {
    const sqlPayloads = [
      "' OR '1'='1",
      "'; DROP TABLE TestDummy; --",
      "' UNION SELECT null, null, null--"
    ];

    for (const payload of sqlPayloads) {
      await page.goto('/');
      const searchInput = page.locator('input[name="keyword"]');
      await searchInput.fill(payload);

      const [response] = await Promise.all([
        page.waitForResponse(resp => resp.url().includes('/Home/Index') || resp.url().includes('/?keyword')),
        page.locator('.search-box button[type="submit"], .btn-search').click(),
      ]);

      // Server không được crash hay trả về mã lỗi 500
      expect(
        response.status(),
        `LỖI SQL INJECTION: Server trả về mã ${response.status()} khi tìm kiếm với payload: ${payload}`
      ).toBe(200);

      // Trang không hiển thị lỗi SQL ngoại lệ của .NET
      const content = await page.content();
      expect(content).not.toContain('SqlException');
      expect(content).not.toContain('An unhandled exception occurred');
    }
  });
});
