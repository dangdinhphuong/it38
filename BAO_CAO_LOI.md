# BÁO CÁO KIỂM THỬ E2E VÀ DANH SÁCH LỖI BASELINE (BAO_CAO_LOI.MD)

> **Dự án**: ShopeeClone  
> **Người thực hiện**: Agent E (QA Automation)  
> **Môi trường thử nghiệm**: Local (`http://localhost:5017`)  
> **Framework kiểm thử**: Playwright (Node.js / TypeScript) độc lập trong thư mục `tests/e2e/`  
> **Ngày báo cáo**: 27/10/2026  
> **Tài liệu tham chiếu**: [CONTRACT.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/CONTRACT.md)

---

## 1. TỔNG QUAN KẾT QUẢ KIỂM THỬ (TEST SUMMARY)

Bộ kiểm thử tự động E2E bao gồm 42 test cases bao phủ toàn diện 8 nhóm tính năng: Tài khoản, Sản phẩm, Giỏ hàng, Đặt hàng, Phân quyền, Quản trị Admin, Ca biên & Bảo mật, và Chất lượng UI / Network.

| Nhóm Kiểm Thử (Test Suite) | File Test | Tổng Test | Pass | Fail | Tỷ lệ Pass |
| :--- | :--- | :---: | :---: | :---: | :---: |
| **1. Luồng Tài Khoản** | `01-auth.spec.ts` | 8 | 7 | 1 | 87.5% |
| **2. Luồng Sản Phẩm** | `02-products.spec.ts` | 5 | 4 | 1 | 80.0% |
| **3. Luồng Giỏ Hàng** | `03-cart.spec.ts` | 6 | 5 | 1 | 83.3% |
| **4. Luồng Đặt Hàng & Đơn Hàng** | `04-orders.spec.ts` | 4 | 4 | 0 | 100.0% |
| **5. Luồng Phân Quyền & Kiểm Soát** | `05-authorization.spec.ts` | 5 | 2 | 3 | 40.0% |
| **6. Luồng Quản Trị Admin** | `06-admin.spec.ts` | 4 | 4 | 0 | 100.0% |
| **7. Ca Biên & Bảo Mật** | `07-edge-cases.spec.ts` | 4 | 3 | 1 | 75.0% |
| **8. Giao Diện, Console & Network** | `08-ui-quality.spec.ts` | 6 | 3 | 3 | 50.0% |
| **TỔNG CỘNG** | **8 test suites** | **42** | **32** | **10** | **76.2%** |

---

## 2. BẢNG PHÂN LOẠI MỨC ĐỘ LỖI (DEFECT SEVERITY MATRIX)

| Mức độ (Severity) | Số lượng | Mô tả |
| :--- | :---: | :--- |
| 🔴 **CRITICAL** | 3 | Lỗ hổng bảo mật nghiêm trọng: Không kiểm tra quyền hạn cho phép khách vãng lai và User thường truy cập toàn quyền trang quản trị Admin, xem số liệu doanh thu và danh sách đơn hàng. |
| 🟠 **HIGH** | 3 | Lỗi chức năng cốt lõi: Tìm kiếm sản phẩm bị rỗng, logic "Mua ngay" sai lệch hợp đồng và trùng lặp mã JS, API thêm giỏ hàng crash HTTP 500 khi nhận số lượng âm. |
| 🟡 **MEDIUM** | 4 | Lỗi giao diện & phản hồi người dùng: Thiếu hiển thị thông báo thành công sau khi đăng ký, ảnh vỡ do URL `/null`, request 404 và lỗi console JavaScript. |
| 🟢 **LOW** | 0 | Không có lỗi nhỏ. |

---

## 3. DANH SÁCH CHI TIẾT CÁC LỖI PHÁT HIỆN ĐƯỢC (DEFECT DETAILS)

