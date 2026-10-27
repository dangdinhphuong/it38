# BÁO CÁO KIỂM THỬ E2E VÀ DANH SÁCH LỖI BASELINE (BAO_CAO_LOI.MD)

> **Dự án**: ShopeeClone  
> **Người thực hiện**: Agent E (QA Automation) & Orchestrator  
> **Môi trường thử nghiệm**: Local Kestrel (`http://localhost:5018`) / Docker (`http://localhost:5017`)  
> **Framework kiểm thử**: Playwright (Node.js / TypeScript) độc lập trong thư mục `tests/e2e/`  
> **Ngày báo cáo**: 27/10/2026  
> **Tài liệu tham chiếu**: [CONTRACT.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/CONTRACT.md)  
> **Trạng thái**: ✅ **100% ĐÃ KHẮC PHỤC & NGHIỆM THU ĐẠT CHUẨN**

---

## 1. TỔNG QUAN KẾT QUẢ KIỂM THỬ (TEST SUMMARY)

Bộ kiểm thử tự động E2E bao gồm 42 test cases bao phủ toàn diện 8 nhóm tính năng: Tài khoản, Sản phẩm, Giỏ hàng, Đặt hàng, Phân quyền, Quản trị Admin, Ca biên & Bảo mật, và Chất lượng UI / Network.

### Kết Quả Nghiệm Thu Sau Khắc Phục (Final Status):

| Nhóm Kiểm Thử (Test Suite) | File Test | Tổng Test | Baseline Pass | Final Pass | Trạng Thái |
| :--- | :--- | :---: | :---: | :---: | :---: |
| **1. Luồng Tài Khoản** | `01-auth.spec.ts` | 8 | 7 | **8/8** | ✅ PASSED (100%) |
| **2. Luồng Sản Phẩm** | `02-products.spec.ts` | 5 | 4 | **5/5** | ✅ PASSED (100%) |
| **3. Luồng Giỏ Hàng** | `03-cart.spec.ts` | 6 | 5 | **6/6** | ✅ PASSED (100%) |
| **4. Luồng Đặt Hàng & Đơn Hàng** | `04-orders.spec.ts` | 4 | 4 | **4/4** | ✅ PASSED (100%) |
| **5. Luồng Phân Quyền & Kiểm Soát** | `05-authorization.spec.ts` | 5 | 2 | **5/5** | ✅ PASSED (100%) |
| **6. Luồng Quản Trị Admin** | `06-admin.spec.ts` | 4 | 4 | **4/4** | ✅ PASSED (100%) |
| **7. Ca Biên & Bảo Mật** | `07-edge-cases.spec.ts` | 4 | 3 | **4/4** | ✅ PASSED (100%) |
| **8. Giao Diện, Console & Network** | `08-ui-quality.spec.ts` | 6 | 3 | **6/6** | ✅ PASSED (100%) |
| **TỔNG CỘNG** | **8 test suites** | **42** | **32 (76.2%)** | **42/42 (100%)** | 🏆 **HOÀN THÀNH TOÀN DIỆN** |

---

## 2. BẢNG PHÂN LOẠI MỨC ĐỘ LỖI VÀ KẾT QUẢ XỬ LÝ

| Mức độ (Severity) | Số lượng | Mô tả | Trạng Thái Xử Lý |
| :--- | :---: | :--- | :---: |
| 🔴 **CRITICAL** | 3 | Lỗ hổng bảo mật nghiêm trọng: Không kiểm tra quyền hạn cho phép khách vãng lai và User thường truy cập toàn quyền trang quản trị Admin, xem số liệu doanh thu và danh sách đơn hàng. | ✅ **Đã sửa 3/3** |
| 🟠 **HIGH** | 3 | Lỗi chức năng cốt lõi: Tìm kiếm sản phẩm bị rỗng, logic "Mua ngay" sai lệch hợp đồng và trùng lặp mã JS, API thêm giỏ hàng crash HTTP 500 khi nhận số lượng âm. | ✅ **Đã sửa 3/3** |
| 🟡 **MEDIUM** | 4 | Lỗi giao diện & phản hồi người dùng: Thiếu hiển thị thông báo thành công sau khi đăng ký, ảnh vỡ do URL `/null`, request 404 và lỗi console JavaScript. | ✅ **Đã sửa 4/4** |
| 🟢 **LOW** | 0 | Không có lỗi nhỏ. | - |

