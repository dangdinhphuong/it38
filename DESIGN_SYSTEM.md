# HỆ THỐNG THIẾT KẾ SHOPEECLONE (DESIGN_SYSTEM.MD)
> **Phiên bản:** 2.0  
> **Dành cho:** Agent C (ui-user), Agent D (ui-admin), Agent QA và toàn bộ nhóm phát triển.  
> **Mục tiêu:** Cung cấp bộ quy chuẩn giao diện người dùng nhất quán, hiện đại, hỗ trợ Dark Mode tự động & thủ công, hiệu ứng skeleton, empty state, toast notifications và responsive mobile-first.

---

## 1. Nguyên Tắc Thiết Kế Cốt Lõi

1. **Shopee Brand Identity**: Màu sắc nhận diện cam Shopee (`#ee4d2d`), các gradient năng động, biểu tượng thương mại điện tử trực quan.
2. **Mobile-First & Responsive**: Mọi thành phần đều hiển thị tối ưu trên thiết bị di động (<= 576px), máy tính bảng (<= 992px) và máy tính để bàn (>= 1200px).
3. **Dual Theme (Light & Dark Mode)**: Tự động phát hiện theo hệ điều hành (`prefers-color-scheme`) và hỗ trợ chuyển đổi tức thì qua nút bấm trên giao diện, lưu cấu hình vào `localStorage`.
4. **Trải Nghiệm Mượt Mà (Delightful UX)**: Tải dữ liệu có hiệu ứng Skeleton Shimmer, phản hồi hành động bằng Toast Notifications không chặn luồng (thay thế `alert()`), trạng thái trống (Empty State) tinh tế.
5. **Bảo Toàn Hợp Đồng Tuyệt Đối**: Tuân thủ 100% các ID, class, form input name và route được quy định trong `CONTRACT.md`.

---

## 2. Bảng Biến Thiết Kế (Design Tokens)

Tất cả các token được định nghĩa trong file `wwwroot/css/theme.css` và có thể sử dụng trực tiếp qua hàm `var(--tên-biến)`.

### 2.1. Màu Sắc (Colors)

| Biến CSS | Giá trị Light Mode | Giá trị Dark Mode | Mô tả |
| :--- | :--- | :--- | :--- |
| `--shopee-orange` | `#ee4d2d` | `#ee4d2d` | Màu cam chủ đạo thương hiệu |
| `--shopee-orange-hover` | `#d73211` | `#f04815` | Màu cam khi hover |
| `--shopee-orange-light` | `#fff5f2` | `rgba(238, 77, 45, 0.15)` | Nền cam nhạt cho badge, hover menu |
| `--shopee-gradient` | `linear-gradient(135deg, #ff5722, #ee4d2d 50%, #f6402e)` | Như trên | Gradient nút bấm chính |
| `--bg-page` | `#f6f7fb` | `#0f141c` | Màu nền toàn trang |
| `--bg-surface` | `#ffffff` | `#171f2c` | Nền thẻ card, bảng, modal, container |
| `--bg-surface-elevated` | `#ffffff` | `#202b3c` | Nền menu nổi, dropdown, popover |
| `--bg-surface-sunken` | `#f1f3f6` | `#111722` | Nền ô input, header bảng |
| `--text-primary` | `#1f2937` | `#f3f4f6` | Màu văn bản chính |
| `--text-secondary` | `#4b5563` | `#cbd5e1` | Màu văn bản phụ |
| `--text-muted` | `#9ca3af` | `#7e8b9e` | Màu văn bản mờ, chú thích |
| `--border-default` | `#e5e7eb` | `#2d3a4d` | Đường viền thông thường |
| `--border-subtle` | `#f3f4f6` | `#1e2838` | Đường kẻ phân cách mỏng |

### 2.2. Trạng Thái Nghiệp Vụ (Semantic Status)

| Loại | Background Token | Border Token | Text Token |
| :--- | :--- | :--- | :--- |
| **Thành công (Success)** | `--color-success-bg` | `--color-success-border` | `--color-success-text` (`#10b981`) |
| **Cảnh báo (Warning)** | `--color-warning-bg` | `--color-warning-border` | `--color-warning-text` (`#f59e0b`) |
| **Nguy hiểm / Hủy (Danger)** | `--color-danger-bg` | `--color-danger-border` | `--color-danger-text` (`#ef4444`) |
| **Thông tin (Info)** | `--color-info-bg` | `--color-info-border` | `--color-info-text` (`#3b82f6`) |

