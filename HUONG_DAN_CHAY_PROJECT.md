# Hướng Dẫn Chạy Dự Án ShopeeClone Bằng Docker

Tài liệu này hướng dẫn cách build và chạy toàn bộ hệ thống website ShopeeClone (ASP.NET Core MVC .NET 10 + cơ sở dữ liệu Microsoft SQL Server 2022) bằng **Docker Compose** trên môi trường Linux mà không cần cài đặt SQL Server hay .NET SDK trực tiếp trên máy host.

---

## 1. Cấu Trúc Thành Phần Docker

- **`db` (SQL Server 2022)**: Container chạy `mcr.microsoft.com/mssql/server:2022-latest`, dữ liệu được lưu bền vững qua Docker volume `mssql_data`. Đã cấu hình healthcheck tự động kiểm tra trạng thái sẵn sàng của SQL Server.
- **`db-init` (Khởi tạo Database tự động)**: Tự động chạy script `DATABASE/QLSANPHAM.sql` ngay sau khi container `db` khỏe mạnh (healthy). Script có tính năng kiểm tra idempotent (chỉ khởi tạo khi database chưa có, không làm mất dữ liệu khi chạy lại nhiều lần).
- **`web` (ASP.NET Core MVC)**: Build multi-stage từ .NET 10 SDK và chạy trên ASP.NET Core 10 runtime. Ứng dụng tự động kết nối tới SQL Server trong container `db` qua biến môi trường `ConnectionStrings__DefaultConnection` mà không cần chỉnh sửa file `appsettings.json`.

---

## 2. Yêu Cầu Tiên Quyết

Máy tính cần cài đặt **Docker** và **Docker Compose**. Nếu máy Ubuntu của bạn chưa có Docker, hãy chạy các lệnh sau:

```bash
# Cài đặt Docker & Docker Compose plugin
sudo apt update
sudo apt install -y docker.io docker-compose-v2

# Thêm user hiện tại vào nhóm docker (để chạy docker không cần gõ sudo)
sudo usermod -aG docker $USER
newgrp docker
```

---

## 3. Cấu Hình Môi Trường (.env)

Hệ thống đã có sẵn file `.env` (và bản mẫu `.env.example`). Bạn có thể tùy chỉnh các tham số nếu cần:

| Biến môi trường | Ý nghĩa | Giá trị mặc định |
| :--- | :--- | :--- |
| `SA_PASSWORD` | Mật khẩu tài khoản `sa` của SQL Server | `ShopeeClone@2026!` |
| `APP_PORT` | Cổng HTTP truy cập website trên máy host | `5017` |
| `MSSQL_PORT` | Cổng SQL Server trên máy host | `1433` |
| `ASPNETCORE_ENVIRONMENT` | Môi trường ứng dụng ASP.NET Core | `Development` |

---

## 4. Các Lệnh Thao Tác Cơ Bản

Đứng tại thư mục gốc của dự án (`BTL_IT38.006_N8/`):

### 4.1. Khởi chạy toàn bộ hệ thống (Build & Run)

```bash
docker compose up -d --build
```
> Khi chạy lệnh trên:
> 1. Container `db` sẽ khởi động trước.
> 2. Khi `db` đạt trạng thái `healthy`, `db-init` sẽ tự động chạy để tạo cơ sở dữ liệu `QLSANPHAM` và nạp dữ liệu mẫu.
> 3. Khi `db-init` hoàn tất thành công, container `web` sẽ khởi động và sẵn sàng phục vụ tại cổng `5017`.

### 4.2. Kiểm tra trạng thái các container

```bash
docker compose ps
```

### 4.3. Xem log thời gian thực

- Xem log toàn bộ:
  ```bash
  docker compose logs -f
  ```
- Xem log riêng service Web:
  ```bash
  docker compose logs -f web
  ```
- Xem log quá trình khởi tạo Database:
  ```bash
  docker compose logs db-init
  ```
- Xem log SQL Server:
  ```bash
  docker compose logs -f db
  ```

### 4.4. Truy cập ứng dụng

Mở trình duyệt web hoặc dùng `curl`:
```bash
http://localhost:5017
```

### 4.5. Dừng hệ thống

```bash
docker compose down
```

### 4.6. Reset toàn bộ dữ liệu Database (Khởi tạo lại từ đầu)

Nếu muốn xóa toàn bộ database hiện tại và để `db-init` tự động nạp lại dữ liệu sạch từ file `DATABASE/QLSANPHAM.sql`:

```bash
# Dừng container và xóa volume dữ liệu mssql_data
docker compose down -v

# Khởi chạy lại từ đầu
docker compose up -d --build
```

---

## 5. Kiểm Tra Dữ Liệu Trong Database

Bạn có thể chạy truy vấn trực tiếp vào container `db` để kiểm tra dữ liệu:

