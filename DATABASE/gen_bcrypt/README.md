# Tool Tạo Mật Khẩu Mã Hóa Cho ShopeeClone

Thư mục này chứa công cụ CLI để sinh mã băm mật khẩu phục vụ việc tạo dữ liệu mẫu (seed data) và kiểm thử hệ thống ShopeeClone.

## 1. Cơ Chế Mật Khẩu Hiện Tại Của ShopeeClone
- Ứng dụng ShopeeClone đang sử dụng hàm `MaHoaHelper.MaHoaSHA256(string input)` (trong `ShopeeClone/Helpers/MaHoaHelper.cs`).
- Procedure `sp_DangNhap` trong CSDL so sánh chuỗi mật khẩu trực tiếp (`WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau`).
- Ví dụ:
  - Mật khẩu `123456` -> `8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92`
  - Mật khẩu `Admin@123` -> `e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7`

## 2. Hướng Dẫn Sử Dụng Tool (Node.js)

```bash
# Cài đặt dependency (nếu chạy lần đầu)
npm install

# Xem mã băm mẫu của tất cả các mật khẩu thông dụng
node index.js --all

# Băm một mật khẩu tùy ý (xuất cả SHA-256 và BCrypt)
node index.js "MatKhauCuaBan"

# Chỉ lấy mã SHA-256 (dùng trực tiếp cho App hiện tại)
node index.js --sha256 "123456"

# Chỉ lấy mã BCrypt
node index.js --bcrypt "123456"

# Kiểm tra mật khẩu có khớp với hash BCrypt không
node index.js --verify "123456" "$2b$10$PM1b25xI/fR.sBfAIuiXc.J2GGERzhmf6R2bSP8X9UKFHOf.n25ee"
```

## 3. Hướng Dẫn Sử Dụng Tool (Python)

```bash
python3 hash_tool.py "123456"
```