### 2.3. Khoảng Cách (Spacing) & Bo Góc (Radii)

- **Spacing Scale**:
  - `--space-1`: `4px`
  - `--space-2`: `8px`
  - `--space-3`: `12px`
  - `--space-4`: `16px`
  - `--space-5`: `20px`
  - `--space-6`: `24px`
  - `--space-8`: `32px`
- **Border Radius**:
  - `--radius-xs`: `4px` (tag, checkbox)
  - `--radius-sm`: `8px` (button, input, badge)
  - `--radius-md`: `12px` (card, modal, table)
  - `--radius-lg`: `16px` (hero banner, container)
  - `--radius-pill`: `9999px` (nút tròn, badge viên thuốc)

### 2.4. Đổ Bóng (Box Shadows)

- `--shadow-xs`: Đổ bóng rất nhẹ cho input
- `--shadow-sm`: Đổ bóng nhẹ cho card tĩnh
- `--shadow-md`: Đổ bóng trung bình khi hover
- `--shadow-lg`: Đổ bóng nổi bật cho dropdown, modal, toast
- `--shadow-glow`: Ánh cam phát sáng cho nút Shopee nổi bật

---

## 3. Dark Mode Guidelines

### 3.1. Cơ Chế Hoạt Động
- Trạng thái được lưu trong `localStorage.getItem('shopee_theme')` (`'dark'` hoặc `'light'`).
- Thẻ `<html>` và `<body>` được gắn thuộc tính `data-theme="dark"` khi chế độ tối kích hoạt.
- Có script anti-flicker trong `<head>` để tránh hiện tượng nháy trắng khi chuyển trang.

### 3.2. Nút Toggle Theme
Bất kỳ phần tử nào có class `.btn-theme-toggle` hoặc thuộc tính `data-theme-toggle` đều tự động kích hoạt tính năng đảo theme khi click:
```html
<button type="button" class="btn-theme-toggle" data-theme-toggle aria-label="Đổi giao diện">
    <i class="fa-solid fa-sun icon-sun"></i>
    <i class="fa-solid fa-moon icon-moon"></i>
</button>
```

### 3.3. JavaScript API
```javascript
// Lấy theme hiện tại ('dark' hoặc 'light')
const current = window.ShopeeTheme.getCurrentTheme();

// Chuyển đổi theme qua lại
window.ShopeeTheme.toggle();

// Ép áp dụng theme cụ thể
window.ShopeeTheme.applyTheme('dark', true);

// Lắng nghe sự kiện theme thay đổi (hữu ích cho vẽ lại Chart.js trong Admin)
window.addEventListener('shopeeThemeChange', function(e) {
    console.log('Theme mới là:', e.detail.theme);
});
```

---

## 4. Danh Sách UI Components Mẫu

### 4.1. Nút Bấm (Buttons)

```html
<!-- Nút chính màu cam Shopee có đổ bóng glow -->
<button class="btn-shopee">
    <i class="fa-solid fa-cart-plus"></i> Thêm vào giỏ
</button>

<!-- Nút viền cam viền mỏng -->
<button class="btn-shopee-outline">
    <i class="fa-solid fa-eye"></i> Xem chi tiết
</button>

<!-- Nút phụ thứ cấp -->
<button class="btn-shopee-secondary">
    <i class="fa-solid fa-arrow-left"></i> Quay lại
</button>

<!-- Kích cỡ -->
<button class="btn-shopee btn-shopee-sm">Nút nhỏ</button>
<button class="btn-shopee btn-shopee-lg">Nút to nổi bật</button>
```

### 4.2. Thẻ Khung (Cards)

```html
<div class="card-modern card-modern-hover">
    <div class="card-modern-header">
        <h5 class="mb-0 fw-bold">Tiêu đề Card</h5>
        <span class="badge-modern badge-status-approved">Hoạt động</span>
    </div>
    <div class="card-modern-body">
        Nội dung thông tin bên trong thẻ card...
    </div>
    <div class="card-modern-footer d-flex justify-content-end gap-2">
        <button class="btn-shopee-secondary btn-shopee-sm">Hủy</button>
        <button class="btn-shopee btn-shopee-sm">Xác nhận</button>
    </div>
</div>
```