```bash
# Kiểm tra số lượng sản phẩm (seed data >= 500)
docker compose exec db /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'ShopeeClone@2026!' -C -d QLSANPHAM -Q "SELECT COUNT(*) AS TongSoSanPham FROM SanPham;"

# Kiểm tra danh mục (seed data >= 20)
docker compose exec db /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'ShopeeClone@2026!' -C -d QLSANPHAM -Q "SELECT MaDanhMuc, TenDanhMuc FROM DanhMuc;"

# Kiểm tra danh sách người dùng (seed data >= 100)
docker compose exec db /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'ShopeeClone@2026!' -C -d QLSANPHAM -Q "SELECT MaNguoiDung, TenDangNhap, HoTen, VaiTro FROM NguoiDung;"

# Kiểm tra đơn hàng (seed data >= 300)
docker compose exec db /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'ShopeeClone@2026!' -C -d QLSANPHAM -Q "SELECT COUNT(*) AS TongSoDonHang, SUM(TongTien) AS DoanhThu FROM DonHang;"
```

---

## 6. Danh Sách Tài Khoản Demo

Hệ thống đã nạp sẵn hơn 120 tài khoản người dùng phục vụ kiểm thử và đánh giá mọi chức năng của website:

| Loại tài khoản | Tên đăng nhập (`TenDangNhap`) | Mật khẩu demo | Vai trò (`VaiTro`) | Quyền hạn & Chuyển hướng sau đăng nhập |
| :--- | :--- | :--- | :--- | :--- |
| **Quản trị viên (Admin)** | `Admin` | `123456` | `Admin` | Toàn quyền quản trị website. Sau khi đăng nhập được tự động chuyển hướng tới `/VwQuanTri/Dashboard`. |
| **Khách hàng mẫu 1** | `user01` | `123456` | `User` | Mua hàng, xem giỏ hàng, đặt đơn, lịch sử đơn hàng. Chuyển hướng về trang chủ `/`. |
| **Khách hàng mẫu 2** | `user02` | `123456` | `User` | Đã có sẵn sản phẩm trong giỏ hàng và lịch sử đơn hàng. |
| **Khách hàng mẫu 3** | `user03` | `123456` | `User` | Đã có sẵn sản phẩm trong giỏ hàng và lịch sử đơn hàng. |
| **Danh sách User còn lại** | `user04` đến `user99` (và `user100` đến `user119`) | `123456` | `User` | Hơn 100 tài khoản khách hàng thực tế trải dài khắp các tỉnh thành với đầy đủ giỏ hàng và đơn hàng. |

> **Ghi chú về cơ chế bảo mật mật khẩu:**
> - Mật khẩu được mã hóa chuẩn **SHA-256** tương thích 100% với hàm `MaHoaHelper.MaHoaSHA256(input)` trong `ShopeeClone/Helpers/MaHoaHelper.cs` và stored procedure `sp_DangNhap`.
> - Chuỗi băm SHA-256 của mật khẩu demo `123456` là: `8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92`.
> - Tool tạo mã hash (hỗ trợ cả SHA-256 và BCrypt) được đặt tại thư mục `DATABASE/gen_bcrypt/` (chạy lệnh `node index.js --all` hoặc `node index.js "MatKhau"`).

---

## 7. Nạp Seed Data Bổ Sung (Tùy Chọn)

File `DATABASE/seed_data.sql` được thiết kế có tính chất **idempotent** (sử dụng `IF NOT EXISTS` và kiểm tra điều kiện an toàn), có thể chạy lại nhiều lần mà không làm lỗi hoặc trùng lặp dữ liệu:
- **24 Danh mục** thực tế (Thời trang, Điện tử, Điện gia dụng, Mỹ phẩm, Mẹ & bé, Sách, Thể thao,...).
- **552 Sản phẩm** đa dạng giá từ 15.000đ đến 49.990.000đ, bao gồm đầy đủ ca biên: tồn kho = 0, trạng thái 'Dừng bán', trạng thái 'Hết hàng', sản phẩm giá cực lớn.
- **123 Tài khoản** người dùng (1 Admin và 122 Khách hàng).
- **325 Đơn hàng** với đầy đủ các trạng thái ('Chờ xử lý', 'Đã duyệt', 'Đang giao', 'Hoàn thành', 'Đã hủy'), đảm bảo 100% `TongTien = SUM(DonGia * SoLuong)`.
- Giỏ hàng và chi tiết giỏ hàng cho các tài khoản người dùng.

Để nạp lại seed data vào container SQL Server:
```bash
docker compose exec -i db /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'ShopeeClone@2026!' -C -d QLSANPHAM < DATABASE/seed_data.sql
```




---

## 8. Hướng Dẫn Chạy Bộ Kiểm Thử Tự Động Playwright (E2E Testing)

Dự án tích hợp bộ kiểm thử tự động toàn diện gồm **42 test cases** sử dụng Playwright (TypeScript) bao phủ 8 nhóm tính năng: Tài khoản, Sản phẩm, Giỏ hàng, Đơn mua, Phân quyền RBAC, Quản trị Admin, Ca biên & Bảo mật (XSS, SQL Injection), và Chất lượng Giao diện Responsive.

