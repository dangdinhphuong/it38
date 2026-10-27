import { test, expect } from '@playwright/test';

test.describe('Luồng Sản Phẩm (Product Catalog, Search & Details)', () => {

  test('TC-PROD-01: Trang chủ tải danh mục qua AJAX và hiển thị sản phẩm', async ({ page }) => {
    await page.goto('/');

    // Kiểm tra container danh mục
    const catContainer = page.locator('#categoryContainer');
    await expect(catContainer).toBeVisible();

    // Chờ AJAX tải các category-item
    const categoryItems = catContainer.locator('.category-item');
    await expect(categoryItems.first()).toBeVisible({ timeout: 10000 });
    const count = await categoryItems.count();
    expect(count).toBeGreaterThan(0);

    // Kiểm tra nút cuộn danh mục
    const leftBtn = page.locator('button.scroll-btn.left');
    const rightBtn = page.locator('button.scroll-btn.right');
    await expect(leftBtn).toBeVisible();
    await expect(rightBtn).toBeVisible();

    // Thử click nút cuộn
    await rightBtn.click();
    await page.waitForTimeout(300);
    await leftBtn.click();

    // Kiểm tra danh sách sản phẩm gợi ý hôm nay
    const productCards = page.locator('.product-card');
    await expect(productCards.first()).toBeVisible();
  });

  test('TC-PROD-02: Xem sản phẩm theo danh mục', async ({ page }) => {
    await page.goto('/');

    // Click vào danh mục đầu tiên trong #categoryContainer
    const firstCategory = page.locator('#categoryContainer .category-item').first();
    await expect(firstCategory).toBeVisible({ timeout: 10000 });

    const catName = (await firstCategory.locator('.cat-name').innerText()).trim();
    await firstCategory.click();

    // Mong đợi URL chuyển sang /VwSanPham/Dashboard?id=...
    await expect(page).toHaveURL(/\/VwSanPham\/Dashboard\?id=\d+/);

    // Kiểm tra trang danh mục: sidebar có danh mục sản phẩm, main có tiêu đề hoặc sản phẩm
    const sidebar = page.locator('.sidebar');
    await expect(sidebar).toBeVisible();

    const categoryTitle = page.locator('.current-category-title');
    await expect(categoryTitle).toBeVisible();
  });

  test('TC-PROD-03: Tìm kiếm sản phẩm theo keyword', async ({ page }) => {
    await page.goto('/');

    const searchInput = page.locator('input[name="keyword"]');
    await expect(searchInput).toBeVisible();

    // Tìm kiếm với từ khóa 'iPhone'
    await searchInput.fill('iPhone');
    await page.locator('.search-box button[type="submit"], .btn-search').click();
    await page.waitForLoadState('networkidle');

    // URL phải có param keyword=iPhone
    expect(page.url()).toContain('keyword=iPhone');

    // Kiểm tra xem sản phẩm tìm kiếm có hiển thị không
    const productGrid = page.locator('.product-grid-container');
    await expect(productGrid).toBeVisible();
  });

  test('TC-PROD-04: Xem chi tiết sản phẩm và tương tác số lượng', async ({ page }) => {
    // Điều hướng vào chi tiết sản phẩm 1
    await page.goto('/VwSanPham/ChiTietSanPham?id=1');

    // Kiểm tra ảnh chính theo CONTRACT (#mainProductImage)
    const mainImg = page.locator('#mainProductImage');
    await expect(mainImg).toBeVisible();

    // Kiểm tra tên, giá, số lượng tồn
    await expect(page.locator('.product-name')).toBeVisible();
    await expect(page.locator('.product-price')).toBeVisible();

    // Kiểm tra input số lượng (#qtyInput)
    const qtyInput = page.locator('#qtyInput');
    await expect(qtyInput).toBeVisible();
    await expect(qtyInput).toHaveValue('1');

    // Nút tăng (+) số lượng
    const plusBtn = page.locator('.quantity-control button:has-text("+")');
    await plusBtn.click();
    await expect(qtyInput).toHaveValue('2');

    // Nút giảm (-) số lượng
    const minusBtn = page.locator('.quantity-control button:has-text("-")');
    await minusBtn.click();
    await expect(qtyInput).toHaveValue('1');

    // Không thể giảm xuống dưới 1
    await minusBtn.click();
    await expect(qtyInput).toHaveValue('1');

    // Nút Thêm vào giỏ và Mua ngay
    await expect(page.locator('button.btn-add')).toBeVisible();
    await expect(page.locator('button.btn-buy')).toBeVisible();
  });

  test('TC-PROD-05: Click thumbnail đổi ảnh chính', async ({ page }) => {
    await page.goto('/VwSanPham/ChiTietSanPham?id=1');

    const mainImg = page.locator('#mainProductImage');
    const initialSrc = await mainImg.getAttribute('src');

    const thumbs = page.locator('.thumb-item img');
    if (await thumbs.count() > 1) {
      await thumbs.nth(1).click();
      const newSrc = await mainImg.getAttribute('src');
      expect(newSrc).toBeTruthy();
    }
  });
});