---

## 3. DANH SÁCH CHI TIẾT CÁC LỖI PHÁT HIỆN ĐƯỢC VÀ GIẢI PHÁP ĐÃ ÁP DỤNG

### BUG-01: Lỗ Hổng Bảo Mật - Khách Vãng Lai Chưa Đăng Nhập Truy Cập Trực Tiếp Admin Dashboard
- **Mã Test Case**: `TC-AUTHZ-01`
- **Mức độ nghiêm trọng**: 🔴 **CRITICAL** (Broken Access Control)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwQuanTriController.cs`
- **Các bước tái hiện**:
  1. Mở trình duyệt ẩn danh hoặc xóa cookie session.
  2. Điều hướng trực tiếp tới URL `http://localhost:5018/VwQuanTri/Dashboard`.
- **Kết quả thực tế ban đầu**:
  Trang Dashboard quản trị mở ra bình thường, hiển thị đầy đủ tổng sản phẩm, danh mục, đơn hàng, người dùng, doanh thu.
- **Giải pháp đã áp dụng**:
  Thêm override filter `OnActionExecuting` trong `VwQuanTriController.cs` kiểm tra cả session `MaNguoiDung` và quyền `VaiTro == "Admin"`. Nếu chưa đăng nhập, tự động chuyển hướng về `/VwTaiKhoan/DangNhap`.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-AUTHZ-01)**

---

### BUG-02: Lỗ Hổng Phân Quyền - User Thường Truy Cập Được Toàn Bộ Trang Quản Trị Admin
- **Mã Test Case**: `TC-AUTHZ-02`
- **Mức độ nghiêm trọng**: 🔴 **CRITICAL** (Privilege Escalation)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwQuanTriController.cs`
- **Các bước tái hiện**:
  1. Đăng nhập bằng tài khoản người dùng bình thường (`user01` / `123456`, vai trò `"User"`).
  2. Điều hướng tới URL `http://localhost:5018/VwQuanTri/Dashboard`.
- **Kết quả thực tế ban đầu**:
  Người dùng vai trò `"User"` xem được đầy đủ số liệu thống kê quản trị của hệ thống.
- **Giải pháp đã áp dụng**:
  Trong `OnActionExecuting` của `VwQuanTriController.cs`, nếu `VaiTro != "Admin"` thì trả về `ForbidResult` (HTTP 403) hoặc redirect về trang chủ kèm cảnh báo.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-AUTHZ-02)**

---

### BUG-03: Rò Rỉ Dữ Liệu - Khách Vãng Lai Xem Được Danh Sách Danh Mục, Sản Phẩm & Đơn Hàng Của Toàn Bộ Khách Hàng
- **Mã Test Case**: `TC-AUTHZ-05`
- **Mức độ nghiêm trọng**: 🔴 **CRITICAL** (Information Disclosure)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwQuanTriController.cs` (các action `DanhMuc()`, `SanPham()`, `DonHang()`)
- **Các bước tái hiện**:
  1. Mở trình duyệt chưa đăng nhập, truy cập `/VwQuanTri/DanhMuc`, `/SanPham`, `/DonHang`.
- **Kết quả thực tế ban đầu**:
  Các trang render bình thường, ai cũng có thể duyệt đơn hoặc hủy đơn hàng của khách.
- **Giải pháp đã áp dụng**:
  Cơ chế kiểm tra `OnActionExecuting` áp dụng cho toàn bộ Controller `VwQuanTriController`, bảo vệ toàn bộ tất cả action quản trị.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-AUTHZ-05)**

---

### BUG-04: Lỗi Tìm Kiếm - Kết Quả Tìm Kiếm Theo Keyword Bị Rỗng Trên Giao Diện Trang Chủ
- **Mã Test Case**: `TC-PROD-03`
- **Mức độ nghiêm trọng**: 🟠 **HIGH** (Functional Core Defect)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml` & `ShopeeClone/Controllers/HomeController.cs`
- **Các bước tái hiện**:
  1. Nhập từ khóa tìm kiếm (ví dụ: `iPhone`) vào ô `name="keyword"`.
  2. Bấm nút Tìm kiếm.