### 8.1. Cài đặt môi trường kiểm thử (chỉ cần chạy 1 lần)

```bash
cd tests/e2e
npm install
npx playwright install chromium
```

### 8.2. Chạy toàn bộ 42 test cases

```bash
# Đứng tại thư mục tests/e2e
npx playwright test

# Hoặc nếu chạy trên cổng khác (ví dụ 5018):
BASE_URL=http://localhost:5018 npx playwright test
```

### 8.3. Chạy từng bộ test riêng biệt

```bash
# Kiểm thử xác thực & tài khoản
npx playwright test 01-auth.spec.ts

# Kiểm thử danh mục & sản phẩm
npx playwright test 02-products.spec.ts

# Kiểm thử giỏ hàng
npx playwright test 03-cart.spec.ts

# Kiểm thử đặt hàng & quản lý đơn mua
npx playwright test 04-orders.spec.ts

# Kiểm thử phân quyền RBAC & an ninh
npx playwright test 05-authorization.spec.ts

# Kiểm thử tính năng quản trị Admin
npx playwright test 06-admin.spec.ts

# Kiểm thử ca biên (Edge cases & Security)
npx playwright test 07-edge-cases.spec.ts

# Kiểm thử Console, Network 404 & Responsive
npx playwright test 08-ui-quality.spec.ts
```

### 8.4. Xem báo cáo kiểm thử trực quan HTML

```bash
npx playwright show-report
```

---

## 9. Cấu Trúc Tài Liệu Kỹ Thuật

- [CONTRACT.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/CONTRACT.md): Hợp đồng kỹ thuật bất biến về Routes, Form Inputs, Session keys, DOM Selectors và Action APIs.
- [DESIGN_SYSTEM.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/DESIGN_SYSTEM.md): Hệ thống thiết kế CSS Tokens, Dark Mode, Toasts, Skeletons và Responsive Layout.
- [BAO_CAO_LOI.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/BAO_CAO_LOI.md): Báo cáo chi tiết 10 lỗi phát hiện được, quy trình khắc phục và nghiệm thu 100% test cases pass.
- Thư mục ảnh chụp màn hình kiểm thử: `docs/screenshots/`.


---

## 8. Hướng Dẫn Chạy Bộ Kiểm Thử Tự Động Playwright (E2E Testing)

Dự án tích hợp bộ kiểm thử tự động toàn diện gồm **42 test cases** sử dụng Playwright (TypeScript) bao phủ 8 nhóm tính năng: Tài khoản, Sản phẩm, Giỏ hàng, Đơn mua, Phân quyền RBAC, Quản trị Admin, Ca biên & Bảo mật (XSS, SQL Injection), và Chất lượng Giao diện Responsive.

### 8.1. Cài đặt môi trường kiểm thử (chỉ cần chạy 1 lần)

```bash
cd tests/e2e
npm install
npx playwright install chromium
```

### 8.2. Chạy toàn bộ 42 test cases

```bash
# Đứng tại thư mục tests/e2e
npx playwright test

# Hoặc nếu chạy trên cổng khác (ví dụ 5018):
BASE_URL=http://localhost:5018 npx playwright test
```

### 8.3. Chạy từng bộ test riêng biệt

```bash
# Kiểm thử xác thực & tài khoản
npx playwright test 01-auth.spec.ts

# Kiểm thử danh mục & sản phẩm
npx playwright test 02-products.spec.ts

# Kiểm thử giỏ hàng
npx playwright test 03-cart.spec.ts

# Kiểm thử đặt hàng & quản lý đơn mua
npx playwright test 04-orders.spec.ts

# Kiểm thử phân quyền RBAC & an ninh
npx playwright test 05-authorization.spec.ts

# Kiểm thử tính năng quản trị Admin
npx playwright test 06-admin.spec.ts

# Kiểm thử ca biên (Edge cases & Security)
npx playwright test 07-edge-cases.spec.ts

# Kiểm thử Console, Network 404 & Responsive
npx playwright test 08-ui-quality.spec.ts
```

### 8.4. Xem báo cáo kiểm thử trực quan HTML

```bash
npx playwright show-report
```

---

## 9. Cấu Trúc Tài Liệu Kỹ Thuật

- [CONTRACT.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/CONTRACT.md): Hợp đồng kỹ thuật bất biến về Routes, Form Inputs, Session keys, DOM Selectors và Action APIs.
- [DESIGN_SYSTEM.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/DESIGN_SYSTEM.md): Hệ thống thiết kế CSS Tokens, Dark Mode, Toasts, Skeletons và Responsive Layout.
- [BAO_CAO_LOI.md](file:///run/media/phuong-dev/backup/BTL_IT38.006_N8_Phuong_Quan_Quang_Sang_Sinh/BTL_IT38.006_N8/BAO_CAO_LOI.md): Báo cáo chi tiết 10 lỗi phát hiện được, quy trình khắc phục và nghiệm thu 100% test cases pass.
- Thư mục ảnh chụp màn hình kiểm thử: `docs/screenshots/`.