### 4.3. Huy Hiệu Trạng Thái (Status Badges)

```html
<span class="badge-modern badge-status-pending">
    <i class="fa-solid fa-clock"></i> Chờ xử lý
</span>

<span class="badge-modern badge-status-approved">
    <i class="fa-solid fa-check"></i> Đã duyệt
</span>

<span class="badge-modern badge-status-shipping">
    <i class="fa-solid fa-truck"></i> Đang giao
</span>

<span class="badge-modern badge-status-completed">
    <i class="fa-solid fa-circle-check"></i> Hoàn thành
</span>

<span class="badge-modern badge-status-cancelled">
    <i class="fa-solid fa-ban"></i> Đã hủy
</span>
```

### 4.4. Ô Nhập Liệu & Form Controls

```html
<div class="mb-3">
    <label class="form-label fw-semibold">Tên sản phẩm</label>
    <input type="text" class="form-control-modern" placeholder="Nhập tên sản phẩm..." />
</div>

<div class="mb-3">
    <label class="form-label fw-semibold">Danh mục</label>
    <select class="form-select-modern">
        <option value="">-- Chọn danh mục --</option>
        <option value="1">Thời trang</option>
        <option value="2">Điện tử</option>
    </select>
</div>
```

### 4.5. Bảng Dữ Liệu Hiện Đại (Modern Table)

```html
<div class="table-modern-wrapper">
    <table class="table-modern">
        <thead>
            <tr>
                <th>Mã</th>
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Giá bán</th>
                <th>Trạng thái</th>
                <th class="text-end">Hành động</th>
            </tr>
        </thead>
        <tbody id="tableSanPham">
            <tr>
                <td>#1</td>
                <td><img src="/images/p1.jpg" width="48" height="48" class="rounded" /></td>
                <td class="fw-semibold">Áo Khoác Nam Thể Thao</td>
                <td class="text-danger fw-bold">299.000 ₫</td>
                <td><span class="badge-modern badge-status-approved">Còn hàng</span></td>
                <td class="text-end">
                    <button class="btn btn-sm btn-outline-primary me-1"><i class="fa-solid fa-pen"></i></button>
                    <button class="btn btn-sm btn-outline-danger"><i class="fa-solid fa-trash"></i></button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
```

---

## 5. Skeleton Loading Component

### 5.1. Các CSS Utility Classes
- `.skeleton`: Hiệu ứng shimmer ánh sáng lướt qua.
- `.skeleton-text`: Thanh chữ (mặc định chiều cao 14px).
- `.skeleton-text-sm`: Thanh chữ nhỏ (10px).
- `.skeleton-text-lg`: Thanh chữ to (20px).
- `.skeleton-circle`: Khối tròn (avatar, checkbox).
- `.skeleton-btn`: Khối nút bấm.
- `.skeleton-product-card`: Mockup khung sản phẩm chờ tải.

### 5.2. Cách Sử Dụng JavaScript Generator
Trong file `ui-core.js`, đã có sẵn các generator:

```javascript
// Tạo 8 card skeleton sản phẩm và chèn vào container:
const productContainer = document.getElementById('product-list');
productContainer.innerHTML = window.ShopeeUI.createProductSkeleton(8);

// Tạo 5 dòng skeleton cho bảng Admin:
const tbody = document.getElementById('tableSanPham');
tbody.innerHTML = window.ShopeeUI.createTableSkeleton(6, 5); // 6 cột, 5 dòng

// Tạo skeleton cho danh sách giỏ hàng:
const cartList = document.getElementById('cart-list');
cartList.innerHTML = window.ShopeeUI.createCartSkeleton(3);
```

---

## 6. Empty State Component

Dùng khi danh sách sản phẩm, giỏ hàng, bảng đơn hàng trống rỗng.