- **Kết quả thực tế ban đầu**:
  Giao diện hiển thị danh sách rỗng dù database có chứa sản phẩm phù hợp.
- **Giải pháp đã áp dụng**:
  Tách bạch luồng hiển thị trong `Index.cshtml`: Khi có `keyword`, render trực tiếp danh sách kết quả `@Model` thay vì lặp qua biến `@topSanPham`.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-PROD-03)**

---

### BUG-05: Lỗi Chức Năng "Mua Ngay" - Trùng Lặp Mã JavaScript Khiến Redirect Sai Hướng
- **Mã Test Case**: `TC-CART-06`
- **Mức độ nghiêm trọng**: 🟠 **HIGH** (Business Logic Defect)
- **Vị trí tệp**: `ShopeeClone/Views/VwSanPham/ChiTietSanPham.cshtml`
- **Các bước tái hiện**:
  1. Vào chi tiết sản phẩm, bấm "Mua Ngay".
- **Kết quả thực tế ban đầu**:
  Bị redirect nhầm sang `/VwDonHang/Dashboard` thay vì thêm vào giỏ và chuyển sang giỏ hàng/thanh toán.
- **Giải pháp đã áp dụng**:
  Xóa khối `<script>` trùng lặp ở cuối file, chuẩn hóa hàm `muaNgay()` để thêm sản phẩm vào giỏ hàng và chuyển hướng người dùng tới `/VwGioHang/Dashboard`.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-CART-06)**

---

### BUG-06: Crash Máy Chủ (HTTP 500) Khi Thêm Giỏ Hàng Với Số Lượng Âm Hoặc Bằng 0
- **Mã Test Case**: `TC-EDGE-01`
- **Mức độ nghiêm trọng**: 🟠 **HIGH** (Crash / Unhandled Exception)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwGioHangController.cs`
- **Các bước tái hiện**:
  1. Gửi request AJAX POST `/VwGioHang/ThemVaoGio` với payload `{ maSanPham: 1, soLuong: 0 }` hoặc `{ soLuong: -5 }`.
- **Kết quả thực tế ban đầu**:
  Server ném ngoại lệ không xử lý và phản hồi HTTP 500 Internal Server Error.
- **Giải pháp đã áp dụng**:
  Thêm validation đầu vào: `if (soLuong <= 0) return Json(new { success = false, message = "Số lượng không hợp lệ" });`.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-EDGE-01)**

---

### BUG-07: Thiếu Thông Báo Phản Hồi Sau Khi Đăng Ký Tài Khoản Thành Công
- **Mã Test Case**: `TC-AUTH-01`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Missing Feedback)
- **Vị trí tệp**: `ShopeeClone/Views/VwTaiKhoan/DangNhap.cshtml`
- **Các bước tái hiện**:
  1. Đăng ký tài khoản mới thành công tại `/VwTaiKhoan/DangKy`.
  2. Hệ thống chuyển hướng về `/VwTaiKhoan/DangNhap`.
- **Kết quả thực tế ban đầu**:
  Không có thông báo nào hiển thị cho người dùng biết việc tạo tài khoản đã thành công.
- **Giải pháp đã áp dụng**:
  Thêm khối render `@if (TempData["Success"] != null)` dạng alert/toast trên view `DangNhap.cshtml`.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-AUTH-01)**

---

### BUG-08: Thẻ Hình Ảnh Hiển Thị Thuộc Tính `src="null"` Gây Lỗi 404
- **Mã Test Case**: `TC-UI-03`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Broken Image Display)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml` (hàm `loadDanhMuc()`)
- **Các bước tái hiện**:
  1. Kiểm tra DOM các thẻ danh mục trên trang chủ.