### BUG-01: Lỗ Hổng Bảo Mật - Khách Vãng Lai Chưa Đăng Nhập Truy Cập Trực Tiếp Admin Dashboard
- **Mã Test Case**: `TC-AUTHZ-01`
- **Mức độ nghiêm trọng**: 🔴 **CRITICAL** (Broken Access Control)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwQuanTriController.cs`
- **Các bước tái hiện**:
  1. Mở trình duyệt ẩn danh hoặc xóa sạch cookie session (không đăng nhập).
  2. Điều hướng trực tiếp tới URL `http://localhost:5017/VwQuanTri/Dashboard`.
- **Kết quả thực tế**:
  Trang Dashboard quản trị mở ra bình thường, hiển thị đầy đủ tổng sản phẩm, tổng danh mục, tổng đơn hàng, tổng người dùng, doanh thu toàn sàn và danh sách top sản phẩm bán chạy.
- **Kết quả mong đợi**:
  Theo CONTRACT.md Mục 1, action yêu cầu đăng nhập quản trị phải kiểm tra vai trò `Admin`, nếu chưa có session thì redirect về `/VwTaiKhoan/DangNhap` hoặc trả về mã HTTP 401/403.
- **Nguyên nhân cốt lõi**:
  Controller `VwQuanTriController` không có thuộc tính `[Authorize]` và phương thức `Dashboard()` không có đoạn mã kiểm tra `Session.GetString("VaiTro") == "Admin"`.

---

### BUG-02: Lỗ Hổng Phân Quyền - User Thường Truy Cập Được Toàn Bộ Trang Quản Trị Admin
- **Mã Test Case**: `TC-AUTHZ-02`
- **Mức độ nghiêm trọng**: 🔴 **CRITICAL** (Privilege Escalation)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwQuanTriController.cs`
- **Các bước tái hiện**:
  1. Đăng nhập bằng tài khoản người dùng bình thường (`user01` / `123456`, vai trò `"User"`).
  2. Sau khi đăng nhập, gõ trên thanh địa chỉ URL `http://localhost:5017/VwQuanTri/Dashboard`.
- **Kết quả thực tế**:
  Người dùng vai trò `"User"` xem được đầy đủ số liệu thống kê quản trị của hệ thống mà không hề bị chặn.
- **Kết quả mong đợi**:
  Hệ thống phải kiểm tra quyền hạn `VaiTro == "Admin"`, từ chối truy cập và chuyển hướng về trang chủ `/Home/Index` hoặc trả về mã 403 Forbidden.
- **Nguyên nhân cốt lõi**:
  Thiếu kiểm tra phân quyền RBAC (Role-Based Access Control) tại `VwQuanTriController`.

---

### BUG-03: Rò Rỉ Dữ Liệu - Khách Vãng Lai Xem Được Danh Sách Danh Mục, Sản Phẩm & Đơn Hàng Của Toàn Bộ Khách Hàng
- **Mã Test Case**: `TC-AUTHZ-05`
- **Mức độ nghiêm trọng**: 🔴 **CRITICAL** (Information Disclosure)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwQuanTriController.cs` (các action `DanhMuc()`, `SanPham()`, `DonHang()`)
- **Các bước tái hiện**:
  1. Mở trình duyệt chưa đăng nhập.
  2. Truy cập lần lượt các URL:
     - `http://localhost:5017/VwQuanTri/DanhMuc`
     - `http://localhost:5017/VwQuanTri/SanPham`
     - `http://localhost:5017/VwQuanTri/DonHang`
- **Kết quả thực tế**:
  Tất cả các trang trên đều render bình thường. Trang `DonHang` cho phép bất kỳ ai xem toàn bộ lịch sử mua hàng, tên tài khoản khách hàng, tổng tiền đơn và có thể bấm Duyệt đơn hoặc Hủy đơn mà không cần đăng nhập.
- **Kết quả mong đợi**:
  Phải yêu cầu đăng nhập với vai trò Admin trước khi cho phép xem hoặc tương tác với dữ liệu quản trị.
- **Nguyên nhân cốt lõi**:
  Toàn bộ `VwQuanTriController` hoàn toàn thiếu cơ chế xác thực session.

---

