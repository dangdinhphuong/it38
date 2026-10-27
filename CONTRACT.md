# HỢP ĐỒNG BẤT BIẾN (CONTRACT.MD)
> **Dành cho tất cả các Agent con (agent-data, agent-ui-core, agent-ui-user, agent-ui-admin, agent-qa).**  
> **Quy tắc tuyệt đối**: Không thay đổi route, tên action, tên tham số, name/id của form input, các id/class mà JavaScript đang dùng, và logic BAL/DAL/Models.

---

## 1. Cơ Chế Authentication & Session
- **Session Key**:
  - `Context.Session.GetInt32("MaNguoiDung")`: ID người dùng hiện tại (int). Nếu `null` nghĩa là chưa đăng nhập.
  - `Context.Session.GetString("TenDangNhap")`: Tên đăng nhập của người dùng (string).
  - `Context.Session.GetString("VaiTro")`: Vai trò (`"Admin"` hoặc `"User"`).
- **Quy tắc chuyển trang đăng nhập**:
  - Bất kỳ action nào yêu cầu đăng nhập (`VwGioHang/*`, `VwDonHang/*`, `VwTaiKhoan/TaiKhoan`, `VwTaiKhoan/DoiMatKhau`), nếu chưa có session thì redirect về `/VwTaiKhoan/DangNhap` (hoặc trả JSON `{ success: false, message: "Vui lòng đăng nhập" }`).
  - Đăng nhập thành công với `VaiTro == "Admin"` -> chuyển hướng tới `/VwQuanTri/Dashboard`.
  - Đăng xuất: gọi `/VwTaiKhoan/DangXuat`, xóa session, redirect về `/Home/Index`.

---

## 2. Danh Sách Endpoint & Form / Param Contract

### 2.1. Home Controller (`/` hoặc `/Home`)
| Route | Method | Tham số / Input | Kiểu trả về | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| `/` hoặc `/Home/Index` | GET | `string? keyword` | View(List<SanPham>) | Trang chủ. `ViewBag.TopSanPham` chứa danh sách top sản phẩm bán chạy. |

### 2.2. API Danh Mục (`/api/danhmuc`)
| Route | Method | Tham số | Kiểu trả về (JSON) | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| `/api/danhmuc` | GET | Không | `[{ maDanhMuc, tenDanhMuc, hinhAnh }]` | Lấy danh sách toàn bộ danh mục |
| `/api/danhmuc/{id}` | GET | `int id` | `{ maDanhMuc, tenDanhMuc, hinhAnh }` | Lấy chi tiết danh mục |

### 2.3. Sản Phẩm (`/VwSanPham`)
| Route | Method | Tham số / Input | Kiểu trả về | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| `/VwSanPham/Dashboard` | GET | `int id`, `int page = 1` | View(DashboardViewModel) | Xem sản phẩm theo danh mục `id` và trang `page` |
| `/VwSanPham/ChiTietSanPham` | GET | `int id` | View(SanPham) | Chi tiết sản phẩm theo `id` (`MaSanPham`) |

### 2.4. Giỏ Hàng (`/VwGioHang`)
| Route | Method | Tham số / Body | Kiểu trả về (JSON) | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| `/VwGioHang/Dashboard` | GET | Không | View(List<ChiTietGioHang>) | Trang xem giỏ hàng |
| `/VwGioHang/ThemVaoGio` | POST | `int maSanPham`, `int soLuong = 1` | `{ success: bool, message: string }` | Thêm sản phẩm vào giỏ |
| `/VwGioHang/MuaNgay` | POST | `int maSanPham`, `int soLuong = 1` | `{ success: bool, message: string }` | Thêm vào giỏ và chuyển sang thanh toán |
| `/VwGioHang/Tang` | POST | `int id` (MaCTGioHang) | `{ success: bool, message: string }` | Tăng số lượng sản phẩm trong giỏ |
| `/VwGioHang/Giam` | POST | `int id` (MaCTGioHang) | `{ success: bool, message: string }` | Giảm số lượng sản phẩm trong giỏ |
| `/VwGioHang/Xoa` | POST | `int id` (MaCTGioHang) | `{ success: bool, message: string }` | Xóa sản phẩm khỏi giỏ |