### 6.1. Mẫu HTML Tĩnh
```html
<div class="empty-state">
    <div class="empty-state-icon">
        <i class="fa-solid fa-cart-shopping"></i>
    </div>
    <div class="empty-state-title">Giỏ hàng của bạn còn trống</div>
    <div class="empty-state-desc">Hãy dạo quanh một vòng và chọn cho mình những món đồ ưng ý nhé!</div>
    <div class="empty-state-action">
        <a href="/" class="btn-shopee">Mua sắm ngay</a>
    </div>
</div>
```

### 6.2. Mẫu Tạo Qua JavaScript
```javascript
const html = window.ShopeeUI.createEmptyState({
    icon: 'fa-solid fa-box-open',
    title: 'Chưa có đơn hàng nào',
    desc: 'Bạn chưa phát sinh đơn hàng nào gần đây.',
    actionText: 'Tiếp tục mua hàng',
    actionLink: '/'
});
document.getElementById('donHangContainer').innerHTML = html;
```

---

## 7. Toast Notification System

Thay thế toàn bộ `alert()` thô sơ bằng toast góc phải trên cùng (hoặc góc dưới trên mobile).

### 7.1. Cú Pháp Sử Dụng

```javascript
// Thông báo thành công
toast.success('Đã thêm sản phẩm vào giỏ hàng thành công!');

// Thông báo thất bại
toast.error('Số lượng tồn kho không đủ để đặt hàng.');

// Cảnh báo
toast.warning('Vui lòng chọn ít nhất một sản phẩm trước khi thanh toán.');

// Thông tin chung
toast.info('Hệ thống đang bảo trì một số tính năng thanh toán online.');

// Tùy biến đầy đủ tham số: showToast(message, type, duration, title)
showToast('Đơn hàng #1024 đã được tạo', 'success', 5000, 'Tạo Đơn Thành Công');
```

> **Lưu ý tương thích**: Hàm `window.alert("...")` đã được tự động bọc (wrapped) sang `showToast(msg, 'info')`, do đó mọi lệnh `alert` cũ vẫn hiển thị thành thông báo giao diện đẹp mắt mà không làm treo tiến trình trình duyệt.

---

## 8. Hướng Dẫn Tích Hợp Cho Agent C (ui-user) và Agent D (ui-admin)

### 8.1. Dành cho Agent C (ui-user)
- Layout đã tự động import `theme.css`, `site.css` và `ui-core.js`.
- Không xoá form tìm kiếm: `form asp-controller="Home" asp-action="Index" method="get"`, `input[name="keyword"]`, `.btn-search`.
- Giữ nguyên các hàm `scrollCategory(-1)`, `scrollCategory(1)`, `increaseQty()`, `decreaseQty()`, `themVaoGio(id)`, `muaNgay(id)`, `tangSoLuong(id)`, `giamSoLuong(id)`, `xoaKhoiGio(id)`, `thanhToanGioHang()`.
- Giữ nguyên các selector: `#mainProductImage`, `#qtyInput`, `#checkAll`, `#checkAllFooter`, `.item-check`, `#tongTien`.
- Có thể dùng các class `.card-modern`, `.btn-shopee`, `.badge-modern`, `ShopeeUI.createProductSkeleton()`, `toast.success()`.

### 8.2. Dành cho Agent D (ui-admin)
- Layout admin đã tích hợp sẵn `theme.css`, `admin.css` và `ui-core.js`.
- Giữ nguyên form tìm kiếm sản phẩm admin: `asp-controller="VwQuanTri" asp-action="SanPham" method="get"`, `input[name="keyword"]`.
- Giữ nguyên các bảng và dòng: `#tableDanhMuc`, `#row_{id}`, `#tableSanPham`, `#tableDonHang`, `#status_{id}`, `#action_{id}`.
- Giữ nguyên các ID số liệu: `#tongSanPham`, `#tongDanhMuc`, `#tongDonHang`, `#doanhThu`, `#topSanPhamBody`, hàm `loadDashboard()`.
- Giữ nguyên modal `#modalThem`, form `#formThemDanhMuc`, form `#formThemSanPham`.
- Thay thế các lệnh `alert(...)` trong AJAX callbacks bằng `toast.success(...)` và `toast.error(...)`.

---
*Tài liệu được biên soạn bởi Agent B (ui-core) - ShopeeClone Project.*