### BUG-04: Lỗi Tìm Kiếm - Kết Quả Tìm Kiếm Theo Keyword Bị Rỗng Trên Giao Diện Trang Chủ
- **Mã Test Case**: `TC-PROD-03`
- **Mức độ nghiêm trọng**: 🟠 **HIGH** (Functional Core Defect)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml` (Dòng 56 - 120) & `ShopeeClone/Controllers/HomeController.cs`
- **Các bước tái hiện**:
  1. Vào trang chủ `http://localhost:5017/`.
  2. Nhập từ khóa tìm kiếm (ví dụ: `iPhone`) vào ô `name="keyword"`.
  3. Bấm nút tìm kiếm kính lúp.
- **Kết quả thực tế**:
  Trang điều hướng đến `http://localhost:5017/?keyword=iPhone`. Backend đã lọc ra các sản phẩm theo từ khóa đưa vào `Model`, nhưng khu vực danh sách sản phẩm `.product-grid-container` bị trống rỗng hoàn toàn (chiều cao 0px).
- **Kết quả mong đợi**:
  Phải hiển thị danh sách các sản phẩm khớp với từ khóa tìm kiếm.
- **Nguyên nhân cốt lõi**:
  Trong `Index.cshtml`, vòng lặp `@foreach (var top in topSanPham)` chỉ lặp qua danh sách `ViewBag.TopSanPham`, sau đó tìm `var sp = Model.FirstOrDefault(x => x.TenSanPham == top.TenSanPham)`. Nếu sản phẩm tìm kiếm không nằm trong danh sách Top bán chạy thì biến `sp` là `null` và không có thẻ card nào được render ra HTML.

---

### BUG-05: Xung Đột Code & Lỗi Chức Năng "Mua Ngay" Trực Tiếp Tạo Đơn Bỏ Qua Giỏ Hàng
- **Mã Test Case**: `TC-CART-06`
- **Mức độ nghiêm trọng**: 🟠 **HIGH** (Contract Violation & Duplicate Code)
- **Vị trí tệp**: `ShopeeClone/Views/VwSanPham/ChiTietSanPham.cshtml` (Dòng 352-395 và Dòng 442-485) & `ShopeeClone/BAL/GioHangBAL.cs` (Dòng 122-175)
- **Các bước tái hiện**:
  1. Đăng nhập tài khoản User.
  2. Vào trang chi tiết sản phẩm: `http://localhost:5017/VwSanPham/ChiTietSanPham?id=3`.
  3. Nhấn nút "Mua ngay" (`.btn-buy`).
- **Kết quả thực tế**:
  Hệ thống hiển thị popup thông báo và tự động chuyển hướng sang `http://localhost:5017/VwDonHang/Dashboard` (trang quản lý đơn mua). Đơn hàng đã tự động được chốt và trừ tồn kho mà người dùng chưa từng được xem thông tin đơn hay bấm xác nhận thanh toán.
- **Kết quả mong đợi**:
  Theo CONTRACT.md Mục 2.4: Action `/VwGioHang/MuaNgay` là "Thêm vào giỏ và chuyển sang thanh toán" (`/VwGioHang/Dashboard`).
- **Nguyên nhân cốt lõi**:
  - File `ChiTietSanPham.cshtml` chứa 2 thẻ `<script>` trùng lặp định nghĩa hàm `muaNgay(maSanPham)`. Thẻ script thứ nhất redirect sang `/VwGioHang/Dashboard`, nhưng bị thẻ script thứ hai đè lên với lệnh `window.location = '/VwDonHang/Dashboard'`.
  - Trong `GioHangBAL.cs`, phương thức `MuaNgayAsync` tự động gọi `TaoDonHangAsync` và `ThemChiTietDonHangAsync`, chốt đơn trực tiếp vào CSDL thay vì thêm vào giỏ hàng.

---