### 2.5. Đơn Hàng (`/VwDonHang`)
| Route | Method | Tham số / Body | Kiểu trả về | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| `/VwDonHang/Dashboard` | GET | Không | View(List<DonHang>) | Xem danh sách đơn mua |
| `/VwDonHang/ThanhToan` | POST | `List<int> dsChiTiet` (danh sách MaCTGioHang) | JSON `{ success: bool, message: string }` | Tạo đơn hàng từ các món trong giỏ |

### 2.6. Tài Khoản (`/VwTaiKhoan`)
| Route | Method | Form Input Names | Mô tả |
| :--- | :--- | :--- | :--- |
| `/VwTaiKhoan/DangNhap` | GET & POST | `TenDangNhap`, `MatKhau` | Đăng nhập |
| `/VwTaiKhoan/DangKy` | GET & POST | `HoTen`, `TenDangNhap`, `Email`, `SoDienThoai`, `DiaChi`, `MatKhau`, `XacNhanMatKhau` | Đăng ký |
| `/VwTaiKhoan/DangXuat` | GET | Không | Đăng xuất |
| `/VwTaiKhoan/TaiKhoan` | GET & POST | `MaNguoiDung`, `HoTen`, `Email`, `SoDienThoai`, `DiaChi` | Cập nhật thông tin |
| `/VwTaiKhoan/DoiMatKhau` | GET & POST | `MatKhauCu`, `MatKhauMoi`, `XacNhanMatKhauMoi` | Đổi mật khẩu |
| `/VwTaiKhoan/QuenMatKhau` | GET & POST | `TenDangNhap`, `SoDienThoai`, `MatKhauMoi`, `XacNhanMatKhauMoi` | Quên mật khẩu |

### 2.7. Quản Trị Admin (`/VwQuanTri`)
| Route | Method | Tham số / FormData | Kiểu trả về | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| `/VwQuanTri/Dashboard` | GET | Không | View | Trang chủ admin |
| `/VwQuanTri/GetDashboardData` | GET | Không | JSON `{ tongSanPham, tongDanhMuc, tongDonHang, tongNguoiDung, doanhThu, topSanPham: [{ tenSanPham, tongBan }] }` | API số liệu dashboard |
| `/VwQuanTri/DanhMuc` | GET | Không | View(List<DanhMuc>) | Quản lý danh mục |
| `/VwQuanTri/ThemDanhMuc` | POST | FormData (`TenDanhMuc`, `fileAnh`) | JSON `{ success, data: { maDanhMuc, tenDanhMuc, hinhAnh } }` | Thêm danh mục |
| `/VwQuanTri/SuaDanhMuc` | POST | FormData (`MaDanhMuc`, `TenDanhMuc`, `HinhAnh`, `fileAnh`) | JSON `{ success, data: { maDanhMuc, tenDanhMuc, hinhAnh } }` | Sửa danh mục |
| `/VwQuanTri/XoaDanhMuc/{id}` | POST | `int id` | JSON `{ success: bool }` | Xóa danh mục |
| `/VwQuanTri/SanPham` | GET | `string? keyword` | View(List<SanPham>) | Quản lý sản phẩm |
| `/VwQuanTri/SanPhamTheoDanhMuc/{id}` | GET | `int id` | View(List<SanPham>) | Lọc sản phẩm theo danh mục |
| `/VwQuanTri/ThemSanPham` | POST | FormData (`TenSanPham`, `MoTa`, `Gia`, `SoLuongTon`, `MaDanhMuc`, `fileAnh`) | JSON `{ success, data: { maSanPham, tenSanPham, gia, soLuongTon, trangThai, hinhAnh, tenDanhMuc } }` | Thêm sản phẩm |
| `/VwQuanTri/SuaSanPham` | POST | FormData (`MaSanPham`, `TenSanPham`, `MoTa`, `Gia`, `SoLuongTon`, `MaDanhMuc`, `TrangThai`, `HinhAnh`, `fileAnh`) | JSON `{ success, data: ... }` | Sửa sản phẩm |
| `/VwQuanTri/XoaSanPham/{id}` | POST | `int id` | JSON `{ success: bool }` | Xóa sản phẩm |
| `/VwQuanTri/DonHang` | GET | Không | View(List<DonHang>) | Quản lý đơn hàng |
| `/VwQuanTri/DuyetDon/{id}` | POST | `int id` | JSON `{ success: bool }` | Duyệt đơn hàng |
| `/VwQuanTri/HuyDon/{id}` | POST | `int id` | JSON `{ success: bool }` | Hủy đơn hàng |

---

## 3. DOM Contract (Các ID, Class, Attribute mà JS / Test phụ thuộc)