- **Kết quả thực tế ban đầu**:
  Có thẻ `<img src="null">` dẫn đến việc trình duyệt gửi request tới `http://localhost:5018/null`.
- **Giải pháp đã áp dụng**:
  Thêm toán tử fallback trong template JavaScript: `src="${cat.hinhAnh ? cat.hinhAnh : '/images/no-image.png'}"` và tạo file placeholder `no-image.png`.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-UI-03)**

---

### BUG-09: Request Mạng Trả Về Lỗi HTTP 404 Đối Với Tài Nguyên Ảnh
- **Mã Test Case**: `TC-UI-02`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Network 404 Request)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml`
- **Các bước tái hiện**:
  1. Lắng nghe network tab khi tải trang chủ.
- **Kết quả thực tế ban đầu**:
  Request tới URL `/null` trả về HTTP status 404.
- **Giải pháp đã áp dụng**:
  Khắc phục triệt để cùng với BUG-08.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-UI-02)**

---

### BUG-10: Lỗi JavaScript Console "Failed to load resource"
- **Mã Test Case**: `TC-UI-01`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Frontend Error Defect)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml`
- **Các bước tái hiện**:
  1. Mở DevTools Console khi tải trang chủ.
- **Kết quả thực tế ban đầu**:
  Thông báo lỗi màu đỏ `Failed to load resource: the server responded with a status of 404 (Not Found) (null:1)`.
- **Giải pháp đã áp dụng**:
  Sửa đường dẫn ảnh fallback, Console hoàn toàn sạch sẽ, không còn bất kỳ lỗi nào.
- **Trạng thái**: ✅ **ĐÃ KHẮC PHỤC & VERIFIED (Pass TC-UI-01)**

---

## 4. BẰNG CHỨNG HÌNH ẢNH GIAO DIỆN (SCREENSHOTS)

Tất cả ảnh chụp màn hình kiểm thử thực tế được lưu trữ tại thư mục [docs/screenshots/](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/docs/screenshots):

1. **Trang Chủ (Home)**:
   - Light Mode: `docs/screenshots/home_light.png`
   - Dark Mode: `docs/screenshots/home_dark.png`
2. **Chi Tiết Sản Phẩm (Product Details)**:
   - Light Mode: `docs/screenshots/product_detail_light.png`
   - Dark Mode: `docs/screenshots/product_detail_dark.png`
3. **Giỏ Hàng (Cart)**:
   - Light Mode: `docs/screenshots/cart_light.png`
   - Dark Mode: `docs/screenshots/cart_dark.png`
4. **Đơn Mua Của Tôi (Orders)**:
   - Light Mode: `docs/screenshots/orders_light.png`
   - Dark Mode: `docs/screenshots/orders_dark.png`
5. **Bảng Điều Khiển Quản Trị (Admin Dashboard)**:
   - Light Mode: `docs/screenshots/admin_dashboard_light.png`
   - Dark Mode: `docs/screenshots/admin_dashboard_dark.png`
6. **Quản Lý Sản Phẩm Quản Trị (Admin Products)**:
   - Light Mode: `docs/screenshots/admin_products_light.png`
   - Dark Mode: `docs/screenshots/admin_products_dark.png`
7. **Giao Diện Di Động (Responsive Mobile 375px)**:
   - Light Mode: `docs/screenshots/mobile_home_light.png`
   - Dark Mode: `docs/screenshots/mobile_home_dark.png`

---

## 5. KẾT LUẬN VÀ NGHIỆM THU CHẤT LƯỢNG

Toàn bộ **10/10 lỗi (Bugs)** được phát hiện trong giai đoạn Baseline đều đã được sửa chữa tận gốc, tuân thủ nghiêm ngặt **100% hợp đồng kỹ thuật `CONTRACT.md`**. Toàn bộ **42/42 test cases Playwright** chạy kiểm thử tự động trên hệ thống đều vượt qua thành công (**100% PASS**), đảm bảo chất lượng hệ thống sẵn sàng vận hành thực tế.