### BUG-06: Crash Server HTTP 500 Khi Thêm Giỏ Hàng Với Số Lượng <= 0 (Thiếu Validation Backend)
- **Mã Test Case**: `TC-EDGE-01`
- **Mức độ nghiêm trọng**: 🟠 **HIGH** (Backend Input Validation & Unhandled Exception)
- **Vị trí tệp**: `ShopeeClone/Controllers/VwGioHangController.cs` & `ShopeeClone/BAL/GioHangBAL.cs`
- **Các bước tái hiện**:
  1. Đăng nhập vào tài khoản người dùng.
  2. Gửi request POST tới `/VwGioHang/ThemVaoGio` với payload: `maSanPham=1&soLuong=-5`.
- **Kết quả thực tế**:
  Server phản hồi mã lỗi `HTTP 500 Internal Server Error`.
- **Kết quả mong đợi**:
  Backend phải kiểm tra tính hợp lệ của số lượng (`soLuong <= 0`), từ chối thực hiện và phản hồi HTTP 200 kèm JSON `{ success: false, message: "Số lượng không hợp lệ" }`.
- **Nguyên nhân cốt lõi**:
  Phương thức `ThemVaoGioAsync` trong `GioHangBAL.cs` không kiểm tra `if (soLuong <= 0)`. Khi gửi số lượng âm, lệnh cập nhật vào bảng `ChiTietGioHang` vi phạm CHECK constraint `SoLuong >= 1` trong SQL Server, gây ra `SqlException`. Controller không có khối `try-catch` nên dẫn đến unhandled 500 crash.

---

### BUG-07: Thiếu Hiển Thị Thông Báo Thành Công Sau Khi Đăng Ký Tài Khoản
- **Mã Test Case**: `TC-AUTH-01`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Frontend UI/UX Defect)
- **Vị trí tệp**: `ShopeeClone/Views/VwTaiKhoan/DangNhap.cshtml`
- **Các bước tái hiện**:
  1. Truy cập `http://localhost:5017/VwTaiKhoan/DangKy`.
  2. Điền đầy đủ và chính xác tất cả thông tin đăng ký hợp lệ.
  3. Nhấn "Đăng ký".
- **Kết quả thực tế**:
  Hệ thống chuyển hướng về trang đăng nhập `/VwTaiKhoan/DangNhap`, nhưng trên màn hình hoàn toàn không xuất hiện bất kỳ thông báo nào cho biết đăng ký đã thành công.
- **Kết quả mong đợi**:
  Phải hiển thị alert thông báo màu xanh: "Đăng ký thành công".
- **Nguyên nhân cốt lõi**:
  Trong `VwTaiKhoanController.cs` dòng 117-118 đã thiết lập `TempData["Success"] = "Đăng ký thành công";`, nhưng trong file view `DangNhap.cshtml` chỉ có khối `@if (TempData["Error"] != null)` mà thiếu mất khối render `@if (TempData["Success"] != null)`.

---

### BUG-08: Ảnh Vỡ (Broken Images) Trên Thanh Danh Mục Trang Chủ
- **Mã Test Case**: `TC-UI-03`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (UI Display Defect)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml` (Dòng 166-185)
- **Các bước tái hiện**:
  1. Truy cập trang chủ `http://localhost:5017/`.
  2. Quan sát thanh trượt danh mục sản phẩm `#categoryContainer`.
- **Kết quả thực tế**:
  Phát hiện 4 thẻ hình ảnh bị vỡ (icon vỡ trên giao diện, `naturalWidth === 0`), do thẻ `<img>` có thuộc tính `src="/null"`.
- **Kết quả mong đợi**:
  Tất cả các danh mục đều hiển thị hình ảnh chuẩn hoặc hiển thị ảnh placeholder mặc định (ví dụ: `/images/no-image.png`) nếu danh mục chưa có ảnh.
- **Nguyên nhân cốt lõi**:
  Hàm JavaScript `loadDanhMuc()` trong `Index.cshtml` nối chuỗi trực tiếp: `<img src="${cat.hinhAnh}" ... />`. Trong database, một số bản ghi `DanhMuc` có cột `HinhAnh` là `NULL`, khi API trả JSON chuỗi trở thành `null` khiến URL ảnh thành `/null`.