### 3.1. Trang Chủ & Header
- Ô tìm kiếm: form GET về `/Home/Index` có input `name="keyword"`.
- Container load danh mục AJAX: `#categoryContainer`, thẻ danh mục `.category-item`.
- Nút cuộn danh mục: `onclick="scrollCategory(-1)"` và `onclick="scrollCategory(1)"`.

### 3.2. Trang Chi Tiết Sản Phẩm
- Ảnh chính: `#mainProductImage`.
- Số lượng mua: input `#qtyInput`.
- Nút tăng/giảm số lượng: gọi `increaseQty()`, `decreaseQty()`.
- Nút thêm vào giỏ: gọi `themVaoGio(maSanPham)`.
- Nút mua ngay: gọi `muaNgay(maSanPham)`.

### 3.3. Trang Giỏ Hàng
- Checkbox chọn tất cả: `#checkAll`, `#checkAllFooter`.
- Checkbox từng món: `.item-check` có `data-id="@item.MaCTGioHang"` và `data-price="@thanhTien"`.
- Hiển thị số lượng: `#qty-@item.MaCTGioHang`.
- Nút tăng: gọi `tangSoLuong(id)`. Nút giảm: gọi `giamSoLuong(id)`. Nút xóa: gọi `xoaKhoiGio(id)`.
- Tổng tiền hiển thị: `#tongTien`.
- Nút mua hàng: gọi `thanhToanGioHang()`.

### 3.4. Trang Quản Trị
- Dashboard: `#tongSanPham`, `#tongDanhMuc`, `#tongDonHang`, `#doanhThu`, `#topSanPhamBody`, hàm `loadDashboard()`.
- Danh mục: bảng `#tableDanhMuc`, các dòng `#row_{id}`, modal thêm `#modalThem`, form thêm `#formThemDanhMuc`, form sửa `.formSuaDanhMuc`, hàm xóa `xoaDanhMuc(id)`.
- Sản phẩm: bảng `#tableSanPham`, các dòng `#row_{id}`, modal thêm `#modalThem`, form thêm `#formThemSanPham`, form sửa `.formSuaSanPham`, hàm xóa `xoaSanPham(id)`.
- Đơn hàng: bảng `#tableDonHang`, dòng `#row_{id}`, cột trạng thái `#status_{id}`, cột thao tác `#action_{id}`, hàm duyệt `duyetDon(id)`, hàm hủy `huyDon(id)`.

---

## 4. Database Schema & Constraints Contract
- Bảng `NguoiDung`: `MaNguoiDung` (PK, IDENTITY), `TenDangNhap` (UNIQUE, <=50), `MatKhau` (BCrypt hash <=255), `VaiTro` (`'Admin'` hoặc `'User'`).
- Bảng `DanhMuc`: `MaDanhMuc` (PK, IDENTITY), `TenDanhMuc` (NVARCHAR(100)), `HinhAnh` (NVARCHAR(255)).
- Bảng `SanPham`: `MaSanPham` (PK, IDENTITY), `TenSanPham` (NVARCHAR(200)), `Gia` (DECIMAL(18,2) >= 0), `SoLuongTon` (INT >= 0), `MaDanhMuc` (FK), `TrangThai` IN (`N'Còn hàng'`, `N'Hết hàng'`, `N'Dừng bán'`).
- Bảng `GioHang`: `MaGioHang` (PK, IDENTITY), `MaNguoiDung` (FK, UNIQUE).
- Bảng `ChiTietGioHang`: `MaCTGioHang` (PK, IDENTITY), `MaGioHang` (FK), `MaSanPham` (FK), `SoLuong` (INT >= 1). UNIQUE(`MaGioHang`, `MaSanPham`).
- Bảng `DonHang`: `MaDonHang` (PK, IDENTITY), `MaNguoiDung` (FK), `TongTien` (DECIMAL(18,2)), `TrangThai` IN (`N'Chờ xử lý'`, `N'Đã duyệt'` / `N'Đang giao'`, `N'Hoàn thành'`, `N'Đã hủy'`).
- Bảng `ChiTietDonHang`: `MaCTDonHang` (PK, IDENTITY), `MaDonHang` (FK), `MaSanPham` (FK), `SoLuong` (INT >= 1), `DonGia` (DECIMAL(18,2)).

---
**Cam kết**: Mọi thay đổi mã nguồn của các Agent con phải bảo toàn 100% các contract trên.