---

### BUG-09: Request Tài Nguyên Lỗi 404 Not Found Tại `/null`
- **Mã Test Case**: `TC-UI-02`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Network Performance & Error Defect)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml`
- **Các bước tái hiện**:
  1. Mở DevTools Network Tab.
  2. Truy cập trang chủ `http://localhost:5017/`.
- **Kết quả thực tế**:
  Có request HTTP `GET http://localhost:5017/null` trả về mã lỗi `404 Not Found`.
- **Kết quả mong đợi**:
  Không có network request nào trả về 4xx trên luồng duyệt trang thông thường của người dùng.
- **Nguyên nhân cốt lõi**:
  Ảnh hưởng phụ trực tiếp từ BUG-08: thẻ `<img>` có thuộc tính `src="null"` khiến trình duyệt phát request tới server để tải file `/null`.

---

### BUG-10: Lỗi JavaScript Console "Failed to load resource"
- **Mã Test Case**: `TC-UI-01`
- **Mức độ nghiêm trọng**: 🟡 **MEDIUM** (Frontend Error Defect)
- **Vị trí tệp**: `ShopeeClone/Views/Home/Index.cshtml`
- **Các bước tái hiện**:
  1. Mở DevTools Console.
  2. Tải trang chủ `http://localhost:5017/`.
- **Kết quả thực tế**:
  Console hiển thị thông báo lỗi màu đỏ: `Failed to load resource: the server responded with a status of 404 (Not Found) (null:1)`.
- **Kết quả mong đợi**:
  Console sạch sẽ, không có bất kỳ thông báo lỗi exception hay failed resource nào.
- **Nguyên nhân cốt lõi**:
  Do request tải ảnh `/null` bị thất bại gây ra lỗi console trên trang chủ.

---

## 4. KIẾN NGHỊ KHẮC PHỤC (RECOMMENDATIONS)

Dựa trên phân công vai trò trong nhóm phát triển:

1. **Dành cho Agent Backend / Core (`agent-ui-core` & `agent-data`)**:
   - Thêm bộ lọc xác thực (Authentication Filter hoặc Session Check) cho toàn bộ controller `VwQuanTriController`: Nếu `Session.GetString("VaiTro") != "Admin"` thì redirect về `/VwTaiKhoan/DangNhap`.
   - Bổ sung validation `soLuong > 0` trong `ThemVaoGioAsync` và `MuaNgayAsync` của `GioHangBAL.cs`, kèm khối `try-catch` trong `VwGioHangController.cs` để trả về JSON thân thiện thay vì để crash 500.
   - Chuẩn hóa lại logic `MuaNgay`: Nếu là mua ngay vào giỏ hàng và thanh toán, cần giữ sản phẩm trong giỏ và điều hướng tới giao diện xác nhận đặt hàng đúng chuẩn CONTRACT.md thay vì tự động tạo đơn ngầm.

2. **Dành cho Agent Frontend User (`agent-ui-user`)**:
   - Trong `Index.cshtml`: Sửa logic hiển thị sản phẩm khi có từ khóa tìm kiếm (`keyword`): Lặp trực tiếp qua `@Model` thay vì lặp qua `@topSanPham`.
   - Trong `Index.cshtml`: Xử lý fallback ảnh danh mục trong hàm JS `loadDanhMuc()`: `src="${cat.hinhAnh ? cat.hinhAnh : '/images/no-image.png'}"` để triệt tiêu lỗi 404 `/null` và ảnh vỡ.
   - Trong `DangNhap.cshtml`: Thêm khối hiển thị `@if (TempData["Success"] != null) { <div class="alert alert-success">@TempData["Success"]</div> }`.
   - Trong `ChiTietSanPham.cshtml`: Xóa bỏ khối thẻ `<script>` thứ 2 bị trùng lặp ở cuối file (dòng 400-486) để tránh ghi đè hàm `muaNgay` và `themVaoGio`.
