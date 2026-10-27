-- ==============================================================================
-- SHOPEECLONE DATABASE SEED DATA SCRIPT
-- ==============================================================================
-- Idempotent seed data for ShopeeClone e-commerce system.
-- Can be executed multiple times without errors or data duplication.
-- 
-- Volumes:
--  - DanhMuc: 24 danh mục thực tế (>= 20)
--  - SanPham: 552 sản phẩm tiếng Việt thực tế kèm đầy đủ ca biên (>= 500)
--  - NguoiDung: 120 tài khoản (1 Admin, 119 User) (>= 100)
--  - GioHang & ChiTietGioHang: Đầy đủ giỏ hàng cho người dùng
--  - DonHang: 325 đơn hàng thực tế kèm ChiTietDonHang đúng TongTien (>= 300)
-- ==============================================================================

USE QLSANPHAM;
GO

SET NOCOUNT ON;
GO

PRINT N'>>> BẮT ĐẦU NẠP SEED DATA CHO SHOPEECLONE...';
GO

-- ==============================================================================
-- 1. NẠP DANH MỤC (DANHMUC) - Tối thiểu 20 danh mục
-- ==============================================================================
PRINT N'1. Đang nạp danh mục...';
GO

IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Thời Trang Nam')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Thời Trang Nam', N'/images/ThoiTrangNam.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/ThoiTrangNam.png'
    WHERE TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Thời Trang Nữ')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Thời Trang Nữ', N'/images/ThoiTrangNu.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/ThoiTrangNu.png'
    WHERE TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Điện Thoại & Phụ Kiện')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Điện Thoại & Phụ Kiện', N'/images/DienThoai.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/DienThoai.png'
    WHERE TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Máy Tính & Laptop')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Máy Tính & Laptop', N'/images/Laptop.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/Laptop.png'
    WHERE TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Đồng Hồ')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Đồng Hồ', N'/images/DongHo.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/DongHo.png'
    WHERE TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Giày Dép Nam')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Giày Dép Nam', N'/images/GiayDepNam.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/GiayDepNam.png'
    WHERE TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Giày Dép Nữ')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Giày Dép Nữ', N'/images/GiayDepNu.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/GiayDepNu.png'
    WHERE TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp', N'/images/LamDep.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/LamDep.png'
    WHERE TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Nhà Cửa & Đời Sống')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Nhà Cửa & Đời Sống', N'/images/NhaCua.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/NhaCua.png'
    WHERE TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Túi Ví Nữ')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Túi Ví Nữ', N'/images/TuiViNu.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/TuiViNu.png'
    WHERE TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Thiết Bị Điện Tử')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Thiết Bị Điện Tử', N'/images/ThietBiDienTu.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/ThietBiDienTu.png'
    WHERE TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Mẹ & Bé')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Mẹ & Bé', N'/images/MeBe.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/MeBe.png'
    WHERE TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Thể Thao & Du Lịch')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Thể Thao & Du Lịch', N'/images/GiayDepNam.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/GiayDepNam.png'
    WHERE TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Bách Hóa Online')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Bách Hóa Online', N'/images/NhaCua.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/NhaCua.png'
    WHERE TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Ô Tô - Xe Máy - Xe Đạp', N'/images/ThietBiDienTu.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/ThietBiDienTu.png'
    WHERE TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Sách & Văn Phòng Phẩm')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Sách & Văn Phòng Phẩm', N'/images/Laptop.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/Laptop.png'
    WHERE TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Thiết Bị Âm Thanh')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Thiết Bị Âm Thanh', N'/images/DienThoai.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/DienThoai.png'
    WHERE TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Phụ Kiện Thời Trang')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Phụ Kiện Thời Trang', N'/images/DongHo.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/DongHo.png'
    WHERE TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Thiết Bị Điện Gia Dụng')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Thiết Bị Điện Gia Dụng', N'/images/NhaCua.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/NhaCua.png'
    WHERE TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Đồ Chơi Sáng Tạo Trẻ Em', N'/images/MeBe.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/MeBe.png'
    WHERE TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Chăm Sóc Thú Cưng')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Chăm Sóc Thú Cưng', N'/images/NhaCua.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/NhaCua.png'
    WHERE TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Sức Khỏe & Y Tế')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Sức Khỏe & Y Tế', N'/images/LamDep.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/LamDep.png'
    WHERE TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Máy Ảnh - Quay Phim')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Máy Ảnh - Quay Phim', N'/images/ThietBiDienTu.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/ThietBiDienTu.png'
    WHERE TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM DanhMuc WHERE TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn')
BEGIN
    INSERT INTO DanhMuc (TenDanhMuc, HinhAnh)
    VALUES (N'Dụng Cụ Nhà Bếp & Bàn Ăn', N'/images/NhaCua.png');
END
ELSE
BEGIN
    UPDATE DanhMuc 
    SET HinhAnh = N'/images/NhaCua.png'
    WHERE TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO

-- ==============================================================================
-- 2. NẠP SẢN PHẨM (SANPHAM) - Tối thiểu 500 sản phẩm với đầy đủ ca biên
-- ==============================================================================
PRINT N'2. Đang nạp sản phẩm...';
GO


DISABLE TRIGGER trg_UpdateTrangThaiSanPham ON SanPham;
GO

IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Polo Nam Classic Cotton Pique')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Polo Nam Classic Cotton Pique', 
           N'Chất liệu vải cá sấu cotton 100% thoáng mát, co giãn 4 chiều.', 
           199000, 
           80, 
           N'/images/ThoiTrangNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Gió Nam 2 Lớp Chống Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Gió Nam 2 Lớp Chống Nước', 
           N'Cản gió, cản bụi bề mặt kháng nước nhẹ phù hợp đi đường xa.', 
           399000, 
           45, 
           N'/images/ThoiTrangNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Tây Nam Công Sở Dáng Đứng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Tây Nam Công Sở Dáng Đứng', 
           N'Form slimfit trẻ trung, chất vải tuyết mưa cao cấp không nhăn.', 
           349000, 
           60, 
           N'/images/ThoiTrangNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Sơ Mi Nam Trắng Dài Tay Chống Nhăn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Sơ Mi Nam Trắng Dài Tay Chống Nhăn', 
           N'Áo sơ mi công sở chất sợi tre bamboo kháng khuẩn, thoáng khí.', 
           289000, 
           70, 
           N'/images/ThoiTrangNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Jean Nam Ống Suông Co Giãn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Jean Nam Ống Suông Co Giãn', 
           N'Quần bò nam chất denim mềm mại, màu sắc bền đẹp không phai.', 
           389000, 
           55, 
           N'/images/ThoiTrangNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Thun Nam Cổ Tròn Cotton Compact')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Thun Nam Cổ Tròn Cotton Compact', 
           N'Áo phông nam trơn basic chất cotton compact mượt mà, thấm hút mồ hôi.', 
           129000, 
           120, 
           N'/images/ThoiTrangNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Short Kaki Nam Đi Biển')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Short Kaki Nam Đi Biển', 
           N'Quần soóc kaki co giãn nhẹ, túi sâu đựng điện thoại tiện lợi.', 
           159000, 
           90, 
           N'/images/ThoiTrangNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Hoodie Nam Nỉ Bông Form Rộng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Hoodie Nam Nỉ Bông Form Rộng', 
           N'Áo hoodie mũ trùm ấm áp, phong cách streetwear unisex năng động.', 
           299000, 
           40, 
           N'/images/ThoiTrangNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Len Nam Cổ Lọ Dệt Kim Dày Dặn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Len Nam Cổ Lọ Dệt Kim Dày Dặn', 
           N'Sợi len lông cừu tổng hợp giữ nhiệt cực tốt trong mùa đông.', 
           320000, 
           35, 
           N'/images/ThoiTrangNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Ba Lỗ Nam Tập Gym Vải Thoáng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Ba Lỗ Nam Tập Gym Vải Thoáng', 
           N'Áo sát nách nam form thể thao tôn dáng, co giãn đàn hồi tối đa.', 
           69000, 
           150, 
           N'/images/ThoiTrangNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Quần Áo Thể Thao Nam Mùa Hè')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Quần Áo Thể Thao Nam Mùa Hè', 
           N'Bộ đồ thể thao nam chất mè tổ ong thoáng khí, siêu nhanh khô.', 
           249000, 
           65, 
           N'/images/ThoiTrangNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Jogger Nam Túi Hộp Kaki Streetwear')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Jogger Nam Túi Hộp Kaki Streetwear', 
           N'Quần bo gấu cá tính với nhiều túi hộp tiện dụng đi phượt.', 
           279000, 
           50, 
           N'/images/ThoiTrangNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Phao Nam Lông Vũ Siêu Nhẹ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Phao Nam Lông Vũ Siêu Nhẹ', 
           N'Lông vũ thiên nhiên siêu ấm, gấp gọn kèm túi đựng du lịch.', 
           699000, 
           25, 
           N'/images/ThoiTrangNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Lót Nam Boxer Kháng Khuẩn Set 4')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Lót Nam Boxer Kháng Khuẩn Set 4', 
           N'Chất liệu thun lạnh Modal sợi sồi thiên nhiên êm ái, thoáng mát.', 
           149000, 
           180, 
           N'/images/ThoiTrangNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Blazer Nam Hàn Quốc 2 Nút')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Blazer Nam Hàn Quốc 2 Nút', 
           N'Thiết kế form suông hiện đại phối lót lụa cao cấp đi làm đi tiệc.', 
           850000, 
           20, 
           N'/images/ThoiTrangNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Jean Nam Denim Bụi Bặm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Jean Nam Denim Bụi Bặm', 
           N'Chất vải bò dày dặn cúc đồng phong cách retro vintage mạnh mẽ.', 
           420000, 
           30, 
           N'/images/ThoiTrangNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Ngủ Nam Cotton Kẻ Caro Thoải Mái')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Ngủ Nam Cotton Kẻ Caro Thoải Mái', 
           N'Quần đùi mặc nhà mềm mại, lưng chun co giãn không cấn bụng.', 
           89000, 
           110, 
           N'/images/ThoiTrangNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Sơ Mi Nam Cổ Tàu Đũi Xước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Sơ Mi Nam Cổ Tàu Đũi Xước', 
           N'Chất đũi tự nhiên nhẹ mát, thấm hút mồ hôi thích hợp mùa hè.', 
           219000, 
           40, 
           N'/images/ThoiTrangNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Gile Len Nam Cổ Tim Phong Cách Vintage')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Gile Len Nam Cổ Tim Phong Cách Vintage', 
           N'Phối cùng sơ mi tạo phong cách thư sinh thanh lịch.', 
           199000, 
           35, 
           N'/images/ThoiTrangNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tất Vớ Nam Cổ Ngắn Chống Hôi Chân Set 5')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tất Vớ Nam Cổ Ngắn Chống Hôi Chân Set 5', 
           N'Công nghệ nano bạc khử mùi hiệu quả, co giãn không bai xù.', 
           49000, 
           200, 
           N'/images/ThoiTrangNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Chống Nắng Nam Vải Thun Lạnh UPF50+')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Chống Nắng Nam Vải Thun Lạnh UPF50+', 
           N'Áo chống nắng toàn thân chỉ số UPF50+ ngăn 99% tia UV hại da.', 
           189000, 
           0, 
           N'/images/ThoiTrangNam01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Da Thật Biker Nam Phiên Bản Kỷ Niệm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Da Thật Biker Nam Phiên Bản Kỷ Niệm', 
           N'Sản phẩm đã ngưng sản xuất do hết nguyên liệu da bò nhập khẩu Ý.', 
           3450000, 
           8, 
           N'/images/ThoiTrangNam02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Suit Nam Bespoke May Đo Thủ Công Cao Cấp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Suit Nam Bespoke May Đo Thủ Công Cao Cấp', 
           N'Suit may đo thủ công từ vải len lông cừu Scabal thượng hạng nhập khẩu Bỉ.', 
           18500000, 
           4, 
           N'/images/ThoiTrangNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Gió Nữ 2 Lớp Pastel Dễ Thương')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Gió Nữ 2 Lớp Pastel Dễ Thương', 
           N'Màu sắc ngọt ngào, chất vải chống nước chống gió hiệu quả.', 
           349000, 
           50, 
           N'/images/ThoiTrangNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Váy Hoa Nhí Nữ Vintage Cổ Vuông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Váy Hoa Nhí Nữ Vintage Cổ Vuông', 
           N'Chất voan lụa mềm nhẹ có lót trong kín đáo, tôn dáng eo thon.', 
           279000, 
           65, 
           N'/images/ThoiTrangNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Jean Nữ Ống Rộng Lưng Cao Hack Dáng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Jean Nữ Ống Rộng Lưng Cao Hack Dáng', 
           N'Tôn chân dài miên man, vải denim dày dặn không bai dão.', 
           320000, 
           80, 
           N'/images/ThoiTrangNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chân Váy Xếp Ly Dài Qua Gối Phong Cách Hàn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chân Váy Xếp Ly Dài Qua Gối Phong Cách Hàn', 
           N'Thiết kế nếp ly sắc nét, chất vải tuyết mưa cao cấp rủ tự nhiên.', 
           239000, 
           70, 
           N'/images/ThoiTrangNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Sơ Mi Nữ Lụa Satin Cổ V Công Sở')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Sơ Mi Nữ Lụa Satin Cổ V Công Sở', 
           N'Lụa satin óng ả mềm mại, không nhăn, tạo nét thanh lịch nữ tính.', 
           259000, 
           60, 
           N'/images/ThoiTrangNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Thun Nữ Baby Tee Ôm Body Năng Động')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Thun Nữ Baby Tee Ôm Body Năng Động', 
           N'Cotton co giãn 4 chiều mềm mịn, dáng croptop trẻ trung tôn dáng.', 
           99000, 
           140, 
           N'/images/ThoiTrangNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầm Nữ Dự Tiệc Trễ Vai Sang Trọng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầm Nữ Dự Tiệc Trễ Vai Sang Trọng', 
           N'Chất tafta cao cấp đứng form, chi tiết nơ ngực quyến rũ kiêu sa.', 
           590000, 
           30, 
           N'/images/ThoiTrangNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Cardigan Len Nữ Dệt Kim Cúc Cài')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Cardigan Len Nữ Dệt Kim Cúc Cài', 
           N'Len mềm mịn không ngứa, mặc khoác nhẹ ngoài váy áo 4 mùa.', 
           219000, 
           55, 
           N'/images/ThoiTrangNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Tây Nữ Ống Suông 2 Ly Khóa Kéo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Tây Nữ Ống Suông 2 Ly Khóa Kéo', 
           N'Đáy quần sâu thoải mái, form suông giấu khuyết điểm chân cực tốt.', 
           289000, 
           75, 
           N'/images/ThoiTrangNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đồ Ngủ Nữ Lụa Pijama Dài Tay')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đồ Ngủ Nữ Lụa Pijama Dài Tay', 
           N'Lụa phi bóng mềm mại, họa tiết sang chảnh viền mí sắc nét.', 
           199000, 
           90, 
           N'/images/ThoiTrangNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chân Váy Chữ A Ngắn Kèm Quần Trong')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chân Váy Chữ A Ngắn Kèm Quần Trong', 
           N'Chân váy ngắn năng động có quần bảo hộ an toàn tiện lợi di chuyển.', 
           169000, 
           110, 
           N'/images/ThoiTrangNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Croptop Nữ Tay Dài Cổ Tròn Thun Gân')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Croptop Nữ Tay Dài Cổ Tròn Thun Gân', 
           N'Thun tăm co giãn ôm trọn đường cong cơ thể, phong cách Y2K.', 
           119000, 
           85, 
           N'/images/ThoiTrangNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Dạ Nữ Tweed Tiểu Thư Cúc Ngọc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Dạ Nữ Tweed Tiểu Thư Cúc Ngọc', 
           N'Dạ tweed kim tuyến lấp lánh sang trọng phối cúc ngọc trai quý phái.', 
           650000, 
           25, 
           N'/images/ThoiTrangNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầm Maxi Nữ Đi Biển Hở Lưng Quyến Rũ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầm Maxi Nữ Đi Biển Hở Lưng Quyến Rũ', 
           N'Váy tơ óng bồng bềnh bay bổng chụp ảnh sống ảo cực đỉnh.', 
           350000, 
           45, 
           N'/images/ThoiTrangNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Lót Nữ Không Gọng Đệm Mút Êm Ái')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Lót Nữ Không Gọng Đệm Mút Êm Ái', 
           N'Thiết kế nâng ngực tự nhiên, su đúc liền mảnh không vết hằn.', 
           135000, 
           160, 
           N'/images/ThoiTrangNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Legging Nữ Cạp Cao Nâng Mông Gen Bụng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Legging Nữ Cạp Cao Nâng Mông Gen Bụng', 
           N'Vải dệt kim dày dặn không lộ viền, co giãn tập gym yoga thoải mái.', 
           149000, 
           130, 
           N'/images/ThoiTrangNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Chống Nắng Nữ Toàn Thân 2 Lớp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Chống Nắng Nữ Toàn Thân 2 Lớp', 
           N'Vành mũ rộng che mặt, tà áo dài bảo vệ đôi chân dưới nắng gắt.', 
           249000, 
           65, 
           N'/images/ThoiTrangNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Short Nữ Ống Rộng Lưng Thun Mặc Nhà')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Short Nữ Ống Rộng Lưng Thun Mặc Nhà', 
           N'Chất đũi xước mềm mát dễ chịu cho ngày hè thư giãn.', 
           79000, 
           120, 
           N'/images/ThoiTrangNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầm Body Nữ Xẻ Tà Cổ Vuông Gợi Cảm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầm Body Nữ Xẻ Tà Cổ Vuông Gợi Cảm', 
           N'Chất thun borip dày dặn ôm sát đường cong 3 vòng gợi cảm.', 
           310000, 
           40, 
           N'/images/ThoiTrangNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kẹp Tóc Nữ Hàn Quốc Càng Cua Ngọc Trai')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kẹp Tóc Nữ Hàn Quốc Càng Cua Ngọc Trai', 
           N'Phụ kiện kẹp tóc xinh xắn cho phái đẹp gài tóc nhẹ nhàng.', 
           15000, 
           300, 
           N'/images/ThoiTrangNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Khoác Lông Cừu Nữ Dáng Dài Mùa Đông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Khoác Lông Cừu Nữ Dáng Dài Mùa Đông', 
           N'Sản phẩm tạm thời hết hàng do nhu cầu mùa đông tăng cao.', 
           890000, 
           0, 
           N'/images/ThoiTrangNu01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầm Thiết Kế Nữ Haute Couture Dạ Hội Ánh Kim')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầm Thiết Kế Nữ Haute Couture Dạ Hội Ánh Kim', 
           N'Mẫu thiết kế độc bản của BST 2025 đã ngừng kinh doanh.', 
           2800000, 
           2, 
           N'/images/ThoiTrangNu02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Choàng Dạ Nữ Cashmere 100% Nhập Khẩu Ý')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Choàng Dạ Nữ Cashmere 100% Nhập Khẩu Ý', 
           N'Dạ lông dê Cashmere thượng hạng nguyên chất mềm mại và giữ ấm tuyệt đỉnh.', 
           22000000, 
           3, 
           N'/images/ThoiTrangNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thời Trang Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Điện Thoại iPhone 15 128GB Chính Hãng VN/A')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Điện Thoại iPhone 15 128GB Chính Hãng VN/A', 
           N'Màn hình Dynamic Island, chip Apple A16 Bionic, camera 48MP sắc nét.', 
           19490000, 
           35, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Điện Thoại Samsung Galaxy A55 5G 128GB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Điện Thoại Samsung Galaxy A55 5G 128GB', 
           N'Khung viền kim loại cao cấp, kháng nước bụi IP67, màn Super AMOLED 120Hz.', 
           8990000, 
           50, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Điện Thoại Xiaomi Redmi Note 13 Pro 8GB/256GB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Điện Thoại Xiaomi Redmi Note 13 Pro 8GB/256GB', 
           N'Camera siêu phân giải 200MP chống rung OIS, sạc nhanh Turbo 67W.', 
           6290000, 
           60, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tai Nghe Bluetooth Không Dây True Wireless TWS')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tai Nghe Bluetooth Không Dây True Wireless TWS', 
           N'Bluetooth 5.3 kết nối ổn định, chống ồn đàm thoại ENC, pin 24 giờ.', 
           290000, 
           120, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sạc Dự Phòng 20000mAh Sạc Nhanh 22.5W')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sạc Dự Phòng 20000mAh Sạc Nhanh 22.5W', 
           N'Dung lượng thực chuẩn, hỗ trợ sạc nhanh PD QC 3.0 cho iPhone và Android.', 
           350000, 
           90, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Củ Sạc Nhanh GaN 65W 3 Cổng Type C & USB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Củ Sạc Nhanh GaN 65W 3 Cổng Type C & USB', 
           N'Công nghệ Gallium Nitride siêu nhỏ gọn sạc được cả laptop và điện thoại.', 
           420000, 
           75, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cáp Sạc Nhanh Type-C to Lightning Dù Bện')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cáp Sạc Nhanh Type-C to Lightning Dù Bện', 
           N'Vỏ bọc dù bện chống đứt gãy gập gãy, hỗ trợ sạc nhanh chuẩn MFi.', 
           89000, 
           200, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ốp Lưng Chống Sốc Từ Tính Magsafe Trong Suốt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ốp Lưng Chống Sốc Từ Tính Magsafe Trong Suốt', 
           N'Chất liệu viền TPU mặt lưng PC cứng cáp không ố vàng, hít từ tính mạnh.', 
           65000, 
           250, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kính Cường Lực Điện Thoại 9D Full Màn Chống Nhìn Trộm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kính Cường Lực Điện Thoại 9D Full Màn Chống Nhìn Trộm', 
           N'Bảo vệ riêng tư nơi đông người, độ cứng 9H chống trầy xước va đập.', 
           25000, 
           350, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gậy Chụp Ảnh Selfie Bluetooth 3 Chân Kèm Đèn Led')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gậy Chụp Ảnh Selfie Bluetooth 3 Chân Kèm Đèn Led', 
           N'Gấp gọn bỏ túi du lịch, remote điều khiển từ xa tầm xa 10m.', 
           139000, 
           85, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giá Đỡ Điện Thoại Để Bàn Hợp Kim Nhôm Xoay 360')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giá Đỡ Điện Thoại Để Bàn Hợp Kim Nhôm Xoay 360', 
           N'Gập đôi linh hoạt, đế cao su chống trượt giúp rảnh tay xem phim lướt web.', 
           79000, 
           140, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tẩu Sạc Nhanh Ô Tô Cổng Kép PD 30W Kim Loại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tẩu Sạc Nhanh Ô Tô Cổng Kép PD 30W Kim Loại', 
           N'Tự động ngắt khi đầy pin, chống quá nhiệt an toàn cho hệ thống xe hơi.', 
           110000, 
           95, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thẻ Nhớ MicroSD 128GB Tốc Độ Cao 100MB/s')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thẻ Nhớ MicroSD 128GB Tốc Độ Cao 100MB/s', 
           N'Ghi hình 4K mượt mà chuyên dụng camera giám sát và máy chơi game.', 
           185000, 
           110, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Đeo Điện Thoại Chéo Hạt Cườm Thời Trang')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Đeo Điện Thoại Chéo Hạt Cườm Thời Trang', 
           N'Phụ kiện đeo vai chống giật cướp rớt điện thoại phong cách Gen Z.', 
           35000, 
           180, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quạt Tản Nhiệt Điện Thoại Sò Lạnh Gaming')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quạt Tản Nhiệt Điện Thoại Sò Lạnh Gaming', 
           N'Làm mát tức thì xuống 10 độ C chống tụt FPS khi chơi game nặng.', 
           199000, 
           65, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bút Cảm Ứng Chuyên Dụng Màn Hình Điện Thoại Tablet')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bút Cảm Ứng Chuyên Dụng Màn Hình Điện Thoại Tablet', 
           N'Đầu kim loại 1.5mm cảm ứng mượt mà nhạy bén vẽ phác thảo viết chữ.', 
           159000, 
           70, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Vệ Sinh Điện Thoại Tai Nghe 5 Trong 1 Đa Năng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Vệ Sinh Điện Thoại Tai Nghe 5 Trong 1 Đa Năng', 
           N'Gồm bút làm sạch kẽ hở tai nghe, cọ quét bụi và bình xịt vệ sinh màn hình.', 
           29000, 
           220, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Chống Nước Điện Thoại Đi Bơi Đi Biển Cảm Ứng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Chống Nước Điện Thoại Đi Bơi Đi Biển Cảm Ứng', 
           N'Tiêu chuẩn chống nước IPX8 độ sâu 30m chụp ảnh dưới nước sắc nét.', 
           22000, 
           300, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Miếng Dán Bảo Vệ Mắt Camera Chống Xước Khung Viền')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Miếng Dán Bảo Vệ Mắt Camera Chống Xước Khung Viền', 
           N'Kính sapphire nhân tạo bảo vệ ống kính camera không giảm chất lượng ảnh.', 
           19000, 
           300, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cáp Chuyển Đổi Tai Nghe Type-C Sang 3.5mm DAC Rời')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cáp Chuyển Đổi Tai Nghe Type-C Sang 3.5mm DAC Rời', 
           N'Tích hợp chip giải mã âm thanh Hi-Res lossless trung thực sống động.', 
           69000, 
           130, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Điện Thoại Nắp Gập Cổ Điển Bàn Phím Lớn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Điện Thoại Nắp Gập Cổ Điển Bàn Phím Lớn', 
           N'Dòng máy cho người cao tuổi tạm thời cháy hàng trên toàn hệ thống.', 
           450000, 
           0, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Điện Thoại iPhone 11 64GB Quốc Tế Cũ Likenew')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Điện Thoại iPhone 11 64GB Quốc Tế Cũ Likenew', 
           N'Hãng Apple đã ngừng sản xuất model này chuyển sang các dòng mới.', 
           5990000, 
           5, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Điện Thoại iPhone 16 Pro Max 1TB Titan Tự Nhiên VN/A')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Điện Thoại iPhone 16 Pro Max 1TB Titan Tự Nhiên VN/A', 
           N'Flagship đỉnh cao nhất của Apple khung viền Titan Grade 5 chip Apple A18 Pro.', 
           46990000, 
           10, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Điện Thoại & Phụ Kiện';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Laptop Dell Inspiron 15 Core i5 16GB 512GB SSD')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Laptop Dell Inspiron 15 Core i5 16GB 512GB SSD', 
           N'Màn hình 15.6 inch FHD 120Hz mượt mà, cấu hình mạnh mẽ văn phòng lập trình.', 
           14890000, 
           20, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Laptop Asus Vivobook 14 OLED Ryzen 7 16GB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Laptop Asus Vivobook 14 OLED Ryzen 7 16GB', 
           N'Màn hình chuẩn màu sắc nét 2.8K OLED 90Hz, mỏng nhẹ kim loại cao cấp.', 
           16490000, 
           22, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bàn Phím Cơ Không Dây 3 Chế Độ Bluetooth 2.4G Hotswap')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bàn Phím Cơ Không Dây 3 Chế Độ Bluetooth 2.4G Hotswap', 
           N'Switch gõ êm ái lube sẵn lót foam tiêu âm cao cấp gõ đầm tay.', 
           890000, 
           65, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chuột Không Dây Gaming Công Thái Học 16000 DPI')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chuột Không Dây Gaming Công Thái Học 16000 DPI', 
           N'Mắt đọc quang học chuẩn xác, form cầm ôm sát bàn tay không mỏi cổ tay.', 
           450000, 
           85, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Màn Hình Máy Tính 24 Inch IPS 100Hz Viền Siêu Mỏng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Màn Hình Máy Tính 24 Inch IPS 100Hz Viền Siêu Mỏng', 
           N'Tấm nền IPS góc nhìn rộng 178 độ hiển thị màu sắc chân thực chuẩn đồ họa.', 
           2190000, 
           40, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ổ Cứng SSD Di Động 1TB USB 3.2 Tốc Độ 1050MB/s')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ổ Cứng SSD Di Động 1TB USB 3.2 Tốc Độ 1050MB/s', 
           N'Thiết kế nhôm nguyên khối tản nhiệt tốt chống va đập rơi rớt dữ liệu an toàn.', 
           1890000, 
           50, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Lót Chuột Gaming Khổ Lớn 80x30cm May Bo Viền Dày 4mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Lót Chuột Gaming Khổ Lớn 80x30cm May Bo Viền Dày 4mm', 
           N'Bề mặt vải speed di chuột mượt mà đáy cao su tự nhiên chống trơn trượt.', 
           65000, 
           150, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tai Nghe Chụp Tai Gaming 7.1 Có Mic Lọc Tạp Âm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tai Nghe Chụp Tai Gaming 7.1 Có Mic Lọc Tạp Âm', 
           N'Âm vòm giả lập định vị tiếng bước chân chuẩn xác cho game thủ PUBG CSGO.', 
           380000, 
           60, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Webcam Máy Tính Full HD 1080P Kèm Micro Thu Âm Khử Ồn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Webcam Máy Tính Full HD 1080P Kèm Micro Thu Âm Khử Ồn', 
           N'Cắm là chạy không cần cài driver phục vụ học trực tuyến Zoom họp online.', 
           290000, 
           75, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giá Đỡ Laptop Tản Nhiệt Hợp Kim Nhôm Gấp Gọn Đa Năng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giá Đỡ Laptop Tản Nhiệt Hợp Kim Nhôm Gấp Gọn Đa Năng', 
           N'Chỉnh 6 mức độ cao chống gù lưng mỏi cổ thoáng đáy làm mát máy tính.', 
           129000, 
           110, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Hub Chuyển Đổi Type-C 8 Trong 1 Ra HDMI 4K LAN USB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Hub Chuyển Đổi Type-C 8 Trong 1 Ra HDMI 4K LAN USB', 
           N'Mở rộng cổng kết nối cho Macbook và laptop mỏng nhẹ siêu tiện lợi.', 
           350000, 
           80, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Keo Tản Nhiệt CPU Cao Cấp Chấm Gốm Nhiệt Độ Cao')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Keo Tản Nhiệt CPU Cao Cấp Chấm Gốm Nhiệt Độ Cao', 
           N'Hệ số dẫn nhiệt cao giúp CPU GPU luôn mát mẻ khi tải nặng render chơi game.', 
           45000, 
           200, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Cáp Mạng LAN Cat6 Đúc Sẵn 2 Đầu Dài 5 Mét')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Cáp Mạng LAN Cat6 Đúc Sẵn 2 Đầu Dài 5 Mét', 
           N'Lõi đồng nguyên chất băng thông 1000Mbps tốc độ cao ping ổn định.', 
           35000, 
           180, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'USB Flash Drive 64GB Chuẩn 3.0 Vỏ Kim Loại Móc Khóa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'USB Flash Drive 64GB Chuẩn 3.0 Vỏ Kim Loại Móc Khóa', 
           N'Chống nước chống sốc lưu trữ tài liệu ảnh phim an toàn tiện dụng.', 
           99000, 
           160, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quạt Tản Nhiệt Laptop 6 Cánh Đèn LED Có Màn Hình Chỉnh Tốc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quạt Tản Nhiệt Laptop 6 Cánh Đèn LED Có Màn Hình Chỉnh Tốc', 
           N'Luồng gió mạnh mẽ thổi mát toàn bộ đáy laptop giảm nhiệt tức thì 15 độ.', 
           260000, 
           55, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Treo Màn Hình Máy Tính Chống Mỏi Mắt Cảm Ứng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Treo Màn Hình Máy Tính Chống Mỏi Mắt Cảm Ứng', 
           N'Chiếu sáng bàn phím không chói màn hình 3 chế độ màu bảo vệ thị lực.', 
           320000, 
           50, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Balo Laptop 15.6 Inch Chống Nước Chống Trộm Có Cổng Sạc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Balo Laptop 15.6 Inch Chống Nước Chống Trộm Có Cổng Sạc', 
           N'Vải oxford bền chắc nhiều ngăn tiện dụng có khóa số bảo vệ tài sản.', 
           220000, 
           85, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Loa Máy Tính Để Bàn Mini Kép Có Đèn Led RGB Đổi Màu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Loa Máy Tính Để Bàn Mini Kép Có Đèn Led RGB Đổi Màu', 
           N'Âm thanh stereo sống động cấp nguồn USB tiện lợi kết nối qua jack 3.5mm.', 
           159000, 
           95, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Vệ Sinh Bàn Phím Cơ Đa Năng Gắp Phím Quét Bụi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Vệ Sinh Bàn Phím Cơ Đa Năng Gắp Phím Quét Bụi', 
           N'Dụng cụ nhổ keycap chổi mềm vệ sinh kẽ phím màn hình sạch bóng.', 
           39000, 
           210, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chuột Máy Tính Văn Phòng Có Dây Siêu Bền Click Êm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chuột Máy Tính Văn Phòng Có Dây Siêu Bền Click Êm', 
           N'Nút bấm silent không phát tiếng ồn phù hợp văn phòng thư viện ban đêm.', 
           79000, 
           130, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ram Máy Tính DDR4 8GB Bus 3200MHz Chính Hãng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ram Máy Tính DDR4 8GB Bus 3200MHz Chính Hãng', 
           N'Tạm thời hết hàng do thị trường chip nhớ toàn cầu biến động giá.', 
           450000, 
           0, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Card Đồ Họa VGA Cũ Đào Coin Likenew Không Bảo Hành')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Card Đồ Họa VGA Cũ Đào Coin Likenew Không Bảo Hành', 
           N'Dừng phân phối để đảm bảo quyền lợi và chất lượng bảo hành cho khách hàng.', 
           1800000, 
           3, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'MacBook Pro 16 Inch Apple M3 Max 64GB RAM 1TB SSD')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'MacBook Pro 16 Inch Apple M3 Max 64GB RAM 1TB SSD', 
           N'Cỗ máy trạm đồ họa tối thượng vi xử lý M3 Max 16-core CPU 40-core GPU khủng.', 
           49990000, 
           5, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Tính & Laptop';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Nam Dây Thép Không Gỉ Mặt Xanh Sapphire')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Nam Dây Thép Không Gỉ Mặt Xanh Sapphire', 
           N'Kính sapphire chống xước tuyệt đối chống nước 5ATM lịch lãm nam tính.', 
           1450000, 
           35, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Nữ Dây Da Mặt Đính Đá Thanh Lịch')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Nữ Dây Da Mặt Đính Đá Thanh Lịch', 
           N'Dây da thật cao cấp ôm tay mặt số xà cừ óng ánh quyến rũ quý cô.', 
           980000, 
           45, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Thông Minh Smartwatch Đo Nhịp Tim Ngủ SpO2')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Thông Minh Smartwatch Đo Nhịp Tim Ngủ SpO2', 
           N'Màn hình cảm ứng 1.8 inch nhận thông báo cuộc gọi tin nhắn theo dõi vận động.', 
           790000, 
           65, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Thể Thao Nam Điện Tử Chống Nước 100M Chống Sốc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Thể Thao Nam Điện Tử Chống Nước 100M Chống Sốc', 
           N'Thiết kế hầm hố phong cách quân đội có đèn dạ quang bấm giờ thể thao.', 
           450000, 
           70, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Đôi Nam Nữ Tình Nhân Dây Kim Loại Khóa Bấm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Đôi Nam Nữ Tình Nhân Dây Kim Loại Khóa Bấm', 
           N'Bộ 2 chiếc đồng hồ cặp đôi sang trọng làm quà tặng kỷ niệm ý nghĩa.', 
           1200000, 
           25, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Treo Tường Dạ Quang Kim Trôi Không Tiếng Động')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Treo Tường Dạ Quang Kim Trôi Không Tiếng Động', 
           N'Máy đồng hồ thạch anh kim trôi êm ái số phản quang xem giờ ban đêm.', 
           220000, 
           80, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Đựng Đồng Hồ Cơ Tự Động Xoay Trưng Bày Đèn Led')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Đựng Đồng Hồ Cơ Tự Động Xoay Trưng Bày Đèn Led', 
           N'Lên cót tự động êm ru bảo dưỡng đồng hồ cơ luôn chạy chuẩn xác.', 
           650000, 
           30, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Da Đồng Hồ Thật Khóa Bướm Size 20mm 22mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Da Đồng Hồ Thật Khóa Bướm Size 20mm 22mm', 
           N'Da bò thuộc mềm mại thấm mồ hôi tốt tặng kèm dụng cụ tự thay dây.', 
           160000, 
           120, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Thép Lưới Đồng Hồ Milanese Nam Châm Hít Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Thép Lưới Đồng Hồ Milanese Nam Châm Hít Tiện Lợi', 
           N'Dây kim loại mạ tĩnh điện điều chỉnh độ dài dễ dàng không cần cắt mắt.', 
           85000, 
           150, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Báo Thức Để Bàn Điện Tử Màn Hình Led Đa Năng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Báo Thức Để Bàn Điện Tử Màn Hình Led Đa Năng', 
           N'Hiển thị giờ nhiệt độ ngày tháng có cổng sạc USB và chuông báo thức to.', 
           125000, 
           95, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Cát Thủy Tinh 30 Phút Đo Thời Gian Làm Việc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Cát Thủy Tinh 30 Phút Đo Thời Gian Làm Việc', 
           N'Trang trí bàn làm việc phong cách tối giản rèn luyện tập trung Pomodoro.', 
           95000, 
           85, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Bỏ Túi Cổ Điển Dây Xích Vỏ Họa Tiết Cổ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Bỏ Túi Cổ Điển Dây Xích Vỏ Họa Tiết Cổ', 
           N'Phong cách quý tộc vintage mở nắp tự động làm quà tặng lưu niệm độc đáo.', 
           140000, 
           40, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Silicon Thay Thế Đồng Hồ Thông Minh 20mm 22mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Silicon Thay Thế Đồng Hồ Thông Minh 20mm 22mm', 
           N'Chất liệu silicon mềm dẻo thoáng khí chống nước mồ hôi khi chơi thể thao.', 
           45000, 
           190, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dụng Cụ Cắt Mắt Đồng Hồ Kim Loại Tại Nhà Cầm Tay')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dụng Cụ Cắt Mắt Đồng Hồ Kim Loại Tại Nhà Cầm Tay', 
           N'Thao tác tháo chốt thâu ngắn mắt dây kim loại cực kỳ dễ dàng nhanh chóng.', 
           25000, 
           240, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Pin Đồng Hồ Đeo Tay Maxell SR626SW Vỉ 5 Viên Chính Hãng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Pin Đồng Hồ Đeo Tay Maxell SR626SW Vỉ 5 Viên Chính Hãng', 
           N'Năng lượng ổn định bền bỉ 2-3 năm chống rò rỉ dung dịch làm hỏng máy.', 
           35000, 
           200, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kính Lúp Sửa Chữa Đồng Hồ Đeo Mắt Độ Phóng Đại 20X')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kính Lúp Sửa Chữa Đồng Hồ Đeo Mắt Độ Phóng Đại 20X', 
           N'Kính chuyên dụng soi linh kiện cơ khí chính xác có đèn led trợ sáng.', 
           55000, 
           90, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vòng Đeo Tay Định Vị Trẻ Em Đồng Hồ Nghe Gọi SOS')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vòng Đeo Tay Định Vị Trẻ Em Đồng Hồ Nghe Gọi SOS', 
           N'Lắp sim 4G định vị GPS an toàn cho bé gọi video và nút khẩn cấp SOS.', 
           490000, 
           55, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Bấm Giây Thể Thao Trọng Tài Đo Giờ Chạy')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Bấm Giây Thể Thao Trọng Tài Đo Giờ Chạy', 
           N'Chính xác đến 1/100 giây có dây đeo cổ phục vụ thi đấu rèn luyện thể thao.', 
           79000, 
           75, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Nữ Dây Silicon Trắng Phong Cách Thể Thao Nhẹ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Nữ Dây Silicon Trắng Phong Cách Thể Thao Nhẹ', 
           N'Thiết kế trẻ trung tươi tắn cho học sinh sinh viên đi học đi chơi năng động.', 
           180000, 
           80, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Nam Cơ Lộ Máy Skeleton Mặt Kính Cong')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Nam Cơ Lộ Máy Skeleton Mặt Kính Cong', 
           N'Thiết kế lộ khung máy bánh răng chuyển động mê hoặc mặt đáy trong suốt.', 
           2100000, 
           25, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Đo Áp Suất Khí Nén Đeo Tay Thợ Lặn Sâu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Đo Áp Suất Khí Nén Đeo Tay Thợ Lặn Sâu', 
           N'Tạm hết hàng do hạn ngạch nhập khẩu thiết bị lặn chuyên nghiệp từ Nhật.', 
           3500000, 
           0, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Cổ Quả Lắc Gỗ Tự Nhiên Điêu Khắc Rồng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Cổ Quả Lắc Gỗ Tự Nhiên Điêu Khắc Rồng', 
           N'Mẫu xuất xưởng năm 2020 đã dừng sản xuất thương mại.', 
           6500000, 
           1, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Cơ Thụy Sĩ Tissot Le Locle Automatic Vàng 18K')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Cơ Thụy Sĩ Tissot Le Locle Automatic Vàng 18K', 
           N'Tuyệt tác đồng hồ cơ Thụy Sĩ nguyên bản viền bọc vàng 18K độ chính xác chuẩn Chronometer.', 
           36800000, 
           3, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồng Hồ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Sneaker Nam Cổ Thấp Da Trắng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Sneaker Nam Cổ Thấp Da Trắng', 
           N'Sản phẩm Giày Sneaker Nam Cổ Thấp Da Trắng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Tây Nam Oxford Da Bò Buộc Dây')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Tây Nam Oxford Da Bò Buộc Dây', 
           N'Sản phẩm Giày Tây Nam Oxford Da Bò Buộc Dây chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Lười Nam Loafer Da Bóng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Lười Nam Loafer Da Bóng', 
           N'Sản phẩm Giày Lười Nam Loafer Da Bóng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Quai Ngang Nam Đế Trấu Thời Trang')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Quai Ngang Nam Đế Trấu Thời Trang', 
           N'Sản phẩm Dép Quai Ngang Nam Đế Trấu Thời Trang chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Chạy Bộ Nam Siêu Nhẹ Đệm Khí Air')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Chạy Bộ Nam Siêu Nhẹ Đệm Khí Air', 
           N'Sản phẩm Giày Chạy Bộ Nam Siêu Nhẹ Đệm Khí Air chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Sandal Nam Đi Học Quai Dù Bền Chắc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Sandal Nam Đi Học Quai Dù Bền Chắc', 
           N'Sản phẩm Giày Sandal Nam Đi Học Quai Dù Bền Chắc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Tông Nam Đi Biển Xốp Êm Chống Trơn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Tông Nam Đi Biển Xốp Êm Chống Trơn', 
           N'Sản phẩm Dép Tông Nam Đi Biển Xốp Êm Chống Trơn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Boot Nam Cổ Cao Da Sáp Bụi Bặm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Boot Nam Cổ Cao Da Sáp Bụi Bặm', 
           N'Sản phẩm Giày Boot Nam Cổ Cao Da Sáp Bụi Bặm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Cầu Lông Nam Bám Sân Chống Lật Cổ Chân')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Cầu Lông Nam Bám Sân Chống Lật Cổ Chân', 
           N'Sản phẩm Giày Cầu Lông Nam Bám Sân Chống Lật Cổ Chân chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Lười Vải Nam Canvas Thoáng Khí')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Lười Vải Nam Canvas Thoáng Khí', 
           N'Sản phẩm Giày Lười Vải Nam Canvas Thoáng Khí chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Nam Đi Trong Nhà Đúc Nguyên Khối EVA')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Nam Đi Trong Nhà Đúc Nguyên Khối EVA', 
           N'Sản phẩm Dép Nam Đi Trong Nhà Đúc Nguyên Khối EVA chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Đá Bóng Nam Sân Cỏ Nhân Tạo Đinh TF')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Đá Bóng Nam Sân Cỏ Nhân Tạo Đinh TF', 
           N'Sản phẩm Giày Đá Bóng Nam Sân Cỏ Nhân Tạo Đinh TF chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Thể Thao Nam Leo Núi Cổ Lửng Chống Thấm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Thể Thao Nam Leo Núi Cổ Lửng Chống Thấm', 
           N'Sản phẩm Giày Thể Thao Nam Leo Núi Cổ Lửng Chống Thấm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Miếng Lót Giày Thể Thao Đệm Khí Tổ Ong Khử Mùi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Miếng Lót Giày Thể Thao Đệm Khí Tổ Ong Khử Mùi', 
           N'Sản phẩm Miếng Lót Giày Thể Thao Đệm Khí Tổ Ong Khử Mùi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cây Đón Gót Giày Inox Cán Dài Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cây Đón Gót Giày Inox Cán Dài Tiện Lợi', 
           N'Sản phẩm Cây Đón Gót Giày Inox Cán Dài Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xi Đánh Giày Đen Bóng Chống Thấm Da Bò')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xi Đánh Giày Đen Bóng Chống Thấm Da Bò', 
           N'Sản phẩm Xi Đánh Giày Đen Bóng Chống Thấm Da Bò chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Giày Dẹt Co Giãn Thông Minh Không Cần Buộc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Giày Dẹt Co Giãn Thông Minh Không Cần Buộc', 
           N'Sản phẩm Dây Giày Dẹt Co Giãn Thông Minh Không Cần Buộc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xịt Nano Chống Thấm Nước Bụi Bẩn Giày Sneaker')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xịt Nano Chống Thấm Nước Bụi Bẩn Giày Sneaker', 
           N'Sản phẩm Xịt Nano Chống Thấm Nước Bụi Bẩn Giày Sneaker chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Đựng Giày Trong Suốt Cửa Hút Nam Châm Khớp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Đựng Giày Trong Suốt Cửa Hút Nam Châm Khớp', 
           N'Sản phẩm Hộp Đựng Giày Trong Suốt Cửa Hút Nam Châm Khớp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tất Thể Thao Dệt Kim Cổ Trung Dày Dặn Set 3')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tất Thể Thao Dệt Kim Cổ Trung Dày Dặn Set 3', 
           N'Sản phẩm Tất Thể Thao Dệt Kim Cổ Trung Dày Dặn Set 3 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Luyện Tập Võ Thuật Đế Cao Su Mềm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Luyện Tập Võ Thuật Đế Cao Su Mềm', 
           N'Sản phẩm Giày Luyện Tập Võ Thuật Đế Cao Su Mềm tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Lười Nam Da Cá Sấu Nguyên Tấm Thượng Hạng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Lười Nam Da Cá Sấu Nguyên Tấm Thượng Hạng', 
           N'Sản phẩm Giày Lười Nam Da Cá Sấu Nguyên Tấm Thượng Hạng đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Thể Thao Chạy Marathon Carbon Nike Alphafly 3')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Thể Thao Chạy Marathon Carbon Nike Alphafly 3', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Giày Thể Thao Chạy Marathon Carbon Nike Alphafly 3.', 
           31000000, 
           3, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nam';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Cao Gót Nữ 7 Phân Mũi Nhọn Gót Vuông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Cao Gót Nữ 7 Phân Mũi Nhọn Gót Vuông', 
           N'Sản phẩm Giày Cao Gót Nữ 7 Phân Mũi Nhọn Gót Vuông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/GiayDepNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Sneaker Nữ Độn Đế 5cm Tôn Dáng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Sneaker Nữ Độn Đế 5cm Tôn Dáng', 
           N'Sản phẩm Giày Sneaker Nữ Độn Đế 5cm Tôn Dáng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/GiayDepNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Búp Bê Nữ Mũi Tròn Đính Nơ Xinh Xắn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Búp Bê Nữ Mũi Tròn Đính Nơ Xinh Xắn', 
           N'Sản phẩm Giày Búp Bê Nữ Mũi Tròn Đính Nơ Xinh Xắn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/GiayDepNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Sandal Nữ Quai Mảnh Đế Bệt Đi Học')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Sandal Nữ Quai Mảnh Đế Bệt Đi Học', 
           N'Sản phẩm Dép Sandal Nữ Quai Mảnh Đế Bệt Đi Học chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/GiayDepNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Boot Nữ Cổ Thấp Khóa Kéo Da Lì Phong Cách Hàn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Boot Nữ Cổ Thấp Khóa Kéo Da Lì Phong Cách Hàn', 
           N'Sản phẩm Boot Nữ Cổ Thấp Khóa Kéo Da Lì Phong Cách Hàn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/GiayDepNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Sục Nữ Bít Mũi Quai Ngang Đính Khóa Kim Loại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Sục Nữ Bít Mũi Quai Ngang Đính Khóa Kim Loại', 
           N'Sản phẩm Dép Sục Nữ Bít Mũi Quai Ngang Đính Khóa Kim Loại chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/GiayDepNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Mary Jane Nữ Quai Cài Phong Cách Cổ Điển')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Mary Jane Nữ Quai Cài Phong Cách Cổ Điển', 
           N'Sản phẩm Giày Mary Jane Nữ Quai Cài Phong Cách Cổ Điển chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/GiayDepNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Lê Nữ Quai Chéo Đế Bánh Mì Cao 4cm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Lê Nữ Quai Chéo Đế Bánh Mì Cao 4cm', 
           N'Sản phẩm Dép Lê Nữ Quai Chéo Đế Bánh Mì Cao 4cm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/GiayDepNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Thể Thao Nữ Chạy Bộ Thoáng Khí Dệt Mesh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Thể Thao Nữ Chạy Bộ Thoáng Khí Dệt Mesh', 
           N'Sản phẩm Giày Thể Thao Nữ Chạy Bộ Thoáng Khí Dệt Mesh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/GiayDepNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Lười Nữ Da Mềm Mũi Vuông Êm Chân')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Lười Nữ Da Mềm Mũi Vuông Êm Chân', 
           N'Sản phẩm Giày Lười Nữ Da Mềm Mũi Vuông Êm Chân chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/GiayDepNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sandal Nữ Cao Gót 5cm Quai Trong Suốt Tiệc Tùng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sandal Nữ Cao Gót 5cm Quai Trong Suốt Tiệc Tùng', 
           N'Sản phẩm Sandal Nữ Cao Gót 5cm Quai Trong Suốt Tiệc Tùng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/GiayDepNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Đi Trong Nhà Nữ Hình Thú Bông Dễ Thương')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Đi Trong Nhà Nữ Hình Thú Bông Dễ Thương', 
           N'Sản phẩm Dép Đi Trong Nhà Nữ Hình Thú Bông Dễ Thương chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/GiayDepNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Khiêu Vũ Nữ Đế Da Lộn Mềm Uốn Cong')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Khiêu Vũ Nữ Đế Da Lộn Mềm Uốn Cong', 
           N'Sản phẩm Giày Khiêu Vũ Nữ Đế Da Lộn Mềm Uốn Cong chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/GiayDepNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Miếng Đệm Lót Gót Giày Chống Rộp Trầy Chân Nữ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Miếng Đệm Lót Gót Giày Chống Rộp Trầy Chân Nữ', 
           N'Sản phẩm Miếng Đệm Lót Gót Giày Chống Rộp Trầy Chân Nữ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/GiayDepNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xịt Khử Mùi Hôi Giày Kháng Khuẩn Hương Hoa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xịt Khử Mùi Hôi Giày Kháng Khuẩn Hương Hoa', 
           N'Sản phẩm Xịt Khử Mùi Hôi Giày Kháng Khuẩn Hương Hoa chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/GiayDepNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khuôn Giữ Form Giày Bằng Gỗ Thông Chống Ẩm Mốc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khuôn Giữ Form Giày Bằng Gỗ Thông Chống Ẩm Mốc', 
           N'Sản phẩm Khuôn Giữ Form Giày Bằng Gỗ Thông Chống Ẩm Mốc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/GiayDepNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Giày Lụa Ruy Băng Nơ Dễ Thương Nữ Tính')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Giày Lụa Ruy Băng Nơ Dễ Thương Nữ Tính', 
           N'Sản phẩm Dây Giày Lụa Ruy Băng Nơ Dễ Thương Nữ Tính chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/GiayDepNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tất Hài Nữ Đi Giày Lười Silicon Chống Tụt Gót')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tất Hài Nữ Đi Giày Lười Silicon Chống Tụt Gót', 
           N'Sản phẩm Tất Hài Nữ Đi Giày Lười Silicon Chống Tụt Gót chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/GiayDepNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Lót Giày Nữ Êm Chân Giảm Áp Lực Lòng Bàn Chân')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Lót Giày Nữ Êm Chân Giảm Áp Lực Lòng Bàn Chân', 
           N'Sản phẩm Lót Giày Nữ Êm Chân Giảm Áp Lực Lòng Bàn Chân chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/GiayDepNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dép Xỏ Ngón Nữ Mùa Hè Đi Biển Họa Tiết Hoa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dép Xỏ Ngón Nữ Mùa Hè Đi Biển Họa Tiết Hoa', 
           N'Sản phẩm Dép Xỏ Ngón Nữ Mùa Hè Đi Biển Họa Tiết Hoa chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/GiayDepNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Thêu Hoa Thủ Công Phong Cách Cổ Trang')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Thêu Hoa Thủ Công Phong Cách Cổ Trang', 
           N'Sản phẩm Giày Thêu Hoa Thủ Công Phong Cách Cổ Trang tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/GiayDepNu01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Cao Gót Đính Pha Lê Độc Bản Cô Dâu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Cao Gót Đính Pha Lê Độc Bản Cô Dâu', 
           N'Sản phẩm Giày Cao Gót Đính Pha Lê Độc Bản Cô Dâu đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/GiayDepNu02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giày Cao Gót Christian Louboutin So Kate Đế Đỏ Huyền Thoại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giày Cao Gót Christian Louboutin So Kate Đế Đỏ Huyền Thoại', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Giày Cao Gót Christian Louboutin So Kate Đế Đỏ Huyền Thoại.', 
           32000000, 
           3, 
           N'/images/GiayDepNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Giày Dép Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Son Lì Mịn Môi Lâu Trôi Kháng Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Son Lì Mịn Môi Lâu Trôi Kháng Nước', 
           N'Sản phẩm Son Lì Mịn Môi Lâu Trôi Kháng Nước chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kem Chống Nắng Phổ Rộng Nâng Tone Kiềm Dầu SPF50+')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kem Chống Nắng Phổ Rộng Nâng Tone Kiềm Dầu SPF50+', 
           N'Sản phẩm Kem Chống Nắng Phổ Rộng Nâng Tone Kiềm Dầu SPF50+ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nước Tẩy Trang Dịu Nhẹ Cho Da Nhạy Cảm 500ml')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nước Tẩy Trang Dịu Nhẹ Cho Da Nhạy Cảm 500ml', 
           N'Sản phẩm Nước Tẩy Trang Dịu Nhẹ Cho Da Nhạy Cảm 500ml chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sữa Rửa Mặt Tạo Bọt Chiết Xuất Tràm Trà Ngừa Mụn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sữa Rửa Mặt Tạo Bọt Chiết Xuất Tràm Trà Ngừa Mụn', 
           N'Sản phẩm Sữa Rửa Mặt Tạo Bọt Chiết Xuất Tràm Trà Ngừa Mụn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Serum Dưỡng Trắng Mờ Thâm Vitamin C Tinh Khiết')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Serum Dưỡng Trắng Mờ Thâm Vitamin C Tinh Khiết', 
           N'Sản phẩm Serum Dưỡng Trắng Mờ Thâm Vitamin C Tinh Khiết chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kem Dưỡng Ẩm Phục Hồi Hàng Rào Bảo Vệ Da B5')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kem Dưỡng Ẩm Phục Hồi Hàng Rào Bảo Vệ Da B5', 
           N'Sản phẩm Kem Dưỡng Ẩm Phục Hồi Hàng Rào Bảo Vệ Da B5 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mặt Nạ Giấy Cấp Ẩm Chuyên Sâu Hộp 10 Miếng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mặt Nạ Giấy Cấp Ẩm Chuyên Sâu Hộp 10 Miếng', 
           N'Sản phẩm Mặt Nạ Giấy Cấp Ẩm Chuyên Sâu Hộp 10 Miếng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nước Hoa Hồng Toner Cân Bằng Độ pH Se Khít Lỗ Chân Lông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nước Hoa Hồng Toner Cân Bằng Độ pH Se Khít Lỗ Chân Lông', 
           N'Sản phẩm Nước Hoa Hồng Toner Cân Bằng Độ pH Se Khít Lỗ Chân Lông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bút Kẻ Mắt Nước Dạ Ngòi Siêu Mảnh Chống Lem Trôi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bút Kẻ Mắt Nước Dạ Ngòi Siêu Mảnh Chống Lem Trôi', 
           N'Sản phẩm Bút Kẻ Mắt Nước Dạ Ngòi Siêu Mảnh Chống Lem Trôi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Phấn Nước Cushion Che Khuyết Điểm Căng Bóng Da')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Phấn Nước Cushion Che Khuyết Điểm Căng Bóng Da', 
           N'Sản phẩm Phấn Nước Cushion Che Khuyết Điểm Căng Bóng Da chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chì Kẻ Mày 2 Đầu Phẩy Sợi Tự Nhiên Không Vón Cục')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chì Kẻ Mày 2 Đầu Phẩy Sợi Tự Nhiên Không Vón Cục', 
           N'Sản phẩm Chì Kẻ Mày 2 Đầu Phẩy Sợi Tự Nhiên Không Vón Cục chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mascara Dài Và Cong Mi Chống Thấm Nước 24 Giờ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mascara Dài Và Cong Mi Chống Thấm Nước 24 Giờ', 
           N'Sản phẩm Mascara Dài Và Cong Mi Chống Thấm Nước 24 Giờ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bảng Phấn Mắt 9 Ô Tone Cam Đào Nhũ Lấp Lánh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bảng Phấn Mắt 9 Ô Tone Cam Đào Nhũ Lấp Lánh', 
           N'Sản phẩm Bảng Phấn Mắt 9 Ô Tone Cam Đào Nhũ Lấp Lánh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dầu Dưỡng Tóc Argan Phục Hồi Tóc Hư Tổn Chẻ Ngọn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dầu Dưỡng Tóc Argan Phục Hồi Tóc Hư Tổn Chẻ Ngọn', 
           N'Sản phẩm Dầu Dưỡng Tóc Argan Phục Hồi Tóc Hư Tổn Chẻ Ngọn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xịt Khoáng Cấp Ẩm Làm Dịu Da Tức Thì 300ml')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xịt Khoáng Cấp Ẩm Làm Dịu Da Tức Thì 300ml', 
           N'Sản phẩm Xịt Khoáng Cấp Ẩm Làm Dịu Da Tức Thì 300ml chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tẩy Da Chết Toàn Thân Hạt Cà Phê Đắk Lắk Mịn Da')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tẩy Da Chết Toàn Thân Hạt Cà Phê Đắk Lắk Mịn Da', 
           N'Sản phẩm Tẩy Da Chết Toàn Thân Hạt Cà Phê Đắk Lắk Mịn Da chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kem Dưỡng Thể Trắng Da Ban Đêm Hương Nước Hoa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kem Dưỡng Thể Trắng Da Ban Đêm Hương Nước Hoa', 
           N'Sản phẩm Kem Dưỡng Thể Trắng Da Ban Đêm Hương Nước Hoa chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bông Tẩy Trang 100% Cotton Tự Nhiên Túi 222 Miếng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bông Tẩy Trang 100% Cotton Tự Nhiên Túi 222 Miếng', 
           N'Sản phẩm Bông Tẩy Trang 100% Cotton Tự Nhiên Túi 222 Miếng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cọ Trang Điểm Đa Năng Tán Phấn Nền Mềm Mịn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cọ Trang Điểm Đa Năng Tán Phấn Nền Mềm Mịn', 
           N'Sản phẩm Cọ Trang Điểm Đa Năng Tán Phấn Nền Mềm Mịn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dưỡng Môi Mỡ Hươu Chống Nứt Nẻ Khô Môi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dưỡng Môi Mỡ Hươu Chống Nứt Nẻ Khô Môi', 
           N'Sản phẩm Dưỡng Môi Mỡ Hươu Chống Nứt Nẻ Khô Môi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kem Trị Sẹo Lồi Chiết Xuất Hành Tây Nhập Khẩu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kem Trị Sẹo Lồi Chiết Xuất Hành Tây Nhập Khẩu', 
           N'Sản phẩm Kem Trị Sẹo Lồi Chiết Xuất Hành Tây Nhập Khẩu tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Phấn Nụ Cung Đình Huế Gia Truyền Dưỡng Da')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Phấn Nụ Cung Đình Huế Gia Truyền Dưỡng Da', 
           N'Sản phẩm Phấn Nụ Cung Đình Huế Gia Truyền Dưỡng Da đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Mỹ Phẩm Hoàng Cung Cao Cấp Whoo Cheongidan Hwa Hyun')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Mỹ Phẩm Hoàng Cung Cao Cấp Whoo Cheongidan Hwa Hyun', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Bộ Mỹ Phẩm Hoàng Cung Cao Cấp Whoo Cheongidan Hwa Hyun.', 
           33000000, 
           3, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mỹ Phẩm & Chăm Sóc Sắc Đẹp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nồi Chiên Không Dầu Dung Tích Lớn 8 Lít Kính Cường Lực')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nồi Chiên Không Dầu Dung Tích Lớn 8 Lít Kính Cường Lực', 
           N'Sản phẩm Nồi Chiên Không Dầu Dung Tích Lớn 8 Lít Kính Cường Lực chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Hút Bụi Cầm Tay Không Dây Lực Hút Khủng 16000Pa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Hút Bụi Cầm Tay Không Dây Lực Hút Khủng 16000Pa', 
           N'Sản phẩm Máy Hút Bụi Cầm Tay Không Dây Lực Hút Khủng 16000Pa chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Chăn Ga Gối Cotton Tencel Modal 4 Món Cao Cấp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Chăn Ga Gối Cotton Tencel Modal 4 Món Cao Cấp', 
           N'Sản phẩm Bộ Chăn Ga Gối Cotton Tencel Modal 4 Món Cao Cấp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nồi Cơm Điện Cao Tần Tách Đường Lòng Nồi Niêu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nồi Cơm Điện Cao Tần Tách Đường Lòng Nồi Niêu', 
           N'Sản phẩm Nồi Cơm Điện Cao Tần Tách Đường Lòng Nồi Niêu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Giữ Nhiệt Inox 316 Nắp Có Ống Hút Dung Tích 1000ml')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Giữ Nhiệt Inox 316 Nắp Có Ống Hút Dung Tích 1000ml', 
           N'Sản phẩm Bình Giữ Nhiệt Inox 316 Nắp Có Ống Hút Dung Tích 1000ml chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Cơm Cắm Điện Giữ Nhiệt 3 Tầng Tự Nấu Chín Thức Ăn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Cơm Cắm Điện Giữ Nhiệt 3 Tầng Tự Nấu Chín Thức Ăn', 
           N'Sản phẩm Hộp Cơm Cắm Điện Giữ Nhiệt 3 Tầng Tự Nấu Chín Thức Ăn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kệ Để Đồ Đa Năng 4 Tầng Bánh Xe Di Chuyển Thông Minh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kệ Để Đồ Đa Năng 4 Tầng Bánh Xe Di Chuyển Thông Minh', 
           N'Sản phẩm Kệ Để Đồ Đa Năng 4 Tầng Bánh Xe Di Chuyển Thông Minh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thảm Lau Chân Đá Siêu Thấm Hút Nhanh Khô Chống Trượt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thảm Lau Chân Đá Siêu Thấm Hút Nhanh Khô Chống Trượt', 
           N'Sản phẩm Thảm Lau Chân Đá Siêu Thấm Hút Nhanh Khô Chống Trượt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cây Lau Nhà Tự Vắt Thông Minh Xoay 360 Độ Kèm Thùng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cây Lau Nhà Tự Vắt Thông Minh Xoay 360 Độ Kèm Thùng', 
           N'Sản phẩm Cây Lau Nhà Tự Vắt Thông Minh Xoay 360 Độ Kèm Thùng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Ngủ Cảm Ứng Chuyển Động Tự Động Sáng Ban Đêm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Ngủ Cảm Ứng Chuyển Động Tự Động Sáng Ban Đêm', 
           N'Sản phẩm Đèn Ngủ Cảm Ứng Chuyển Động Tự Động Sáng Ban Đêm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gối Cao Su Non Công Thái Học Chống Đau Mỏi Vai Gáy')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gối Cao Su Non Công Thái Học Chống Đau Mỏi Vai Gáy', 
           N'Sản phẩm Gối Cao Su Non Công Thái Học Chống Đau Mỏi Vai Gáy chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khăn Tắm Cotton Xuất Khẩu Thấm Hút Kích Thước Lớn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khăn Tắm Cotton Xuất Khẩu Thấm Hút Kích Thước Lớn', 
           N'Sản phẩm Khăn Tắm Cotton Xuất Khẩu Thấm Hút Kích Thước Lớn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Móc Treo Quần Áo Chống Trượt Vai Độn Nhựa Dẻo Set 10')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Móc Treo Quần Áo Chống Trượt Vai Độn Nhựa Dẻo Set 10', 
           N'Sản phẩm Bộ Móc Treo Quần Áo Chống Trượt Vai Độn Nhựa Dẻo Set 10 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Đựng Giày Dép Quần Áo Khung Thép Xếp Gọn Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Đựng Giày Dép Quần Áo Khung Thép Xếp Gọn Tiện Lợi', 
           N'Sản phẩm Hộp Đựng Giày Dép Quần Áo Khung Thép Xếp Gọn Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tinh Dầu Thơm Phòng Que Mây Khuếch Tán Hương Tự Nhiên')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tinh Dầu Thơm Phòng Que Mây Khuếch Tán Hương Tự Nhiên', 
           N'Sản phẩm Tinh Dầu Thơm Phòng Que Mây Khuếch Tán Hương Tự Nhiên chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nến Thơm Thư Giãn Sáp Đậu Nành Hương Hoa Cỏ Thiên Nhiên')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nến Thơm Thư Giãn Sáp Đậu Nành Hương Hoa Cỏ Thiên Nhiên', 
           N'Sản phẩm Nến Thơm Thư Giãn Sáp Đậu Nành Hương Hoa Cỏ Thiên Nhiên chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Hút Chân Không Bảo Quản Quần Áo Chăn Màn Kèm Bơm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Hút Chân Không Bảo Quản Quần Áo Chăn Màn Kèm Bơm', 
           N'Sản phẩm Túi Hút Chân Không Bảo Quản Quần Áo Chăn Màn Kèm Bơm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Xịt Tưới Cây Áp Suất Khí Nén Cầm Tay 2 Lít')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Xịt Tưới Cây Áp Suất Khí Nén Cầm Tay 2 Lít', 
           N'Sản phẩm Bình Xịt Tưới Cây Áp Suất Khí Nén Cầm Tay 2 Lít chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ổ Cắm Điện Chịu Tải Cao Có Cổng Sạc Nhanh Type-C USB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ổ Cắm Điện Chịu Tải Cao Có Cổng Sạc Nhanh Type-C USB', 
           N'Sản phẩm Ổ Cắm Điện Chịu Tải Cao Có Cổng Sạc Nhanh Type-C USB chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Móc Dán Tường Siêu Dính Chịu Lực 10kg Không Cần Khoan')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Móc Dán Tường Siêu Dính Chịu Lực 10kg Không Cần Khoan', 
           N'Sản phẩm Móc Dán Tường Siêu Dính Chịu Lực 10kg Không Cần Khoan chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bếp Lò Nướng Than Hoa Không Khói Du Lịch Dã Ngoại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bếp Lò Nướng Than Hoa Không Khói Du Lịch Dã Ngoại', 
           N'Sản phẩm Bếp Lò Nướng Than Hoa Không Khói Du Lịch Dã Ngoại tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đồ Thờ Bát Tràng Men Lam Cổ Điển Mạ Vàng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đồ Thờ Bát Tràng Men Lam Cổ Điển Mạ Vàng', 
           N'Sản phẩm Bộ Đồ Thờ Bát Tràng Men Lam Cổ Điển Mạ Vàng đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Bàn Ăn Gỗ Óc Chó Tự Nhiên 8 Ghế Phong Cách Bắc Âu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Bàn Ăn Gỗ Óc Chó Tự Nhiên 8 Ghế Phong Cách Bắc Âu', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Bộ Bàn Ăn Gỗ Óc Chó Tự Nhiên 8 Ghế Phong Cách Bắc Âu.', 
           34000000, 
           3, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Nhà Cửa & Đời Sống';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Xách Nữ Công Sở Da Mềm Size Lớn Đựng Vừa A4')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Xách Nữ Công Sở Da Mềm Size Lớn Đựng Vừa A4', 
           N'Sản phẩm Túi Xách Nữ Công Sở Da Mềm Size Lớn Đựng Vừa A4 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/TuiViNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Đeo Chéo Nữ Dây Xích Nắp Gập Họa Tiết Quả Trám')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Đeo Chéo Nữ Dây Xích Nắp Gập Họa Tiết Quả Trám', 
           N'Sản phẩm Túi Đeo Chéo Nữ Dây Xích Nắp Gập Họa Tiết Quả Trám chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/TuiViNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ví Nữ Cầm Tay Dáng Dài Nhiều Ngăn Khóa Kéo Mạ Vàng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ví Nữ Cầm Tay Dáng Dài Nhiều Ngăn Khóa Kéo Mạ Vàng', 
           N'Sản phẩm Ví Nữ Cầm Tay Dáng Dài Nhiều Ngăn Khóa Kéo Mạ Vàng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/TuiViNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Balo Nữ Da Mini Thời Trang Phong Cách Trẻ Trung Đi Chơi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Balo Nữ Da Mini Thời Trang Phong Cách Trẻ Trung Đi Chơi', 
           N'Sản phẩm Balo Nữ Da Mini Thời Trang Phong Cách Trẻ Trung Đi Chơi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/TuiViNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Kẹp Nách Nữ Da Bóng Xu Hướng Thời Trang Mới')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Kẹp Nách Nữ Da Bóng Xu Hướng Thời Trang Mới', 
           N'Sản phẩm Túi Kẹp Nách Nữ Da Bóng Xu Hướng Thời Trang Mới chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/TuiViNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Tote Vải Canvas Mộc Quai Đeo Vai Đựng Laptop')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Tote Vải Canvas Mộc Quai Đeo Vai Đựng Laptop', 
           N'Sản phẩm Túi Tote Vải Canvas Mộc Quai Đeo Vai Đựng Laptop chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/TuiViNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Hộp Nữ Khóa Bấm Vintage Nhỏ Nhắn Dễ Phối Đồ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Hộp Nữ Khóa Bấm Vintage Nhỏ Nhắn Dễ Phối Đồ', 
           N'Sản phẩm Túi Hộp Nữ Khóa Bấm Vintage Nhỏ Nhắn Dễ Phối Đồ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/TuiViNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ví Nữ Mini Gấp 3 Bỏ Túi Đựng Thẻ Tiền Nhỏ Gọn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ví Nữ Mini Gấp 3 Bỏ Túi Đựng Thẻ Tiền Nhỏ Gọn', 
           N'Sản phẩm Ví Nữ Mini Gấp 3 Bỏ Túi Đựng Thẻ Tiền Nhỏ Gọn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/TuiViNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Đeo Chéo Phao Chần Bông Siêu Nhẹ Năng Động Nữ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Đeo Chéo Phao Chần Bông Siêu Nhẹ Năng Động Nữ', 
           N'Sản phẩm Túi Đeo Chéo Phao Chần Bông Siêu Nhẹ Năng Động Nữ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/TuiViNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Trong Suốt Đi Biển Chống Nước Quai Da Thời Thượng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Trong Suốt Đi Biển Chống Nước Quai Da Thời Thượng', 
           N'Sản phẩm Túi Trong Suốt Đi Biển Chống Nước Quai Da Thời Thượng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/TuiViNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Balo Nữ Vải Dù Chống Nước Nhiều Ngăn Đi Học Du Lịch')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Balo Nữ Vải Dù Chống Nước Nhiều Ngăn Đi Học Du Lịch', 
           N'Sản phẩm Balo Nữ Vải Dù Chống Nước Nhiều Ngăn Đi Học Du Lịch chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/TuiViNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Cầm Tay Dạ Hội Đính Đá Pha Lê Lấp Lánh Sang Trọng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Cầm Tay Dạ Hội Đính Đá Pha Lê Lấp Lánh Sang Trọng', 
           N'Sản phẩm Túi Cầm Tay Dạ Hội Đính Đá Pha Lê Lấp Lánh Sang Trọng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/TuiViNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Bao Tử Nữ Đeo Hông Ngực Thể Thao Cá Tính')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Bao Tử Nữ Đeo Hông Ngực Thể Thao Cá Tính', 
           N'Sản phẩm Túi Bao Tử Nữ Đeo Hông Ngực Thể Thao Cá Tính chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/TuiViNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Quai Đeo Túi Thay Thế Thêu Thổ Cẩm Bản To')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Quai Đeo Túi Thay Thế Thêu Thổ Cẩm Bản To', 
           N'Sản phẩm Dây Quai Đeo Túi Thay Thế Thêu Thổ Cẩm Bản To chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/TuiViNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Móc Khóa Gấu Bông Xù Đeo Túi Xách Dễ Thương Nữ Tính')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Móc Khóa Gấu Bông Xù Đeo Túi Xách Dễ Thương Nữ Tính', 
           N'Sản phẩm Móc Khóa Gấu Bông Xù Đeo Túi Xách Dễ Thương Nữ Tính chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/TuiViNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Vải Đi Chợ Gấp Gọn Bảo Vệ Môi Trường Chống Thấm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Vải Đi Chợ Gấp Gọn Bảo Vệ Môi Trường Chống Thấm', 
           N'Sản phẩm Túi Vải Đi Chợ Gấp Gọn Bảo Vệ Môi Trường Chống Thấm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/TuiViNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ví Đựng Thẻ Căn Cước Namecard Có Nút Bấm Khóa Từ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ví Đựng Thẻ Căn Cước Namecard Có Nút Bấm Khóa Từ', 
           N'Sản phẩm Ví Đựng Thẻ Căn Cước Namecard Có Nút Bấm Khóa Từ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/TuiViNu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Đeo Vai Nữ Quai Nhún Mây Bèo Nữ Tính Bắt Mắt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Đeo Vai Nữ Quai Nhún Mây Bèo Nữ Tính Bắt Mắt', 
           N'Sản phẩm Túi Đeo Vai Nữ Quai Nhún Mây Bèo Nữ Tính Bắt Mắt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/TuiViNu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Đựng Mỹ Phẩm Đồ Trang Điểm Chống Nước Có Quai Xách')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Đựng Mỹ Phẩm Đồ Trang Điểm Chống Nước Có Quai Xách', 
           N'Sản phẩm Túi Đựng Mỹ Phẩm Đồ Trang Điểm Chống Nước Có Quai Xách chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/TuiViNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Xích Mạ Vàng Đeo Túi Xách Chống Rỉ Sét')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Xích Mạ Vàng Đeo Túi Xách Chống Rỉ Sét', 
           N'Sản phẩm Dây Xích Mạ Vàng Đeo Túi Xách Chống Rỉ Sét chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/TuiViNu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Mây Tre Đan Thủ Công Xuất Khẩu Phong Cách Boho')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Mây Tre Đan Thủ Công Xuất Khẩu Phong Cách Boho', 
           N'Sản phẩm Túi Mây Tre Đan Thủ Công Xuất Khẩu Phong Cách Boho tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/TuiViNu01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Xách Da Cá Sấu Nữ Đã Ngưng Dòng Sản Xuất')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Xách Da Cá Sấu Nữ Đã Ngưng Dòng Sản Xuất', 
           N'Sản phẩm Túi Xách Da Cá Sấu Nữ Đã Ngưng Dòng Sản Xuất đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/TuiViNu02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Hermes Birkin 25 Da Togo Màu Cam Huyền Thoại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Hermes Birkin 25 Da Togo Màu Cam Huyền Thoại', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Túi Hermes Birkin 25 Da Togo Màu Cam Huyền Thoại.', 
           35000000, 
           3, 
           N'/images/TuiViNu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Túi Ví Nữ';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tivi Thông Minh 4K 55 Inch Tràn Viền Giọng Nói')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tivi Thông Minh 4K 55 Inch Tràn Viền Giọng Nói', 
           N'Sản phẩm Tivi Thông Minh 4K 55 Inch Tràn Viền Giọng Nói chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Loa Bluetooth Kháng Nước Di Động Bass Căng Trầm Ấm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Loa Bluetooth Kháng Nước Di Động Bass Căng Trầm Ấm', 
           N'Sản phẩm Loa Bluetooth Kháng Nước Di Động Bass Căng Trầm Ấm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Camera An Ninh Gia Đình 360 Độ Đàm Thoại 2 Chiều Ban Đêm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Camera An Ninh Gia Đình 360 Độ Đàm Thoại 2 Chiều Ban Đêm', 
           N'Sản phẩm Camera An Ninh Gia Đình 360 Độ Đàm Thoại 2 Chiều Ban Đêm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Chiếu Mini Full HD Di Động Kết Nối Điện Thoại Không Dây')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Chiếu Mini Full HD Di Động Kết Nối Điện Thoại Không Dây', 
           N'Sản phẩm Máy Chiếu Mini Full HD Di Động Kết Nối Điện Thoại Không Dây chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Micro Karaoke Không Dây Tích Hợp Loa Bluetooth Cầm Tay')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Micro Karaoke Không Dây Tích Hợp Loa Bluetooth Cầm Tay', 
           N'Sản phẩm Micro Karaoke Không Dây Tích Hợp Loa Bluetooth Cầm Tay chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Chơi Game Cầm Tay Retro Tích Hợp 500 Trò Tuổi Thơ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Chơi Game Cầm Tay Retro Tích Hợp 500 Trò Tuổi Thơ', 
           N'Sản phẩm Máy Chơi Game Cầm Tay Retro Tích Hợp 500 Trò Tuổi Thơ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Android TV Box Biến Tivi Thường Thành Thông Minh RAM 4GB')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Android TV Box Biến Tivi Thường Thành Thông Minh RAM 4GB', 
           N'Sản phẩm Android TV Box Biến Tivi Thường Thành Thông Minh RAM 4GB chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Phát Wifi 4G Không Dây Cắm Sim Di Động Tốc Độ Cao')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Phát Wifi 4G Không Dây Cắm Sim Di Động Tốc Độ Cao', 
           N'Sản phẩm Bộ Phát Wifi 4G Không Dây Cắm Sim Di Động Tốc Độ Cao chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chuông Cửa Thông Minh Có Màn Hình Camera Không Dây Wifi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chuông Cửa Thông Minh Có Màn Hình Camera Không Dây Wifi', 
           N'Sản phẩm Chuông Cửa Thông Minh Có Màn Hình Camera Không Dây Wifi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồng Hồ Đo Điện Vạn Năng Kỹ Thuật Số Tự Động Thợ Điện')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồng Hồ Đo Điện Vạn Năng Kỹ Thuật Số Tự Động Thợ Điện', 
           N'Sản phẩm Đồng Hồ Đo Điện Vạn Năng Kỹ Thuật Số Tự Động Thợ Điện chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kính Thực Tế Ảo VR Trải Nghiệm Phim 3D Chơi Game Sống Động')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kính Thực Tế Ảo VR Trải Nghiệm Phim 3D Chơi Game Sống Động', 
           N'Sản phẩm Kính Thực Tế Ảo VR Trải Nghiệm Phim 3D Chơi Game Sống Động chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đàm Cầm Tay Tầm Xa 3km Chuyên Dụng Sự Kiện Bảo Vệ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đàm Cầm Tay Tầm Xa 3km Chuyên Dụng Sự Kiện Bảo Vệ', 
           N'Sản phẩm Bộ Đàm Cầm Tay Tầm Xa 3km Chuyên Dụng Sự Kiện Bảo Vệ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Đo Huyết Áp Điện Tử Bắp Tay Đọc Giọng Nói Tiếng Việt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Đo Huyết Áp Điện Tử Bắp Tay Đọc Giọng Nói Tiếng Việt', 
           N'Sản phẩm Máy Đo Huyết Áp Điện Tử Bắp Tay Đọc Giọng Nói Tiếng Việt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cân Điện Tử Sức Khỏe Đo Chỉ Số Cơ Mỡ Cơ Thể Bluetooth')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cân Điện Tử Sức Khỏe Đo Chỉ Số Cơ Mỡ Cơ Thể Bluetooth', 
           N'Sản phẩm Cân Điện Tử Sức Khỏe Đo Chỉ Số Cơ Mỡ Cơ Thể Bluetooth chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thiết Bị Tìm Kiếm Đồ Đạc Thất Lạc Thông Minh Định Vị GPS')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thiết Bị Tìm Kiếm Đồ Đạc Thất Lạc Thông Minh Định Vị GPS', 
           N'Sản phẩm Thiết Bị Tìm Kiếm Đồ Đạc Thất Lạc Thông Minh Định Vị GPS chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Kích Sóng Wifi 2 Băng Tần Xuyên Tường Khỏe 1200Mbps')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Kích Sóng Wifi 2 Băng Tần Xuyên Tường Khỏe 1200Mbps', 
           N'Sản phẩm Bộ Kích Sóng Wifi 2 Băng Tần Xuyên Tường Khỏe 1200Mbps chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Pin Siêu Sáng Chiếu Xa 500m Chống Nước Sạc Type-C')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Pin Siêu Sáng Chiếu Xa 500m Chống Nước Sạc Type-C', 
           N'Sản phẩm Đèn Pin Siêu Sáng Chiếu Xa 500m Chống Nước Sạc Type-C chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bút Trình Chiếu Laser Không Dây Lật Trang Slide Thuyết Trình')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bút Trình Chiếu Laser Không Dây Lật Trang Slide Thuyết Trình', 
           N'Sản phẩm Bút Trình Chiếu Laser Không Dây Lật Trang Slide Thuyết Trình chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Pin Tiểu Sạc Lại AA 1.2V Dung Lượng Cao Kèm Đốc Sạc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Pin Tiểu Sạc Lại AA 1.2V Dung Lượng Cao Kèm Đốc Sạc', 
           N'Sản phẩm Pin Tiểu Sạc Lại AA 1.2V Dung Lượng Cao Kèm Đốc Sạc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mạch Chuyển Đổi Nguồn Điện Inverter 12V Lên 220V Trên Xe')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mạch Chuyển Đổi Nguồn Điện Inverter 12V Lên 220V Trên Xe', 
           N'Sản phẩm Mạch Chuyển Đổi Nguồn Điện Inverter 12V Lên 220V Trên Xe chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầu Đĩa DVD Karaoke Cổ Cắm Cổng AV Đã Qua Sử Dụng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầu Đĩa DVD Karaoke Cổ Cắm Cổng AV Đã Qua Sử Dụng', 
           N'Sản phẩm Đầu Đĩa DVD Karaoke Cổ Cắm Cổng AV Đã Qua Sử Dụng tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Quét Mã Vạch Laser Công Nghiệp Đơn Điểm Cũ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Quét Mã Vạch Laser Công Nghiệp Đơn Điểm Cũ', 
           N'Sản phẩm Máy Quét Mã Vạch Laser Công Nghiệp Đơn Điểm Cũ đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Smart TV OLED Sony Bravia 77 Inch 4K HDR XR Cognitive Processor')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Smart TV OLED Sony Bravia 77 Inch 4K HDR XR Cognitive Processor', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Smart TV OLED Sony Bravia 77 Inch 4K HDR XR Cognitive Processor.', 
           36000000, 
           3, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Tử';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xe Đẩy Gấp Gọn Siêu Nhẹ 2 Chiều Cho Bé Đi Du Lịch')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xe Đẩy Gấp Gọn Siêu Nhẹ 2 Chiều Cho Bé Đi Du Lịch', 
           N'Sản phẩm Xe Đẩy Gấp Gọn Siêu Nhẹ 2 Chiều Cho Bé Đi Du Lịch chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Sữa Cổ Rộng Núm Ti Mềm Mô Phỏng Ti Mẹ Chống Sặc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Sữa Cổ Rộng Núm Ti Mềm Mô Phỏng Ti Mẹ Chống Sặc', 
           N'Sản phẩm Bình Sữa Cổ Rộng Núm Ti Mềm Mô Phỏng Ti Mẹ Chống Sặc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tã Bỉm Dán Siêu Thấm Hút Chống Hăm Lưng Thun Đệm Mây')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tã Bỉm Dán Siêu Thấm Hút Chống Hăm Lưng Thun Đệm Mây', 
           N'Sản phẩm Tã Bỉm Dán Siêu Thấm Hút Chống Hăm Lưng Thun Đệm Mây chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Hút Sữa Điện Đôi Massage Kích Sữa Không Dây Rảnh Tay')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Hút Sữa Điện Đôi Massage Kích Sữa Không Dây Rảnh Tay', 
           N'Sản phẩm Máy Hút Sữa Điện Đôi Massage Kích Sữa Không Dây Rảnh Tay chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Tiệt Trùng Sấy Khô Bình Sữa Bằng Tia UVC Đa Năng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Tiệt Trùng Sấy Khô Bình Sữa Bằng Tia UVC Đa Năng', 
           N'Sản phẩm Máy Tiệt Trùng Sấy Khô Bình Sữa Bằng Tia UVC Đa Năng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nhiệt Kế Hồng Ngoại Đo Trán Tai Điện Tử Không Chạm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nhiệt Kế Hồng Ngoại Đo Trán Tai Điện Tử Không Chạm', 
           N'Sản phẩm Nhiệt Kế Hồng Ngoại Đo Trán Tai Điện Tử Không Chạm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ghế Ăn Dặm Đa Năng Điều Chỉnh Độ Cao Bàn Ăn Tháo Rời')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ghế Ăn Dặm Đa Năng Điều Chỉnh Độ Cao Bàn Ăn Tháo Rời', 
           N'Sản phẩm Ghế Ăn Dặm Đa Năng Điều Chỉnh Độ Cao Bàn Ăn Tháo Rời chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đồ Chơi Xếp Hình Khối Gỗ An Toàn Phát Triển Trí Tuệ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đồ Chơi Xếp Hình Khối Gỗ An Toàn Phát Triển Trí Tuệ', 
           N'Sản phẩm Bộ Đồ Chơi Xếp Hình Khối Gỗ An Toàn Phát Triển Trí Tuệ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sữa Tắm Gội Hữu Cơ 2 Trong 1 Dịu Nhẹ Không Cay Mắt Cho Bé')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sữa Tắm Gội Hữu Cơ 2 Trong 1 Dịu Nhẹ Không Cay Mắt Cho Bé', 
           N'Sản phẩm Sữa Tắm Gội Hữu Cơ 2 Trong 1 Dịu Nhẹ Không Cay Mắt Cho Bé chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thau Chậu Tắm Gấp Gọn Có Nhiệt Kế Kèm Phao Tắm An Toàn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thau Chậu Tắm Gấp Gọn Có Nhiệt Kế Kèm Phao Tắm An Toàn', 
           N'Sản phẩm Thau Chậu Tắm Gấp Gọn Có Nhiệt Kế Kèm Phao Tắm An Toàn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Địu Ngồi Trợ Lực 4 Tư Thế Chống Gù Lưng Mẹ Không Mỏi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Địu Ngồi Trợ Lực 4 Tư Thế Chống Gù Lưng Mẹ Không Mỏi', 
           N'Sản phẩm Địu Ngồi Trợ Lực 4 Tư Thế Chống Gù Lưng Mẹ Không Mỏi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khăn Sữa Sợi Tre 6 Lớp Siêu Mềm Không Bụi Vải Set 10')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khăn Sữa Sợi Tre 6 Lớp Siêu Mềm Không Bụi Vải Set 10', 
           N'Sản phẩm Khăn Sữa Sợi Tre 6 Lớp Siêu Mềm Không Bụi Vải Set 10 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Chế Biến Ăn Dặm Kiểu Nhật Bằng Gốm Sứ An Toàn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Chế Biến Ăn Dặm Kiểu Nhật Bằng Gốm Sứ An Toàn', 
           N'Sản phẩm Bộ Chế Biến Ăn Dặm Kiểu Nhật Bằng Gốm Sứ An Toàn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gối Chống Trào Ngược Cho Trẻ Sơ Sinh Đệm Dốc Êm Ái')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gối Chống Trào Ngược Cho Trẻ Sơ Sinh Đệm Dốc Êm Ái', 
           N'Sản phẩm Gối Chống Trào Ngược Cho Trẻ Sơ Sinh Đệm Dốc Êm Ái chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kem Hăm Tã Chiết Xuất Cúc La Mã Làm Dịu Vết Đỏ Cho Bé')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kem Hăm Tã Chiết Xuất Cúc La Mã Làm Dịu Vết Đỏ Cho Bé', 
           N'Sản phẩm Kem Hăm Tã Chiết Xuất Cúc La Mã Làm Dịu Vết Đỏ Cho Bé chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bát Tập Ăn Chống Đổ Có Đế Hít Silicon Kèm Thìa Báo Nóng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bát Tập Ăn Chống Đổ Có Đế Hít Silicon Kèm Thìa Báo Nóng', 
           N'Sản phẩm Bát Tập Ăn Chống Đổ Có Đế Hít Silicon Kèm Thìa Báo Nóng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dụng Cụ Hút Mũi Cho Bé Đầu Silicon Mềm Hút Êm Không Đau')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dụng Cụ Hút Mũi Cho Bé Đầu Silicon Mềm Hút Êm Không Đau', 
           N'Sản phẩm Dụng Cụ Hút Mũi Cho Bé Đầu Silicon Mềm Hút Êm Không Đau chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ti Giả Chỉnh Nha Silicon Siêu Mềm Cho Bé Ngủ Ngon')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ti Giả Chỉnh Nha Silicon Siêu Mềm Cho Bé Ngủ Ngon', 
           N'Sản phẩm Ti Giả Chỉnh Nha Silicon Siêu Mềm Cho Bé Ngủ Ngon chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Yếm Ăn Dặm Silicon Có Máng Hứng Thức Ăn Chống Bẩn Rơi Vãi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Yếm Ăn Dặm Silicon Có Máng Hứng Thức Ăn Chống Bẩn Rơi Vãi', 
           N'Sản phẩm Yếm Ăn Dặm Silicon Có Máng Hứng Thức Ăn Chống Bẩn Rơi Vãi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gặm Nướu Hươu Cao Cổ Silicon Chống Ngứa Lợi Cho Trẻ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gặm Nướu Hươu Cao Cổ Silicon Chống Ngứa Lợi Cho Trẻ', 
           N'Sản phẩm Gặm Nướu Hươu Cao Cổ Silicon Chống Ngứa Lợi Cho Trẻ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nôi Rung Tự Động Ru Bé Ngủ Có Nhạc Ru Hẹn Giờ Tắt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nôi Rung Tự Động Ru Bé Ngủ Có Nhạc Ru Hẹn Giờ Tắt', 
           N'Sản phẩm Nôi Rung Tự Động Ru Bé Ngủ Có Nhạc Ru Hẹn Giờ Tắt tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Nôi Cũi Gỗ Thông Tự Nhiên Xuất Khẩu Kèm Nệm Bông Ép')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Nôi Cũi Gỗ Thông Tự Nhiên Xuất Khẩu Kèm Nệm Bông Ép', 
           N'Sản phẩm Bộ Nôi Cũi Gỗ Thông Tự Nhiên Xuất Khẩu Kèm Nệm Bông Ép đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xe Đẩy Trẻ Em Hoàng Gia Cao Cấp Cybex Priam Jeremy Scott Wings')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xe Đẩy Trẻ Em Hoàng Gia Cao Cấp Cybex Priam Jeremy Scott Wings', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Xe Đẩy Trẻ Em Hoàng Gia Cao Cấp Cybex Priam Jeremy Scott Wings.', 
           37000000, 
           3, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Mẹ & Bé';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thảm Tập Yoga Định Tuyến Chống Trượt TPE Dày 8mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thảm Tập Yoga Định Tuyến Chống Trượt TPE Dày 8mm', 
           N'Sản phẩm Thảm Tập Yoga Định Tuyến Chống Trượt TPE Dày 8mm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Nước Thể Thao Dung Tích 2 Lít Có Vạch Báo Giờ Uống')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Nước Thể Thao Dung Tích 2 Lít Có Vạch Báo Giờ Uống', 
           N'Sản phẩm Bình Nước Thể Thao Dung Tích 2 Lít Có Vạch Báo Giờ Uống chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Nhảy Thể Lực Đếm Số Tự Động Lõi Cáp Thép Chống Rối')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Nhảy Thể Lực Đếm Số Tự Động Lõi Cáp Thép Chống Rối', 
           N'Sản phẩm Dây Nhảy Thể Lực Đếm Số Tự Động Lõi Cáp Thép Chống Rối chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Dây Kháng Lực Đàn Hồi Tập Mông Đùi Toàn Thân 5 Cấp Độ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Dây Kháng Lực Đàn Hồi Tập Mông Đùi Toàn Thân 5 Cấp Độ', 
           N'Sản phẩm Bộ Dây Kháng Lực Đàn Hồi Tập Mông Đùi Toàn Thân 5 Cấp Độ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Trống Thể Thao Tập Gym Có Ngăn Để Giày Riêng Biệt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Trống Thể Thao Tập Gym Có Ngăn Để Giày Riêng Biệt', 
           N'Sản phẩm Túi Trống Thể Thao Tập Gym Có Ngăn Để Giày Riêng Biệt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bọc Cổ Tay Băng Quấn Khớp Cổ Tay Tập Tạ Trợ Lực Chấn Thương')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bọc Cổ Tay Băng Quấn Khớp Cổ Tay Tập Tạ Trợ Lực Chấn Thương', 
           N'Sản phẩm Bọc Cổ Tay Băng Quấn Khớp Cổ Tay Tập Tạ Trợ Lực Chấn Thương chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Băng Đô Thể Thao Cài Tóc Thấm Hút Mồ Hôi Trán Co Giãn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Băng Đô Thể Thao Cài Tóc Thấm Hút Mồ Hôi Trán Co Giãn', 
           N'Sản phẩm Băng Đô Thể Thao Cài Tóc Thấm Hút Mồ Hôi Trán Co Giãn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kính Bơi Chống Đọng Sương Chống Tia UV Kèm Nút Bịt Tai')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kính Bơi Chống Đọng Sương Chống Tia UV Kèm Nút Bịt Tai', 
           N'Sản phẩm Kính Bơi Chống Đọng Sương Chống Tia UV Kèm Nút Bịt Tai chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mũ Bơi Silicon Ôm Sát Đầu Bảo Vệ Tóc Không Ướt Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mũ Bơi Silicon Ôm Sát Đầu Bảo Vệ Tóc Không Ướt Nước', 
           N'Sản phẩm Mũ Bơi Silicon Ôm Sát Đầu Bảo Vệ Tóc Không Ướt Nước chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Bơi Nữ Tay Dài Chống Nắng Chống Trầy Xước Lặn Biển')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Bơi Nữ Tay Dài Chống Nắng Chống Trầy Xước Lặn Biển', 
           N'Sản phẩm Áo Bơi Nữ Tay Dài Chống Nắng Chống Trầy Xước Lặn Biển chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quần Bơi Nam Dạng Lửng Nhanh Khô Co Giãn Đàn Hồi Tốt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quần Bơi Nam Dạng Lửng Nhanh Khô Co Giãn Đàn Hồi Tốt', 
           N'Sản phẩm Quần Bơi Nam Dạng Lửng Nhanh Khô Co Giãn Đàn Hồi Tốt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Lều Du Lịch Cắm Trại Bật Tự Động 4 Người Chống Mưa Gió')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Lều Du Lịch Cắm Trại Bật Tự Động 4 Người Chống Mưa Gió', 
           N'Sản phẩm Lều Du Lịch Cắm Trại Bật Tự Động 4 Người Chống Mưa Gió chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đệm Hơi Tự Bơm Dã Ngoại Gấp Gọn Lót Đáy Lều Êm Ái')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đệm Hơi Tự Bơm Dã Ngoại Gấp Gọn Lót Đáy Lều Êm Ái', 
           N'Sản phẩm Đệm Hơi Tự Bơm Dã Ngoại Gấp Gọn Lót Đáy Lều Êm Ái chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bếp Ga Mini Gấp Gọn Du Lịch Dã Ngoại Đánh Lửa Tự Động')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bếp Ga Mini Gấp Gọn Du Lịch Dã Ngoại Đánh Lửa Tự Động', 
           N'Sản phẩm Bếp Ga Mini Gấp Gọn Du Lịch Dã Ngoại Đánh Lửa Tự Động chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gậy Leo Núi Chống Sốc Hợp Kim Nhôm Siêu Nhẹ Rút Gọn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gậy Leo Núi Chống Sốc Hợp Kim Nhôm Siêu Nhẹ Rút Gọn', 
           N'Sản phẩm Gậy Leo Núi Chống Sốc Hợp Kim Nhôm Siêu Nhẹ Rút Gọn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Đeo Đầu Chiếu Sáng Đi Phượt Dã Ngoại Chống Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Đeo Đầu Chiếu Sáng Đi Phượt Dã Ngoại Chống Nước', 
           N'Sản phẩm Đèn Đeo Đầu Chiếu Sáng Đi Phượt Dã Ngoại Chống Nước chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Ngủ Văn Phòng Du Lịch Gấp Gọn Ấm Áp Mùa Đông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Ngủ Văn Phòng Du Lịch Gấp Gọn Ấm Áp Mùa Đông', 
           N'Sản phẩm Túi Ngủ Văn Phòng Du Lịch Gấp Gọn Ấm Áp Mùa Đông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Cầu Lông Đôi Kèm 3 Quả Cầu Và Bao Đựng Chắc Chắn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Cầu Lông Đôi Kèm 3 Quả Cầu Và Bao Đựng Chắc Chắn', 
           N'Sản phẩm Bộ Cầu Lông Đôi Kèm 3 Quả Cầu Và Bao Đựng Chắc Chắn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bóng Đá Tiêu Chuẩn Số 5 Da PU May Tay Chống Mài Mòn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bóng Đá Tiêu Chuẩn Số 5 Da PU May Tay Chống Mài Mòn', 
           N'Sản phẩm Bóng Đá Tiêu Chuẩn Số 5 Da PU May Tay Chống Mài Mòn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bóng Rổ Da Tiêu Chuẩn Số 7 Độ Nảy Chuẩn Bám Dính Tay')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bóng Rổ Da Tiêu Chuẩn Số 7 Độ Nảy Chuẩn Bám Dính Tay', 
           N'Sản phẩm Bóng Rổ Da Tiêu Chuẩn Số 7 Độ Nảy Chuẩn Bám Dính Tay chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/GiayDepNam04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vợt Bóng Bàn Dán Sẵn Mút Mặt Tàu Độ Nảy Cực Tốt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vợt Bóng Bàn Dán Sẵn Mút Mặt Tàu Độ Nảy Cực Tốt', 
           N'Sản phẩm Vợt Bóng Bàn Dán Sẵn Mút Mặt Tàu Độ Nảy Cực Tốt tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/GiayDepNam01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Chạy Bộ Cơ Không Động Cơ Cũ Phòng Gym Thanh Lý')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Chạy Bộ Cơ Không Động Cơ Cũ Phòng Gym Thanh Lý', 
           N'Sản phẩm Máy Chạy Bộ Cơ Không Động Cơ Cũ Phòng Gym Thanh Lý đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/GiayDepNam02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xe Đạp Đua Đường Trường Khung Carbon Pinarello Dogma F12 Siêu Nhẹ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xe Đạp Đua Đường Trường Khung Carbon Pinarello Dogma F12 Siêu Nhẹ', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Xe Đạp Đua Đường Trường Khung Carbon Pinarello Dogma F12 Siêu Nhẹ.', 
           38000000, 
           3, 
           N'/images/GiayDepNam03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thể Thao & Du Lịch';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gạo ST25 Ông Cua Túi 5kg Chuẩn Ngon Nhất Thế Giới')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gạo ST25 Ông Cua Túi 5kg Chuẩn Ngon Nhất Thế Giới', 
           N'Sản phẩm Gạo ST25 Ông Cua Túi 5kg Chuẩn Ngon Nhất Thế Giới chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thùng Nước Tương Đậu Nành Lên Men Tự Nhiên 500ml x 12 Chai')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thùng Nước Tương Đậu Nành Lên Men Tự Nhiên 500ml x 12 Chai', 
           N'Sản phẩm Thùng Nước Tương Đậu Nành Lên Men Tự Nhiên 500ml x 12 Chai chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dầu Ăn Thực Vật Cao Cấp Nguyên Chất Can 5 Lít Tiết Kiệm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dầu Ăn Thực Vật Cao Cấp Nguyên Chất Can 5 Lít Tiết Kiệm', 
           N'Sản phẩm Dầu Ăn Thực Vật Cao Cấp Nguyên Chất Can 5 Lít Tiết Kiệm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hạt Nêm Từ Thịt Thăn Xương Ống Gói 1kg Đậm Đà Vị Ngon')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hạt Nêm Từ Thịt Thăn Xương Ống Gói 1kg Đậm Đà Vị Ngon', 
           N'Sản phẩm Hạt Nêm Từ Thịt Thăn Xương Ống Gói 1kg Đậm Đà Vị Ngon chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thùng Mì Tôm Chua Cay Tôm Chua Cay Đệ Nhất 30 Gói')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thùng Mì Tôm Chua Cay Tôm Chua Cay Đệ Nhất 30 Gói', 
           N'Sản phẩm Thùng Mì Tôm Chua Cay Tôm Chua Cay Đệ Nhất 30 Gói chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nước Ngọt Có Ga Giải Khát Lon 330ml Thùng 24 Lon')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nước Ngọt Có Ga Giải Khát Lon 330ml Thùng 24 Lon', 
           N'Sản phẩm Nước Ngọt Có Ga Giải Khát Lon 330ml Thùng 24 Lon chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cà Phê Sữa Hòa Tan 3 Trong 1 Đậm Vị Việt Hộp 30 Gói')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cà Phê Sữa Hòa Tan 3 Trong 1 Đậm Vị Việt Hộp 30 Gói', 
           N'Sản phẩm Cà Phê Sữa Hòa Tan 3 Trong 1 Đậm Vị Việt Hộp 30 Gói chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Trà Oolong Thượng Hạng Hương Hoa Tự Nhiên Hộp Thiếc 200g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Trà Oolong Thượng Hạng Hương Hoa Tự Nhiên Hộp Thiếc 200g', 
           N'Sản phẩm Trà Oolong Thượng Hạng Hương Hoa Tự Nhiên Hộp Thiếc 200g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bánh Quy Bơ Thơm Ngon Hộp Thiếc Quà Tặng Lịch Sự 454g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bánh Quy Bơ Thơm Ngon Hộp Thiếc Quà Tặng Lịch Sự 454g', 
           N'Sản phẩm Bánh Quy Bơ Thơm Ngon Hộp Thiếc Quà Tặng Lịch Sự 454g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hạt Điều Rang Muối Vỏ Lụa Loại 1 Hũ 500g Giòn Rụm Bùi Béo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hạt Điều Rang Muối Vỏ Lụa Loại 1 Hũ 500g Giòn Rụm Bùi Béo', 
           N'Sản phẩm Hạt Điều Rang Muối Vỏ Lụa Loại 1 Hũ 500g Giòn Rụm Bùi Béo chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hạt Dẻ Cười Không Tẩy Trắng Nhập Khẩu Mỹ Hũ 500g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hạt Dẻ Cười Không Tẩy Trắng Nhập Khẩu Mỹ Hũ 500g', 
           N'Sản phẩm Hạt Dẻ Cười Không Tẩy Trắng Nhập Khẩu Mỹ Hũ 500g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khô Bò Miếng Mềm Cay Ngọt Đậm Đà Đặc Sản Đà Nẵng Hũ 300g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khô Bò Miếng Mềm Cay Ngọt Đậm Đà Đặc Sản Đà Nẵng Hũ 300g', 
           N'Sản phẩm Khô Bò Miếng Mềm Cay Ngọt Đậm Đà Đặc Sản Đà Nẵng Hũ 300g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khô Gà Lá Chanh Cay Giòn Thơm Ngon Hũ Nắp Nhôm 500g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khô Gà Lá Chanh Cay Giòn Thơm Ngon Hũ Nắp Nhôm 500g', 
           N'Sản phẩm Khô Gà Lá Chanh Cay Giòn Thơm Ngon Hũ Nắp Nhôm 500g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mật Ong Hoa Rừng Tự Nhiên Nguyên Chất Chai Thủy Tinh 1 Lít')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mật Ong Hoa Rừng Tự Nhiên Nguyên Chất Chai Thủy Tinh 1 Lít', 
           N'Sản phẩm Mật Ong Hoa Rừng Tự Nhiên Nguyên Chất Chai Thủy Tinh 1 Lít chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nước Mắm Cá Cơm Phú Quốc Truyền Thống 40 Độ Đạm Chai 500ml')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nước Mắm Cá Cơm Phú Quốc Truyền Thống 40 Độ Đạm Chai 500ml', 
           N'Sản phẩm Nước Mắm Cá Cơm Phú Quốc Truyền Thống 40 Độ Đạm Chai 500ml chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tương Ớt Cay Vừa Thơm Tỏi Tự Nhiên Chai Tiện Lợi 500g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tương Ớt Cay Vừa Thơm Tỏi Tự Nhiên Chai Tiện Lợi 500g', 
           N'Sản phẩm Tương Ớt Cay Vừa Thơm Tỏi Tự Nhiên Chai Tiện Lợi 500g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bột Ngũ Cốc Dinh Dưỡng Hạt Hạnh Nhân Óc Chó Gói 500g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bột Ngũ Cốc Dinh Dưỡng Hạt Hạnh Nhân Óc Chó Gói 500g', 
           N'Sản phẩm Bột Ngũ Cốc Dinh Dưỡng Hạt Hạnh Nhân Óc Chó Gói 500g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Yến Mạch Úc Nguyên Cán Tốt Cho Sức Khỏe Giảm Cân Túi 1kg')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Yến Mạch Úc Nguyên Cán Tốt Cho Sức Khỏe Giảm Cân Túi 1kg', 
           N'Sản phẩm Yến Mạch Úc Nguyên Cán Tốt Cho Sức Khỏe Giảm Cân Túi 1kg chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thùng Nước Khoáng Thiên Nhiên Đóng Chai 500ml x 24 Chai')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thùng Nước Khoáng Thiên Nhiên Đóng Chai 500ml x 24 Chai', 
           N'Sản phẩm Thùng Nước Khoáng Thiên Nhiên Đóng Chai 500ml x 24 Chai chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bột Giặt Đậm Đặc Khử Mùi Ẩm Mốc Túi Tiết Kiệm 5kg')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bột Giặt Đậm Đặc Khử Mùi Ẩm Mốc Túi Tiết Kiệm 5kg', 
           N'Sản phẩm Bột Giặt Đậm Đặc Khử Mùi Ẩm Mốc Túi Tiết Kiệm 5kg chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thùng Sữa Tươi Thanh Trùng Hạn Dùng Ngắn Đã Hết Date')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thùng Sữa Tươi Thanh Trùng Hạn Dùng Ngắn Đã Hết Date', 
           N'Sản phẩm Thùng Sữa Tươi Thanh Trùng Hạn Dùng Ngắn Đã Hết Date tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Bánh Trung Thu Hoàng Tộc Thập Cẩm Gà Quay Mẫu Cũ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Bánh Trung Thu Hoàng Tộc Thập Cẩm Gà Quay Mẫu Cũ', 
           N'Sản phẩm Hộp Bánh Trung Thu Hoàng Tộc Thập Cẩm Gà Quay Mẫu Cũ đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Rượu Vang Đỏ Pháp Chateau Lafite Rothschild Vintage 1982 Cực Phẩm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Rượu Vang Đỏ Pháp Chateau Lafite Rothschild Vintage 1982 Cực Phẩm', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Rượu Vang Đỏ Pháp Chateau Lafite Rothschild Vintage 1982 Cực Phẩm.', 
           39000000, 
           3, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Bách Hóa Online';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bơm Lốp Ô Tô Điện Tử Tự Ngắt Cài Đặt Áp Suất Pin Sạc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bơm Lốp Ô Tô Điện Tử Tự Ngắt Cài Đặt Áp Suất Pin Sạc', 
           N'Sản phẩm Bơm Lốp Ô Tô Điện Tử Tự Ngắt Cài Đặt Áp Suất Pin Sạc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Camera Hành Trình Gương Chiếu Hậu Ô Tô 4K Có Cam Lùi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Camera Hành Trình Gương Chiếu Hậu Ô Tô 4K Có Cam Lùi', 
           N'Sản phẩm Camera Hành Trình Gương Chiếu Hậu Ô Tô 4K Có Cam Lùi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gối Tựa Đầu Cổ Đệm Lưng Cao Su Non Trên Xe Hơi Thoáng Khí')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gối Tựa Đầu Cổ Đệm Lưng Cao Su Non Trên Xe Hơi Thoáng Khí', 
           N'Sản phẩm Gối Tựa Đầu Cổ Đệm Lưng Cao Su Non Trên Xe Hơi Thoáng Khí chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bạt Phủ Ô Tô Chống Nắng Mưa Cách Nhiệt Bạc 3 Lớp Phản Quang')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bạt Phủ Ô Tô Chống Nắng Mưa Cách Nhiệt Bạc 3 Lớp Phản Quang', 
           N'Sản phẩm Bạt Phủ Ô Tô Chống Nắng Mưa Cách Nhiệt Bạc 3 Lớp Phản Quang chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nước Rửa Kính Ô Tô Chuyên Dụng Chống Bám Nước Hiệu Ứng Lá Sen')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nước Rửa Kính Ô Tô Chuyên Dụng Chống Bám Nước Hiệu Ứng Lá Sen', 
           N'Sản phẩm Nước Rửa Kính Ô Tô Chuyên Dụng Chống Bám Nước Hiệu Ứng Lá Sen chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tẩu Sạc Ô Tô Nhanh Công Suất Khủng 100W Sạc Đa Năng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tẩu Sạc Ô Tô Nhanh Công Suất Khủng 100W Sạc Đa Năng', 
           N'Sản phẩm Tẩu Sạc Ô Tô Nhanh Công Suất Khủng 100W Sạc Đa Năng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giá Đỡ Điện Thoại Trên Ô Tô Hít Cửa Gió Nam Châm Chắc Chắn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giá Đỡ Điện Thoại Trên Ô Tô Hít Cửa Gió Nam Châm Chắc Chắn', 
           N'Sản phẩm Giá Đỡ Điện Thoại Trên Ô Tô Hít Cửa Gió Nam Châm Chắc Chắn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bọc Vô Lăng Ô Tô Da Bò Thật Chống Trượt Thấm Mồ Hôi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bọc Vô Lăng Ô Tô Da Bò Thật Chống Trượt Thấm Mồ Hôi', 
           N'Sản phẩm Bọc Vô Lăng Ô Tô Da Bò Thật Chống Trượt Thấm Mồ Hôi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Treo Lưng Ghế Ô Tô Đa Năng Nhiều Ngăn Để Khăn Giấy Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Treo Lưng Ghế Ô Tô Đa Năng Nhiều Ngăn Để Khăn Giấy Nước', 
           N'Sản phẩm Túi Treo Lưng Ghế Ô Tô Đa Năng Nhiều Ngăn Để Khăn Giấy Nước chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thảm Lót Sàn Ô Tô Cao Su Đúc Không Mùi Chống Trơn Dễ Rửa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thảm Lót Sàn Ô Tô Cao Su Đúc Không Mùi Chống Trơn Dễ Rửa', 
           N'Sản phẩm Thảm Lót Sàn Ô Tô Cao Su Đúc Không Mùi Chống Trơn Dễ Rửa chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Hút Bụi Mini Cho Xe Hơi Không Dây Lực Hút Cực Khỏe')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Hút Bụi Mini Cho Xe Hơi Không Dây Lực Hút Cực Khỏe', 
           N'Sản phẩm Máy Hút Bụi Mini Cho Xe Hơi Không Dây Lực Hút Cực Khỏe chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khăn Lau Xe Hơi Microfiber Siêu Thấm Hút Không Rụng Lông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khăn Lau Xe Hơi Microfiber Siêu Thấm Hút Không Rụng Lông', 
           N'Sản phẩm Khăn Lau Xe Hơi Microfiber Siêu Thấm Hút Không Rụng Lông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Xịt Bọt Vệ Sinh Nội Thất Da Ghế Ô Tô Đa Năng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Xịt Bọt Vệ Sinh Nội Thất Da Ghế Ô Tô Đa Năng', 
           N'Sản phẩm Bình Xịt Bọt Vệ Sinh Nội Thất Da Ghế Ô Tô Đa Năng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khóa Chống Trộm Xe Máy Càng Đĩa Phanh Báo Động Còi Hú')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khóa Chống Trộm Xe Máy Càng Đĩa Phanh Báo Động Còi Hú', 
           N'Sản phẩm Khóa Chống Trộm Xe Máy Càng Đĩa Phanh Báo Động Còi Hú chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Mưa Bộ Cánh Dơi Xe Máy Vải Dù Siêu Bền 2 Đầu Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Mưa Bộ Cánh Dơi Xe Máy Vải Dù Siêu Bền 2 Đầu Tiện Lợi', 
           N'Sản phẩm Áo Mưa Bộ Cánh Dơi Xe Máy Vải Dù Siêu Bền 2 Đầu Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mũ Bảo Hiểm 3/4 Đầu Có Kính Chắn Gió Đi Phượt Chuẩn CR')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mũ Bảo Hiểm 3/4 Đầu Có Kính Chắn Gió Đi Phượt Chuẩn CR', 
           N'Sản phẩm Mũ Bảo Hiểm 3/4 Đầu Có Kính Chắn Gió Đi Phượt Chuẩn CR chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Găng Tay Phượt Chống Nước Chống Rơi Vỡ Có Gù Bảo Vệ Xương')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Găng Tay Phượt Chống Nước Chống Rơi Vỡ Có Gù Bảo Vệ Xương', 
           N'Sản phẩm Găng Tay Phượt Chống Nước Chống Rơi Vỡ Có Gù Bảo Vệ Xương chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gương Cầu Lồi Xóa Điểm Mù Kính Chiếu Hậu Ô Tô Xoay 360')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gương Cầu Lồi Xóa Điểm Mù Kính Chiếu Hậu Ô Tô Xoay 360', 
           N'Sản phẩm Gương Cầu Lồi Xóa Điểm Mù Kính Chiếu Hậu Ô Tô Xoay 360 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Trợ Sáng Xe Máy Bi Cầu Mini 2 Màu Vàng Trắng Siêu Gom')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Trợ Sáng Xe Máy Bi Cầu Mini 2 Màu Vàng Trắng Siêu Gom', 
           N'Sản phẩm Đèn Trợ Sáng Xe Máy Bi Cầu Mini 2 Màu Vàng Trắng Siêu Gom chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bút Xóa Vết Xước Sơn Xe Ô Tô Xe Máy Che Khuyết Điểm Nhanh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bút Xóa Vết Xước Sơn Xe Ô Tô Xe Máy Che Khuyết Điểm Nhanh', 
           N'Sản phẩm Bút Xóa Vết Xước Sơn Xe Ô Tô Xe Máy Che Khuyết Điểm Nhanh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bugi Xe Máy Chân Dài Đã Sử Dụng Cho Xe Cũ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bugi Xe Máy Chân Dài Đã Sử Dụng Cho Xe Cũ', 
           N'Sản phẩm Bugi Xe Máy Chân Dài Đã Sử Dụng Cho Xe Cũ tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Còi Hơi Tàu Hỏa 12V Lắp Xe Bị Cấm Lưu Hành')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Còi Hơi Tàu Hỏa 12V Lắp Xe Bị Cấm Lưu Hành', 
           N'Sản phẩm Còi Hơi Tàu Hỏa 12V Lắp Xe Bị Cấm Lưu Hành đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Vành Đúc Mâm Xe Hơi Forged Hợp Kim Nhôm BBS 20 Inch Thể Thao')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Vành Đúc Mâm Xe Hơi Forged Hợp Kim Nhôm BBS 20 Inch Thể Thao', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Bộ Vành Đúc Mâm Xe Hơi Forged Hợp Kim Nhôm BBS 20 Inch Thể Thao.', 
           40000000, 
           3, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Ô Tô - Xe Máy - Xe Đạp';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sách - Đắc Nhân Tâm (Khổ Lớn Bìa Mềm Tái Bản Mới Nhất)')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sách - Đắc Nhân Tâm (Khổ Lớn Bìa Mềm Tái Bản Mới Nhất)', 
           N'Sản phẩm Sách - Đắc Nhân Tâm (Khổ Lớn Bìa Mềm Tái Bản Mới Nhất) chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sách - Nhà Giả Kim (Tác Phẩm Văn Học Bán Chạy Mọi Thời Đại)')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sách - Nhà Giả Kim (Tác Phẩm Văn Học Bán Chạy Mọi Thời Đại)', 
           N'Sản phẩm Sách - Nhà Giả Kim (Tác Phẩm Văn Học Bán Chạy Mọi Thời Đại) chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sách - Tâm Lý Học Về Tiền (Bí Quyết Quản Lý Tài Chính Cá Nhân)')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sách - Tâm Lý Học Về Tiền (Bí Quyết Quản Lý Tài Chính Cá Nhân)', 
           N'Sản phẩm Sách - Tâm Lý Học Về Tiền (Bí Quyết Quản Lý Tài Chính Cá Nhân) chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sách - Đọc Vị Bất Kỳ Ai Để Không Bị Thao Túng Tâm Lý')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sách - Đọc Vị Bất Kỳ Ai Để Không Bị Thao Túng Tâm Lý', 
           N'Sản phẩm Sách - Đọc Vị Bất Kỳ Ai Để Không Bị Thao Túng Tâm Lý chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sách - Cây Cam Ngọt Của Tôi (Câu Chuyện Lay Động Triệu Trái Tim)')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sách - Cây Cam Ngọt Của Tôi (Câu Chuyện Lay Động Triệu Trái Tim)', 
           N'Sản phẩm Sách - Cây Cam Ngọt Của Tôi (Câu Chuyện Lay Động Triệu Trái Tim) chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Bút Bi Gel Bấm Mực Xanh 0.5mm Viết Êm Tay Hộp 20 Chiếc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Bút Bi Gel Bấm Mực Xanh 0.5mm Viết Êm Tay Hộp 20 Chiếc', 
           N'Sản phẩm Bộ Bút Bi Gel Bấm Mực Xanh 0.5mm Viết Êm Tay Hộp 20 Chiếc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sổ Tay Bìa Da A5 Dòng Kẻ Ngang Giấy Dày Chống Thấm Mực')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sổ Tay Bìa Da A5 Dòng Kẻ Ngang Giấy Dày Chống Thấm Mực', 
           N'Sản phẩm Sổ Tay Bìa Da A5 Dòng Kẻ Ngang Giấy Dày Chống Thấm Mực chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Bút Dạ Quang Đánh Dấu Sách 6 Màu Pastel Dịu Mắt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Bút Dạ Quang Đánh Dấu Sách 6 Màu Pastel Dịu Mắt', 
           N'Sản phẩm Bộ Bút Dạ Quang Đánh Dấu Sách 6 Màu Pastel Dịu Mắt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giấy In Photo A4 Định Lượng 70gsm Ram 500 Tờ Cao Cấp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giấy In Photo A4 Định Lượng 70gsm Ram 500 Tờ Cao Cấp', 
           N'Sản phẩm Giấy In Photo A4 Định Lượng 70gsm Ram 500 Tờ Cao Cấp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Băng Dính Hai Mặt Siêu Dính Trong Suốt Tẩy Rửa Tái Sử Dụng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Băng Dính Hai Mặt Siêu Dính Trong Suốt Tẩy Rửa Tái Sử Dụng', 
           N'Sản phẩm Băng Dính Hai Mặt Siêu Dính Trong Suốt Tẩy Rửa Tái Sử Dụng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kéo Văn Phòng Inox Lưỡi Sắc Bén Cán Bọc Cao Su Cắt Êm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kéo Văn Phòng Inox Lưỡi Sắc Bén Cán Bọc Cao Su Cắt Êm', 
           N'Sản phẩm Kéo Văn Phòng Inox Lưỡi Sắc Bén Cán Bọc Cao Su Cắt Êm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dập Ghim Văn Phòng Số 10 Kèm 1 Hộp Đạn Ghim Tiện Dụng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dập Ghim Văn Phòng Số 10 Kèm 1 Hộp Đạn Ghim Tiện Dụng', 
           N'Sản phẩm Dập Ghim Văn Phòng Số 10 Kèm 1 Hộp Đạn Ghim Tiện Dụng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bút Xóa Kéo Dạng Băng Dán Khô Ngay Dài 12 Mét Không Đứt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bút Xóa Kéo Dạng Băng Dán Khô Ngay Dài 12 Mét Không Đứt', 
           N'Sản phẩm Bút Xóa Kéo Dạng Băng Dán Khô Ngay Dài 12 Mét Không Đứt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Đựng Bút Để Bàn Xoay 360 Độ Đa Năng 5 Ngăn Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Đựng Bút Để Bàn Xoay 360 Độ Đa Năng 5 Ngăn Tiện Lợi', 
           N'Sản phẩm Hộp Đựng Bút Để Bàn Xoay 360 Độ Đa Năng 5 Ngăn Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Đựng Tài Liệu A4 Nhiều Tầng Có Nút Cài Chống Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Đựng Tài Liệu A4 Nhiều Tầng Có Nút Cài Chống Nước', 
           N'Sản phẩm Túi Đựng Tài Liệu A4 Nhiều Tầng Có Nút Cài Chống Nước chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bút Lông Bảng Trắng Xóa Được Nhanh Khô Không Mùi Hộp 10 Cây')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bút Lông Bảng Trắng Xóa Được Nhanh Khô Không Mùi Hộp 10 Cây', 
           N'Sản phẩm Bút Lông Bảng Trắng Xóa Được Nhanh Khô Không Mùi Hộp 10 Cây chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bảng Vẽ Điện Tử Cảm Ứng Rút Gọn Viết Chữ Xóa Bằng Một Nút')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bảng Vẽ Điện Tử Cảm Ứng Rút Gọn Viết Chữ Xóa Bằng Một Nút', 
           N'Sản phẩm Bảng Vẽ Điện Tử Cảm Ứng Rút Gọn Viết Chữ Xóa Bằng Một Nút chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gọt Chì Bút Chì Quay Tay Hình Ngôi Nhà Đáng Yêu Cho Bé')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gọt Chì Bút Chì Quay Tay Hình Ngôi Nhà Đáng Yêu Cho Bé', 
           N'Sản phẩm Gọt Chì Bút Chì Quay Tay Hình Ngôi Nhà Đáng Yêu Cho Bé chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thước Kẻ Nhôm Học Sinh 30cm Không Cong Vênh Bền Đẹp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thước Kẻ Nhôm Học Sinh 30cm Không Cong Vênh Bền Đẹp', 
           N'Sản phẩm Thước Kẻ Nhôm Học Sinh 30cm Không Cong Vênh Bền Đẹp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kẹp Giấy Càng Cua Kim Loại Màu Đen Hộp 24 Chiếc Đủ Size')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kẹp Giấy Càng Cua Kim Loại Màu Đen Hộp 24 Chiếc Đủ Size', 
           N'Sản phẩm Kẹp Giấy Càng Cua Kim Loại Màu Đen Hộp 24 Chiếc Đủ Size chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/Laptop04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sách Giáo Khoa Cũ Chương Trình Năm 2000 Hết Lưu Hành')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sách Giáo Khoa Cũ Chương Trình Năm 2000 Hết Lưu Hành', 
           N'Sản phẩm Sách Giáo Khoa Cũ Chương Trình Năm 2000 Hết Lưu Hành tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/Laptop01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Từ Điển Bách Khoa Toàn Thư Bìa Cứng Đóng Tay Cổ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Từ Điển Bách Khoa Toàn Thư Bìa Cứng Đóng Tay Cổ', 
           N'Sản phẩm Từ Điển Bách Khoa Toàn Thư Bìa Cứng Đóng Tay Cổ đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/Laptop02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Sách Đông Dương Xưa Và Nay Bản Giới Hạn Bìa Da Thuộc Thủ Công')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Sách Đông Dương Xưa Và Nay Bản Giới Hạn Bìa Da Thuộc Thủ Công', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Bộ Sách Đông Dương Xưa Và Nay Bản Giới Hạn Bìa Da Thuộc Thủ Công.', 
           41000000, 
           3, 
           N'/images/Laptop03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sách & Văn Phòng Phẩm';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tai Nghe Chụp Tai Bluetooth Chống Ồn Chủ Động ANC Pin 40 Giờ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tai Nghe Chụp Tai Bluetooth Chống Ồn Chủ Động ANC Pin 40 Giờ', 
           N'Sản phẩm Tai Nghe Chụp Tai Bluetooth Chống Ồn Chủ Động ANC Pin 40 Giờ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Loa Soundbar Màn Hình Tivi Rạp Hát Tại Gia Kèm Sub Không Dây')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Loa Soundbar Màn Hình Tivi Rạp Hát Tại Gia Kèm Sub Không Dây', 
           N'Sản phẩm Loa Soundbar Màn Hình Tivi Rạp Hát Tại Gia Kèm Sub Không Dây chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Micro Thu Âm Cài Áo Không Dây Cho Điện Thoại Quay Vlog TikTok')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Micro Thu Âm Cài Áo Không Dây Cho Điện Thoại Quay Vlog TikTok', 
           N'Sản phẩm Micro Thu Âm Cài Áo Không Dây Cho Điện Thoại Quay Vlog TikTok chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Loa Thùng Karaoke Kẹo Kéo Di Động Kèm 2 Micro Kim Loại Cao Cấp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Loa Thùng Karaoke Kẹo Kéo Di Động Kèm 2 Micro Kim Loại Cao Cấp', 
           N'Sản phẩm Loa Thùng Karaoke Kẹo Kéo Di Động Kèm 2 Micro Kim Loại Cao Cấp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tai Nghe Gaming Có Dây Giả Lập Âm Thanh 7.1 Âm Bass Sâu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tai Nghe Gaming Có Dây Giả Lập Âm Thanh 7.1 Âm Bass Sâu', 
           N'Sản phẩm Tai Nghe Gaming Có Dây Giả Lập Âm Thanh 7.1 Âm Bass Sâu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Loa Máy Tính Mini Để Bàn Cổng USB Âm Lượng Lớn Rõ Ràng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Loa Máy Tính Mini Để Bàn Cổng USB Âm Lượng Lớn Rõ Ràng', 
           N'Sản phẩm Loa Máy Tính Mini Để Bàn Cổng USB Âm Lượng Lớn Rõ Ràng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cáp Âm Thanh Jack 3.5mm Ra 2 Cổng Bông Sen RCA Dài 2 Mét')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cáp Âm Thanh Jack 3.5mm Ra 2 Cổng Bông Sen RCA Dài 2 Mét', 
           N'Sản phẩm Cáp Âm Thanh Jack 3.5mm Ra 2 Cổng Bông Sen RCA Dài 2 Mét chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'DAC Giải Mã Âm Thanh Hi-Res Cổng Quang Optical Sang AV 3.5mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'DAC Giải Mã Âm Thanh Hi-Res Cổng Quang Optical Sang AV 3.5mm', 
           N'Sản phẩm DAC Giải Mã Âm Thanh Hi-Res Cổng Quang Optical Sang AV 3.5mm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Micro Có Dây Hát Gia Đình Chống Hú Rít Củ Mic Dày Tiếng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Micro Có Dây Hát Gia Đình Chống Hú Rít Củ Mic Dày Tiếng', 
           N'Sản phẩm Micro Có Dây Hát Gia Đình Chống Hú Rít Củ Mic Dày Tiếng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vang Số Karaoke Chỉnh Cơ Có Chống Hú Reverb Chuyên Nghiệp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vang Số Karaoke Chỉnh Cơ Có Chống Hú Reverb Chuyên Nghiệp', 
           N'Sản phẩm Vang Số Karaoke Chỉnh Cơ Có Chống Hú Reverb Chuyên Nghiệp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tai Nghe Kiểm Âm Phòng Thu Chuyên Nghiệp Dải Tần Rộng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tai Nghe Kiểm Âm Phòng Thu Chuyên Nghiệp Dải Tần Rộng', 
           N'Sản phẩm Tai Nghe Kiểm Âm Phòng Thu Chuyên Nghiệp Dải Tần Rộng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Giá Đỡ Treo Tai Nghe Chụp Tai Hợp Kim Nhôm Để Bàn Chắc Chắn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Giá Đỡ Treo Tai Nghe Chụp Tai Hợp Kim Nhôm Để Bàn Chắc Chắn', 
           N'Sản phẩm Giá Đỡ Treo Tai Nghe Chụp Tai Hợp Kim Nhôm Để Bàn Chắc Chắn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Màng Lọc Âm Pop Filter Bọc Micro Thu Âm Tròn Chắn Gió Bụi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Màng Lọc Âm Pop Filter Bọc Micro Thu Âm Tròn Chắn Gió Bụi', 
           N'Sản phẩm Màng Lọc Âm Pop Filter Bọc Micro Thu Âm Tròn Chắn Gió Bụi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chân Đế Micro Kẹp Bàn Kim Loại Chịu Lực Điều Chỉnh Góc Linh Hoạt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chân Đế Micro Kẹp Bàn Kim Loại Chịu Lực Điều Chỉnh Góc Linh Hoạt', 
           N'Sản phẩm Chân Đế Micro Kẹp Bàn Kim Loại Chịu Lực Điều Chỉnh Góc Linh Hoạt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cục Đẩy Công Suất 2 Kênh Đánh Đôi Loa Full Bass 30 Căng Đét')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cục Đẩy Công Suất 2 Kênh Đánh Đôi Loa Full Bass 30 Căng Đét', 
           N'Sản phẩm Cục Đẩy Công Suất 2 Kênh Đánh Đôi Loa Full Bass 30 Căng Đét chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Thu Phát Bluetooth 5.0 Cho Dàn Âm Thanh Amply Xe Hơi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Thu Phát Bluetooth 5.0 Cho Dàn Âm Thanh Amply Xe Hơi', 
           N'Sản phẩm Bộ Thu Phát Bluetooth 5.0 Cho Dàn Âm Thanh Amply Xe Hơi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nút Bịt Tai Cách Âm Chống Tiếng Ồn Ngủ Bằng Bọt Biển Siêu Mềm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nút Bịt Tai Cách Âm Chống Tiếng Ồn Ngủ Bằng Bọt Biển Siêu Mềm', 
           N'Sản phẩm Nút Bịt Tai Cách Âm Chống Tiếng Ồn Ngủ Bằng Bọt Biển Siêu Mềm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Cáp Loa Đồng Nguyên Chất Dày Dặn Truyền Tín Hiệu Sạch')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Cáp Loa Đồng Nguyên Chất Dày Dặn Truyền Tín Hiệu Sạch', 
           N'Sản phẩm Dây Cáp Loa Đồng Nguyên Chất Dày Dặn Truyền Tín Hiệu Sạch chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bông Mút Bọc Tai Nghe Thay Thế Đệm Da Êm Ái Size 50mm 70mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bông Mút Bọc Tai Nghe Thay Thế Đệm Da Êm Ái Size 50mm 70mm', 
           N'Sản phẩm Bông Mút Bọc Tai Nghe Thay Thế Đệm Da Êm Ái Size 50mm 70mm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Khuyếch Đại Tín Hiệu Âm Thanh Tai Nghe Headphone Mini')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Khuyếch Đại Tín Hiệu Âm Thanh Tai Nghe Headphone Mini', 
           N'Sản phẩm Bộ Khuyếch Đại Tín Hiệu Âm Thanh Tai Nghe Headphone Mini chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/DienThoai04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầu Băng Cối Cassette Cổ Chạy Băng Từ Dây Đã Cũ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầu Băng Cối Cassette Cổ Chạy Băng Từ Dây Đã Cũ', 
           N'Sản phẩm Đầu Băng Cối Cassette Cổ Chạy Băng Từ Dây Đã Cũ tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/DienThoai01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Amply Đèn Cổ Chạy Bóng Chân Không Công Suất Yếu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Amply Đèn Cổ Chạy Bóng Chân Không Công Suất Yếu', 
           N'Sản phẩm Amply Đèn Cổ Chạy Bóng Chân Không Công Suất Yếu đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/DienThoai02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hệ Thống Dàn Âm Thanh Hi-End Tannoy Westminster Royal GR Đỉnh Cao')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hệ Thống Dàn Âm Thanh Hi-End Tannoy Westminster Royal GR Đỉnh Cao', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Hệ Thống Dàn Âm Thanh Hi-End Tannoy Westminster Royal GR Đỉnh Cao.', 
           42000000, 
           3, 
           N'/images/DienThoai03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Âm Thanh';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kính Mát Phân Cực Chống Tia UV400 Khung Hợp Kim Titan')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kính Mát Phân Cực Chống Tia UV400 Khung Hợp Kim Titan', 
           N'Sản phẩm Kính Mát Phân Cực Chống Tia UV400 Khung Hợp Kim Titan chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thắt Lưng Nam Da Bò Thật Mặt Khóa Tự Động Kim Loại Không Gỉ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thắt Lưng Nam Da Bò Thật Mặt Khóa Tự Động Kim Loại Không Gỉ', 
           N'Sản phẩm Thắt Lưng Nam Da Bò Thật Mặt Khóa Tự Động Kim Loại Không Gỉ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khăn Choàng Cổ Nữ Dạ Cashmere Họa Tiết Kẻ Caro Thu Đông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khăn Choàng Cổ Nữ Dạ Cashmere Họa Tiết Kẻ Caro Thu Đông', 
           N'Sản phẩm Khăn Choàng Cổ Nữ Dạ Cashmere Họa Tiết Kẻ Caro Thu Đông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vòng Tay Phong Thủy Đá Trầm Hương Tự Nhiên Thơm Dịu Mát')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vòng Tay Phong Thủy Đá Trầm Hương Tự Nhiên Thơm Dịu Mát', 
           N'Sản phẩm Vòng Tay Phong Thủy Đá Trầm Hương Tự Nhiên Thơm Dịu Mát chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mũ Lưỡi Trai Nam Nữ Thêu Chữ Cá Tính Vải Kaki Bền Đẹp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mũ Lưỡi Trai Nam Nữ Thêu Chữ Cá Tính Vải Kaki Bền Đẹp', 
           N'Sản phẩm Mũ Lưỡi Trai Nam Nữ Thêu Chữ Cá Tính Vải Kaki Bền Đẹp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mũ Vành Tròn Đi Biển Mùa Hè Rộng Vành Chống Nắng Thời Trang')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mũ Vành Tròn Đi Biển Mùa Hè Rộng Vành Chống Nắng Thời Trang', 
           N'Sản phẩm Mũ Vành Tròn Đi Biển Mùa Hè Rộng Vành Chống Nắng Thời Trang chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cà Vạt Nam Bản Nhỏ Lụa Dệt Họa Tiết Kèm Kẹp Cà Vạt Cao Cấp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cà Vạt Nam Bản Nhỏ Lụa Dệt Họa Tiết Kèm Kẹp Cà Vạt Cao Cấp', 
           N'Sản phẩm Cà Vạt Nam Bản Nhỏ Lụa Dệt Họa Tiết Kèm Kẹp Cà Vạt Cao Cấp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ghim Cài Áo Vest Nam Nữ Vương Miện Đính Đá Pha Lê Lấp Lánh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ghim Cài Áo Vest Nam Nữ Vương Miện Đính Đá Pha Lê Lấp Lánh', 
           N'Sản phẩm Ghim Cài Áo Vest Nam Nữ Vương Miện Đính Đá Pha Lê Lấp Lánh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Găng Tay Lái Xe Chống Nắng Co Giãn Cảm Ứng Ngón Trỏ Thoải Mái')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Găng Tay Lái Xe Chống Nắng Co Giãn Cảm Ứng Ngón Trỏ Thoải Mái', 
           N'Sản phẩm Găng Tay Lái Xe Chống Nắng Co Giãn Cảm Ứng Ngón Trỏ Thoải Mái chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Băng Đô Rửa Mặt Tai Mèo Bông Mềm Co Giãn Thấm Nước Tốt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Băng Đô Rửa Mặt Tai Mèo Bông Mềm Co Giãn Thấm Nước Tốt', 
           N'Sản phẩm Băng Đô Rửa Mặt Tai Mèo Bông Mềm Co Giãn Thấm Nước Tốt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khuyên Tai Bạc Nữ 925 Nụ Đính Đá Tinh Tế Không Gây Dị Ứng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khuyên Tai Bạc Nữ 925 Nụ Đính Đá Tinh Tế Không Gây Dị Ứng', 
           N'Sản phẩm Khuyên Tai Bạc Nữ 925 Nụ Đính Đá Tinh Tế Không Gây Dị Ứng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Chuyền Bạc Nữ Mặt Trái Tim Nhỏ Xinh Quyến Rũ Dịu Dàng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Chuyền Bạc Nữ Mặt Trái Tim Nhỏ Xinh Quyến Rũ Dịu Dàng', 
           N'Sản phẩm Dây Chuyền Bạc Nữ Mặt Trái Tim Nhỏ Xinh Quyến Rũ Dịu Dàng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nhẫn Nữ Hở Đính Đá Tự Do Điều Chỉnh Size Bàn Tay Thanh Mảnh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nhẫn Nữ Hở Đính Đá Tự Do Điều Chỉnh Size Bàn Tay Thanh Mảnh', 
           N'Sản phẩm Nhẫn Nữ Hở Đính Đá Tự Do Điều Chỉnh Size Bàn Tay Thanh Mảnh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Lắc Chân Nữ Bạc Chuông Nhỏ Dễ Thương Rung Rinh Nữ Tính')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Lắc Chân Nữ Bạc Chuông Nhỏ Dễ Thương Rung Rinh Nữ Tính', 
           N'Sản phẩm Lắc Chân Nữ Bạc Chuông Nhỏ Dễ Thương Rung Rinh Nữ Tính chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ô Dù Cầm Tay Tự Động Đóng Mở Chống Tia UV Gấp Gọn Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ô Dù Cầm Tay Tự Động Đóng Mở Chống Tia UV Gấp Gọn Tiện Lợi', 
           N'Sản phẩm Ô Dù Cầm Tay Tự Động Đóng Mở Chống Tia UV Gấp Gọn Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Móc Khóa Da Bò Khắc Tên Thủ Công Theo Yêu Cầu Tinh Tế')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Móc Khóa Da Bò Khắc Tên Thủ Công Theo Yêu Cầu Tinh Tế', 
           N'Sản phẩm Móc Khóa Da Bò Khắc Tên Thủ Công Theo Yêu Cầu Tinh Tế chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Nịt Nữ Bản Nhỏ Thắt Váy Đầm Mặt Khóa Tròn Sang Chảnh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Nịt Nữ Bản Nhỏ Thắt Váy Đầm Mặt Khóa Tròn Sang Chảnh', 
           N'Sản phẩm Dây Nịt Nữ Bản Nhỏ Thắt Váy Đầm Mặt Khóa Tròn Sang Chảnh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bịt Tai Giữ Ấm Mùa Đông Lông Xù Mềm Mại Đáng Yêu Dễ Phối Đồ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bịt Tai Giữ Ấm Mùa Đông Lông Xù Mềm Mại Đáng Yêu Dễ Phối Đồ', 
           N'Sản phẩm Bịt Tai Giữ Ấm Mùa Đông Lông Xù Mềm Mại Đáng Yêu Dễ Phối Đồ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Kính Mát Da Cứng Nắp Gập Đựng Mắt Kính Bền Bỉ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Kính Mát Da Cứng Nắp Gập Đựng Mắt Kính Bền Bỉ', 
           N'Sản phẩm Hộp Kính Mát Da Cứng Nắp Gập Đựng Mắt Kính Bền Bỉ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khăn Lụa Vuông Quàng Cổ Nữ Thắt Nơ Túi Xách Thời Trang 70cm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khăn Lụa Vuông Quàng Cổ Nữ Thắt Nơ Túi Xách Thời Trang 70cm', 
           N'Sản phẩm Khăn Lụa Vuông Quàng Cổ Nữ Thắt Nơ Túi Xách Thời Trang 70cm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/DongHo04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mũ Len Nồi Nữ Dệt Tay Họa Tiết Hoa Hết Mốt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mũ Len Nồi Nữ Dệt Tay Họa Tiết Hoa Hết Mốt', 
           N'Sản phẩm Mũ Len Nồi Nữ Dệt Tay Họa Tiết Hoa Hết Mốt tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/DongHo01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khuy Măng Sét Bằng Vàng Khắc Gia Huy Cổ Đại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khuy Măng Sét Bằng Vàng Khắc Gia Huy Cổ Đại', 
           N'Sản phẩm Khuy Măng Sét Bằng Vàng Khắc Gia Huy Cổ Đại đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/DongHo02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vòng Cổ Kim Cương Tự Nhiên PNJ Vàng Trắng 18K Quý Tộc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vòng Cổ Kim Cương Tự Nhiên PNJ Vàng Trắng 18K Quý Tộc', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Vòng Cổ Kim Cương Tự Nhiên PNJ Vàng Trắng 18K Quý Tộc.', 
           43000000, 
           3, 
           N'/images/DongHo03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Phụ Kiện Thời Trang';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nồi Áp Suất Điện Đa Năng Hầm Gà Nấu Cháo Nhanh Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nồi Áp Suất Điện Đa Năng Hầm Gà Nấu Cháo Nhanh Tiện Lợi', 
           N'Sản phẩm Nồi Áp Suất Điện Đa Năng Hầm Gà Nấu Cháo Nhanh Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quạt Tích Điện Để Bàn Gấp Gọn Pin Khủng 10000mAh Chạy Êm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quạt Tích Điện Để Bàn Gấp Gọn Pin Khủng 10000mAh Chạy Êm', 
           N'Sản phẩm Quạt Tích Điện Để Bàn Gấp Gọn Pin Khủng 10000mAh Chạy Êm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bàn Ủi Hơi Nước Cầm Tay Du Lịch Gấp Gọn Công Suất 1500W')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bàn Ủi Hơi Nước Cầm Tay Du Lịch Gấp Gọn Công Suất 1500W', 
           N'Sản phẩm Bàn Ủi Hơi Nước Cầm Tay Du Lịch Gấp Gọn Công Suất 1500W chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Xay Sinh Tố Cầm Tay 6 Lưỡi Dao Sạc USB Xay Nhuyễn Đá')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Xay Sinh Tố Cầm Tay 6 Lưỡi Dao Sạc USB Xay Nhuyễn Đá', 
           N'Sản phẩm Máy Xay Sinh Tố Cầm Tay 6 Lưỡi Dao Sạc USB Xay Nhuyễn Đá chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Đun Nước Siêu Tốc Thủy Tinh Ruột Inox 304 Có Đèn Led')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Đun Nước Siêu Tốc Thủy Tinh Ruột Inox 304 Có Đèn Led', 
           N'Sản phẩm Bình Đun Nước Siêu Tốc Thủy Tinh Ruột Inox 304 Có Đèn Led chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Làm Sữa Hạt Tự Động Nấu Chín Xay Mịn Không Cần Lọc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Làm Sữa Hạt Tự Động Nấu Chín Xay Mịn Không Cần Lọc', 
           N'Sản phẩm Máy Làm Sữa Hạt Tự Động Nấu Chín Xay Mịn Không Cần Lọc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Sấy Tóc Ion Âm Chăm Sóc Tóc Khô Nhanh Chống Gãy Rụng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Sấy Tóc Ion Âm Chăm Sóc Tóc Khô Nhanh Chống Gãy Rụng', 
           N'Sản phẩm Máy Sấy Tóc Ion Âm Chăm Sóc Tóc Khô Nhanh Chống Gãy Rụng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ấm Pha Trà Điện Tự Động Điều Chỉnh Nhiệt Độ Kèm Lưới Lọc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ấm Pha Trà Điện Tự Động Điều Chỉnh Nhiệt Độ Kèm Lưới Lọc', 
           N'Sản phẩm Ấm Pha Trà Điện Tự Động Điều Chỉnh Nhiệt Độ Kèm Lưới Lọc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Ép Chậm Trục Vít Giữ Nguyên 100% Vitamin Rau Củ Quả')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Ép Chậm Trục Vít Giữ Nguyên 100% Vitamin Rau Củ Quả', 
           N'Sản phẩm Máy Ép Chậm Trục Vít Giữ Nguyên 100% Vitamin Rau Củ Quả chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nồi Lẩu Điện Nướng 2 Ngăn Đa Năng Chống Dính Bữa Tiệc Gia Đình')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nồi Lẩu Điện Nướng 2 Ngăn Đa Năng Chống Dính Bữa Tiệc Gia Đình', 
           N'Sản phẩm Nồi Lẩu Điện Nướng 2 Ngăn Đa Năng Chống Dính Bữa Tiệc Gia Đình chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quạt Không Cánh Lọc Không Khí Tạo Ion Âm Hiện Đại Thông Minh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quạt Không Cánh Lọc Không Khí Tạo Ion Âm Hiện Đại Thông Minh', 
           N'Sản phẩm Quạt Không Cánh Lọc Không Khí Tạo Ion Âm Hiện Đại Thông Minh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Sưởi Gốm Ceramic Chống Khô Da An Toàn Cho Trẻ Nhỏ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Sưởi Gốm Ceramic Chống Khô Da An Toàn Cho Trẻ Nhỏ', 
           N'Sản phẩm Máy Sưởi Gốm Ceramic Chống Khô Da An Toàn Cho Trẻ Nhỏ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Tạo Độ Ẩm Phun Sương Tinh Dầu Khử Khuẩn Đèn Đêm 3 Lít')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Tạo Độ Ẩm Phun Sương Tinh Dầu Khử Khuẩn Đèn Đêm 3 Lít', 
           N'Sản phẩm Máy Tạo Độ Ẩm Phun Sương Tinh Dầu Khử Khuẩn Đèn Đêm 3 Lít chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Khử Mùi Diệt Khuẩn Không Khí Trong Phòng Ngủ Tủ Lạnh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Khử Mùi Diệt Khuẩn Không Khí Trong Phòng Ngủ Tủ Lạnh', 
           N'Sản phẩm Máy Khử Mùi Diệt Khuẩn Không Khí Trong Phòng Ngủ Tủ Lạnh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cây Nước Nóng Lạnh Tích Hợp Khóa Trẻ Em An Toàn Tiết Kiệm Điện')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cây Nước Nóng Lạnh Tích Hợp Khóa Trẻ Em An Toàn Tiết Kiệm Điện', 
           N'Sản phẩm Cây Nước Nóng Lạnh Tích Hợp Khóa Trẻ Em An Toàn Tiết Kiệm Điện chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nồi Cơm Điện Mini Cho Người Độc Thân Sinh Viên 1.2 Lít')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nồi Cơm Điện Mini Cho Người Độc Thân Sinh Viên 1.2 Lít', 
           N'Sản phẩm Nồi Cơm Điện Mini Cho Người Độc Thân Sinh Viên 1.2 Lít chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Làm Bánh Mì Kẹp Sandwich Nướng Bánh Waffle Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Làm Bánh Mì Kẹp Sandwich Nướng Bánh Waffle Tiện Lợi', 
           N'Sản phẩm Máy Làm Bánh Mì Kẹp Sandwich Nướng Bánh Waffle Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vợt Bắt Muỗi Điện Pin Sạc Tích Hợp Đèn Bắt Muỗi Thông Minh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vợt Bắt Muỗi Điện Pin Sạc Tích Hợp Đèn Bắt Muỗi Thông Minh', 
           N'Sản phẩm Vợt Bắt Muỗi Điện Pin Sạc Tích Hợp Đèn Bắt Muỗi Thông Minh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Đánh Trứng Cầm Tay 7 Tốc Độ Kèm Que Trộn Bột Inox')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Đánh Trứng Cầm Tay 7 Tốc Độ Kèm Que Trộn Bột Inox', 
           N'Sản phẩm Máy Đánh Trứng Cầm Tay 7 Tốc Độ Kèm Que Trộn Bột Inox chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Sấy Giày Khử Mùi Hôi Ẩm Mốc Tia UV Ban Đêm Tự Ngắt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Sấy Giày Khử Mùi Hôi Ẩm Mốc Tia UV Ban Đêm Tự Ngắt', 
           N'Sản phẩm Máy Sấy Giày Khử Mùi Hôi Ẩm Mốc Tia UV Ban Đêm Tự Ngắt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Quạt Sàn Công Nghiệp Cánh Sắt Cũ Thanh Lý Hỏng Vòng Bi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Quạt Sàn Công Nghiệp Cánh Sắt Cũ Thanh Lý Hỏng Vòng Bi', 
           N'Sản phẩm Quạt Sàn Công Nghiệp Cánh Sắt Cũ Thanh Lý Hỏng Vòng Bi tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bếp Gas Đơn Cũ Gỉ Sét Đã Thu Hồi Đảm Bảo An Toàn Cháy Nổ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bếp Gas Đơn Cũ Gỉ Sét Đã Thu Hồi Đảm Bảo An Toàn Cháy Nổ', 
           N'Sản phẩm Bếp Gas Đơn Cũ Gỉ Sét Đã Thu Hồi Đảm Bảo An Toàn Cháy Nổ đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tủ Lạnh Side By Side Hitachi Inverter 6 Cánh Nhập Khẩu Nhật Bản')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tủ Lạnh Side By Side Hitachi Inverter 6 Cánh Nhập Khẩu Nhật Bản', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Tủ Lạnh Side By Side Hitachi Inverter 6 Cánh Nhập Khẩu Nhật Bản.', 
           44000000, 
           3, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Thiết Bị Điện Gia Dụng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Xếp Hình Lego Thành Phố Cảnh Sát Cứu Hỏa 800 Chi Tiết')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Xếp Hình Lego Thành Phố Cảnh Sát Cứu Hỏa 800 Chi Tiết', 
           N'Sản phẩm Bộ Xếp Hình Lego Thành Phố Cảnh Sát Cứu Hỏa 800 Chi Tiết chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xe Ô Tô Điều Khiển Từ Xa Leo Tường Xoay 360 Độ Pin Sạc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xe Ô Tô Điều Khiển Từ Xa Leo Tường Xoay 360 Độ Pin Sạc', 
           N'Sản phẩm Xe Ô Tô Điều Khiển Từ Xa Leo Tường Xoay 360 Độ Pin Sạc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Búp Bê Bé Gái Kèm Tủ Quần Áo Và Phụ Kiện Làm Đẹp Dễ Thương')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Búp Bê Bé Gái Kèm Tủ Quần Áo Và Phụ Kiện Làm Đẹp Dễ Thương', 
           N'Sản phẩm Búp Bê Bé Gái Kèm Tủ Quần Áo Và Phụ Kiện Làm Đẹp Dễ Thương chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Nấu Ăn Trẻ Em Bằng Nhựa Nguyên Sinh 36 Món Chân Thực')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Nấu Ăn Trẻ Em Bằng Nhựa Nguyên Sinh 36 Món Chân Thực', 
           N'Sản phẩm Bộ Nấu Ăn Trẻ Em Bằng Nhựa Nguyên Sinh 36 Món Chân Thực chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đất Nặn Không Dính Tay An Toàn 12 Màu Tươi Sáng Kèm Khuôn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đất Nặn Không Dính Tay An Toàn 12 Màu Tươi Sáng Kèm Khuôn', 
           N'Sản phẩm Đất Nặn Không Dính Tay An Toàn 12 Màu Tươi Sáng Kèm Khuôn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Bay Trực Thăng Cảm Ứng Bay Bằng Bàn Tay Có Đèn Sáng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Bay Trực Thăng Cảm Ứng Bay Bằng Bàn Tay Có Đèn Sáng', 
           N'Sản phẩm Máy Bay Trực Thăng Cảm Ứng Bay Bằng Bàn Tay Có Đèn Sáng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bảng Vẽ Từ Tính Cho Bé Tập Viết Vẽ Không Bẩn Quần Áo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bảng Vẽ Từ Tính Cho Bé Tập Viết Vẽ Không Bẩn Quần Áo', 
           N'Sản phẩm Bảng Vẽ Từ Tính Cho Bé Tập Viết Vẽ Không Bẩn Quần Áo chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đồ Chơi Bác Sĩ Cứu Thương Kèm Ống Nghe Đèn Soi Tai Nhựa')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đồ Chơi Bác Sĩ Cứu Thương Kèm Ống Nghe Đèn Soi Tai Nhựa', 
           N'Sản phẩm Bộ Đồ Chơi Bác Sĩ Cứu Thương Kèm Ống Nghe Đèn Soi Tai Nhựa chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khối Rubik 3x3 Nam Châm Siêu Mượt Xoay Cực Nhanh Chống Kẹt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khối Rubik 3x3 Nam Châm Siêu Mượt Xoay Cực Nhanh Chống Kẹt', 
           N'Sản phẩm Khối Rubik 3x3 Nam Châm Siêu Mượt Xoay Cực Nhanh Chống Kẹt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Thẻ Học Flashcard Thông Minh Song Ngữ Anh Việt Cho Bé')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Thẻ Học Flashcard Thông Minh Song Ngữ Anh Việt Cho Bé', 
           N'Sản phẩm Bộ Thẻ Học Flashcard Thông Minh Song Ngữ Anh Việt Cho Bé chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Súng Bắn Bong Bóng Xà Phòng Tự Động 69 Nòng Phun Cầu Vồng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Súng Bắn Bong Bóng Xà Phòng Tự Động 69 Nòng Phun Cầu Vồng', 
           N'Sản phẩm Súng Bắn Bong Bóng Xà Phòng Tự Động 69 Nòng Phun Cầu Vồng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cần Câu Cá Nam Châm Đồ Chơi Kèm Hồ Bơi Bơm Hơi Đầy Đủ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cần Câu Cá Nam Châm Đồ Chơi Kèm Hồ Bơi Bơm Hơi Đầy Đủ', 
           N'Sản phẩm Cần Câu Cá Nam Châm Đồ Chơi Kèm Hồ Bơi Bơm Hơi Đầy Đủ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đàn Organ Trẻ Em Có Micro Cắm Điện Phát Nhạc Vui Nhộn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đàn Organ Trẻ Em Có Micro Cắm Điện Phát Nhạc Vui Nhộn', 
           N'Sản phẩm Đàn Organ Trẻ Em Có Micro Cắm Điện Phát Nhạc Vui Nhộn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xe Cần Cẩu Đồ Chơi Công Trình Bánh Xích Xúc Đất Cát Bãi Biển')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xe Cần Cẩu Đồ Chơi Công Trình Bánh Xích Xúc Đất Cát Bãi Biển', 
           N'Sản phẩm Xe Cần Cẩu Đồ Chơi Công Trình Bánh Xích Xúc Đất Cát Bãi Biển chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Tranh Cát Tô Màu Cho Bé Kèm Khay Đựng Cát 12 Tranh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Tranh Cát Tô Màu Cho Bé Kèm Khay Đựng Cát 12 Tranh', 
           N'Sản phẩm Bộ Tranh Cát Tô Màu Cho Bé Kèm Khay Đựng Cát 12 Tranh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Cờ Vua Gỗ Nam Châm Gấp Gọn Bàn Cờ Chuẩn Thi Đấu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Cờ Vua Gỗ Nam Châm Gấp Gọn Bàn Cờ Chuẩn Thi Đấu', 
           N'Sản phẩm Bộ Cờ Vua Gỗ Nam Châm Gấp Gọn Bàn Cờ Chuẩn Thi Đấu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thú Nhún Bơm Hơi Cho Bé Tập Vận Động Bằng Cao Su Dày Dặn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thú Nhún Bơm Hơi Cho Bé Tập Vận Động Bằng Cao Su Dày Dặn', 
           N'Sản phẩm Thú Nhún Bơm Hơi Cho Bé Tập Vận Động Bằng Cao Su Dày Dặn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bể Bơi Bơm Hơi Gia Đình 3 Tầng Kèm Bơm Điện Nhanh Chóng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bể Bơi Bơm Hơi Gia Đình 3 Tầng Kèm Bơm Điện Nhanh Chóng', 
           N'Sản phẩm Bể Bơi Bơm Hơi Gia Đình 3 Tầng Kèm Bơm Điện Nhanh Chóng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồ Chơi Gỗ Rút Thanh Tháp Gỗ Trí Uẩn Rèn Luyện Khéo Léo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồ Chơi Gỗ Rút Thanh Tháp Gỗ Trí Uẩn Rèn Luyện Khéo Léo', 
           N'Sản phẩm Đồ Chơi Gỗ Rút Thanh Tháp Gỗ Trí Uẩn Rèn Luyện Khéo Léo chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Con Quay Spiner Xả Stress Vòng Bi Thép Xoay Lâu Phát Sáng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Con Quay Spiner Xả Stress Vòng Bi Thép Xoay Lâu Phát Sáng', 
           N'Sản phẩm Con Quay Spiner Xả Stress Vòng Bi Thép Xoay Lâu Phát Sáng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/MeBe04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồ Chơi Điện Tử Bắn Gà Nước Cũ Rò Rỉ Nước')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồ Chơi Điện Tử Bắn Gà Nước Cũ Rò Rỉ Nước', 
           N'Sản phẩm Đồ Chơi Điện Tử Bắn Gà Nước Cũ Rò Rỉ Nước tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/MeBe01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xe Ô Tô Chạy Cót Sắt Thời Bao Cấp Cũ Kỹ Không Còn Bánh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xe Ô Tô Chạy Cót Sắt Thời Bao Cấp Cũ Kỹ Không Còn Bánh', 
           N'Sản phẩm Xe Ô Tô Chạy Cót Sắt Thời Bao Cấp Cũ Kỹ Không Còn Bánh đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/MeBe02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mô Hình Lego Siêu Xe Bugatti Chiron Tỉ Lệ 1:8 Bản Sưu Tầm 3599 Miếng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mô Hình Lego Siêu Xe Bugatti Chiron Tỉ Lệ 1:8 Bản Sưu Tầm 3599 Miếng', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Mô Hình Lego Siêu Xe Bugatti Chiron Tỉ Lệ 1:8 Bản Sưu Tầm 3599 Miếng.', 
           45000000, 
           3, 
           N'/images/MeBe03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Đồ Chơi Sáng Tạo Trẻ Em';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hạt Cho Mèo Vị Cá Hồi Giàu Đạm Omega 3 6 Túi 1.5kg')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hạt Cho Mèo Vị Cá Hồi Giàu Đạm Omega 3 6 Túi 1.5kg', 
           N'Sản phẩm Hạt Cho Mèo Vị Cá Hồi Giàu Đạm Omega 3 6 Túi 1.5kg chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Pate Cho Chó Thịt Bò Xốt Rau Củ Lon 400g Đậm Vị Thơm Ngon')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Pate Cho Chó Thịt Bò Xốt Rau Củ Lon 400g Đậm Vị Thơm Ngon', 
           N'Sản phẩm Pate Cho Chó Thịt Bò Xốt Rau Củ Lon 400g Đậm Vị Thơm Ngon chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cát Vệ Sinh Đậu Nành Tofu Xả Bồn Cầu Không Bụi Khử Mùi 6L')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cát Vệ Sinh Đậu Nành Tofu Xả Bồn Cầu Không Bụi Khử Mùi 6L', 
           N'Sản phẩm Cát Vệ Sinh Đậu Nành Tofu Xả Bồn Cầu Không Bụi Khử Mùi 6L chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chuồng Lồng Thú Cưng Sơn Tĩnh Điện Gấp Gọn Có Khay Hứng Phân')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chuồng Lồng Thú Cưng Sơn Tĩnh Điện Gấp Gọn Có Khay Hứng Phân', 
           N'Sản phẩm Chuồng Lồng Thú Cưng Sơn Tĩnh Điện Gấp Gọn Có Khay Hứng Phân chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Sữa Tắm Cho Chó Mèo Khử Mùi Lưu Hương Lâu Mềm Mượt Lông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Sữa Tắm Cho Chó Mèo Khử Mùi Lưu Hương Lâu Mềm Mượt Lông', 
           N'Sản phẩm Sữa Tắm Cho Chó Mèo Khử Mùi Lưu Hương Lâu Mềm Mượt Lông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Nước Tự Động Gắn Lồng Không Nhỏ Giọt Cho Thú Cưng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Nước Tự Động Gắn Lồng Không Nhỏ Giọt Cho Thú Cưng', 
           N'Sản phẩm Bình Nước Tự Động Gắn Lồng Không Nhỏ Giọt Cho Thú Cưng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bát Ăn Chống Gù Cổ Nghiêng 15 Độ Bảo Vệ Xương Sống Cho Mèo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bát Ăn Chống Gù Cổ Nghiêng 15 Độ Bảo Vệ Xương Sống Cho Mèo', 
           N'Sản phẩm Bát Ăn Chống Gù Cổ Nghiêng 15 Độ Bảo Vệ Xương Sống Cho Mèo chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Trụ Cào Móng Cho Mèo Quấn Dây Thừng Sisal Tự Nhiên Chắc Chắn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Trụ Cào Móng Cho Mèo Quấn Dây Thừng Sisal Tự Nhiên Chắc Chắn', 
           N'Sản phẩm Trụ Cào Móng Cho Mèo Quấn Dây Thừng Sisal Tự Nhiên Chắc Chắn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Lược Chải Lông Chó Mèo Lấy Lông Thừa Có Nút Bấm Xả Lông')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Lược Chải Lông Chó Mèo Lấy Lông Thừa Có Nút Bấm Xả Lông', 
           N'Sản phẩm Lược Chải Lông Chó Mèo Lấy Lông Thừa Có Nút Bấm Xả Lông chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vòng Cổ Chuông Kèm Dây Dắt Dạo Bộ Chó Nhỏ Thỏ Mèo Xinh Xắn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vòng Cổ Chuông Kèm Dây Dắt Dạo Bộ Chó Nhỏ Thỏ Mèo Xinh Xắn', 
           N'Sản phẩm Vòng Cổ Chuông Kèm Dây Dắt Dạo Bộ Chó Nhỏ Thỏ Mèo Xinh Xắn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đệm Nằm Tròn Lông Xù Mềm Ấm Cho Mèo Chó Ngủ Thư Giãn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đệm Nằm Tròn Lông Xù Mềm Ấm Cho Mèo Chó Ngủ Thư Giãn', 
           N'Sản phẩm Đệm Nằm Tròn Lông Xù Mềm Ấm Cho Mèo Chó Ngủ Thư Giãn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cần Câu Mèo Gắn Lông Vũ Chuông Lắc Kích Thích Săn Mồi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cần Câu Mèo Gắn Lông Vũ Chuông Lắc Kích Thích Săn Mồi', 
           N'Sản phẩm Cần Câu Mèo Gắn Lông Vũ Chuông Lắc Kích Thích Săn Mồi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kìm Bấm Móng Cho Chó Mèo Kèm Dũa Móng Có Chốt Khóa An Toàn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kìm Bấm Móng Cho Chó Mèo Kèm Dũa Móng Có Chốt Khóa An Toàn', 
           N'Sản phẩm Kìm Bấm Móng Cho Chó Mèo Kèm Dũa Móng Có Chốt Khóa An Toàn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Xịt Hướng Dẫn Đi Vệ Sinh Đúng Chỗ Cho Chó Mèo Hiệu Quả')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Xịt Hướng Dẫn Đi Vệ Sinh Đúng Chỗ Cho Chó Mèo Hiệu Quả', 
           N'Sản phẩm Xịt Hướng Dẫn Đi Vệ Sinh Đúng Chỗ Cho Chó Mèo Hiệu Quả chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Balo Phi Thuyền Vận Chuyển Mèo Trong Suốt Thoáng Khí Đi Bác Sĩ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Balo Phi Thuyền Vận Chuyển Mèo Trong Suốt Thoáng Khí Đi Bác Sĩ', 
           N'Sản phẩm Balo Phi Thuyền Vận Chuyển Mèo Trong Suốt Thoáng Khí Đi Bác Sĩ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bánh Thưởng Snack Que Gặm Sạch Răng Cho Chó Gói 100g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bánh Thưởng Snack Que Gặm Sạch Răng Cho Chó Gói 100g', 
           N'Sản phẩm Bánh Thưởng Snack Que Gặm Sạch Răng Cho Chó Gói 100g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cỏ Lúa Mì Cho Mèo Tiêu Búi Lông Hộp Tự Trồng Thảo Mộc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cỏ Lúa Mì Cho Mèo Tiêu Búi Lông Hộp Tự Trồng Thảo Mộc', 
           N'Sản phẩm Cỏ Lúa Mì Cho Mèo Tiêu Búi Lông Hộp Tự Trồng Thảo Mộc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Xịt Khử Khuẩn Vệ Sinh Khay Đi Vệ Sinh Hương Quả Chanh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Xịt Khử Khuẩn Vệ Sinh Khay Đi Vệ Sinh Hương Quả Chanh', 
           N'Sản phẩm Bình Xịt Khử Khuẩn Vệ Sinh Khay Đi Vệ Sinh Hương Quả Chanh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Áo Quần Cho Thú Cưng Mùa Đông Ấm Áp Họa Tiết Đáng Yêu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Áo Quần Cho Thú Cưng Mùa Đông Ấm Áp Họa Tiết Đáng Yêu', 
           N'Sản phẩm Áo Quần Cho Thú Cưng Mùa Đông Ấm Áp Họa Tiết Đáng Yêu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đồ Chơi Gặm Xương Cao Su Gắn Chuông Cho Chó Mài Răng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đồ Chơi Gặm Xương Cao Su Gắn Chuông Cho Chó Mài Răng', 
           N'Sản phẩm Đồ Chơi Gặm Xương Cao Su Gắn Chuông Cho Chó Mài Răng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Vòng Đeo Cổ Diệt Ve Rận Thuốc Quá Hạn Sử Dụng Bị Tiêu Hủy')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Vòng Đeo Cổ Diệt Ve Rận Thuốc Quá Hạn Sử Dụng Bị Tiêu Hủy', 
           N'Sản phẩm Vòng Đeo Cổ Diệt Ve Rận Thuốc Quá Hạn Sử Dụng Bị Tiêu Hủy tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Lồng Chim Chào Mào Cũ Gãy Nan Bị Thải Loại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Lồng Chim Chào Mào Cũ Gãy Nan Bị Thải Loại', 
           N'Sản phẩm Lồng Chim Chào Mào Cũ Gãy Nan Bị Thải Loại đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Dọn Vệ Sinh Tự Động Cho Mèo Petkit Pura Max Khử Mùi Điện Tử')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Dọn Vệ Sinh Tự Động Cho Mèo Petkit Pura Max Khử Mùi Điện Tử', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Máy Dọn Vệ Sinh Tự Động Cho Mèo Petkit Pura Max Khử Mùi Điện Tử.', 
           46000000, 
           3, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Chăm Sóc Thú Cưng';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khẩu Trang Y Tế 4 Lớp Kháng Khuẩn Hộp 50 Chiếc Chuẩn Bộ Y Tế')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khẩu Trang Y Tế 4 Lớp Kháng Khuẩn Hộp 50 Chiếc Chuẩn Bộ Y Tế', 
           N'Sản phẩm Khẩu Trang Y Tế 4 Lớp Kháng Khuẩn Hộp 50 Chiếc Chuẩn Bộ Y Tế chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Đo Huyết Áp Điện Tử Bắp Tay Tự Động Nhớ 99 Lần Đo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Đo Huyết Áp Điện Tử Bắp Tay Tự Động Nhớ 99 Lần Đo', 
           N'Sản phẩm Máy Đo Huyết Áp Điện Tử Bắp Tay Tự Động Nhớ 99 Lần Đo chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nhiệt Kế Điện Tử Đo Nách Miệng Nhanh Chóng Báo Tiếng Bíp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nhiệt Kế Điện Tử Đo Nách Miệng Nhanh Chóng Báo Tiếng Bíp', 
           N'Sản phẩm Nhiệt Kế Điện Tử Đo Nách Miệng Nhanh Chóng Báo Tiếng Bíp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cồn Y Tế 70 Độ Sát Trùng Vết Thương Chai Xịt 500ml Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cồn Y Tế 70 Độ Sát Trùng Vết Thương Chai Xịt 500ml Tiện Lợi', 
           N'Sản phẩm Cồn Y Tế 70 Độ Sát Trùng Vết Thương Chai Xịt 500ml Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nước Muối Sinh Lý Kháng Khuẩn Natri Clorid 0.9% Lốc 10 Chai')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nước Muối Sinh Lý Kháng Khuẩn Natri Clorid 0.9% Lốc 10 Chai', 
           N'Sản phẩm Nước Muối Sinh Lý Kháng Khuẩn Natri Clorid 0.9% Lốc 10 Chai chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Đựng Thuốc Gia Đình 3 Tầng Nhiều Ngăn Có Quai Xách Khóa Gài')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Đựng Thuốc Gia Đình 3 Tầng Nhiều Ngăn Có Quai Xách Khóa Gài', 
           N'Sản phẩm Hộp Đựng Thuốc Gia Đình 3 Tầng Nhiều Ngăn Có Quai Xách Khóa Gài chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Băng Cá Nhân Vải Co Giãn Thông Thoáng Hộp 100 Miếng Đủ Cỡ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Băng Cá Nhân Vải Co Giãn Thông Thoáng Hộp 100 Miếng Đủ Cỡ', 
           N'Sản phẩm Băng Cá Nhân Vải Co Giãn Thông Thoáng Hộp 100 Miếng Đủ Cỡ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dầu Gió Xanh Thiên Nhiên Giảm Đau Đầu Cảm Mạo Chai 24ml')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dầu Gió Xanh Thiên Nhiên Giảm Đau Đầu Cảm Mạo Chai 24ml', 
           N'Sản phẩm Dầu Gió Xanh Thiên Nhiên Giảm Đau Đầu Cảm Mạo Chai 24ml chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bột Oresol Bù Nước Điện Giải Hương Cam Hộp 20 Gói Dễ Uống')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bột Oresol Bù Nước Điện Giải Hương Cam Hộp 20 Gói Dễ Uống', 
           N'Sản phẩm Bột Oresol Bù Nước Điện Giải Hương Cam Hộp 20 Gói Dễ Uống chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Viên Sủi Bổ Sung Vitamin C Tăng Cường Đề Kháng Tuýp 20 Viên')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Viên Sủi Bổ Sung Vitamin C Tăng Cường Đề Kháng Tuýp 20 Viên', 
           N'Sản phẩm Viên Sủi Bổ Sung Vitamin C Tăng Cường Đề Kháng Tuýp 20 Viên chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cao Dán Giảm Đau Nhức Xương Khớp Thảo Dược Hộp 10 Miếng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cao Dán Giảm Đau Nhức Xương Khớp Thảo Dược Hộp 10 Miếng', 
           N'Sản phẩm Cao Dán Giảm Đau Nhức Xương Khớp Thảo Dược Hộp 10 Miếng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đai Nẹp Cố Định Lưng Cột Sống Thoát Vị Đĩa Đệm Thoáng Khí')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đai Nẹp Cố Định Lưng Cột Sống Thoát Vị Đĩa Đệm Thoáng Khí', 
           N'Sản phẩm Đai Nẹp Cố Định Lưng Cột Sống Thoát Vị Đĩa Đệm Thoáng Khí chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Băng Thun Bó Cổ Chân Cổ Tay Co Giãn Chống Trật Khớp Thể Thao')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Băng Thun Bó Cổ Chân Cổ Tay Co Giãn Chống Trật Khớp Thể Thao', 
           N'Sản phẩm Băng Thun Bó Cổ Chân Cổ Tay Co Giãn Chống Trật Khớp Thể Thao chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Que Test Nhanh Đường Huyết Hộp 50 Que Kèm Kim Lấy Máu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Que Test Nhanh Đường Huyết Hộp 50 Que Kèm Kim Lấy Máu', 
           N'Sản phẩm Que Test Nhanh Đường Huyết Hộp 50 Que Kèm Kim Lấy Máu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dung Dịch Súc Miệng Họng Kháng Khuẩn Chlorhexidine 0.12%')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dung Dịch Súc Miệng Họng Kháng Khuẩn Chlorhexidine 0.12%', 
           N'Sản phẩm Dung Dịch Súc Miệng Họng Kháng Khuẩn Chlorhexidine 0.12% chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Chườm Nóng Lạnh Bằng Gel Đa Năng Giảm Đau Sưng Tấy')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Chườm Nóng Lạnh Bằng Gel Đa Năng Giảm Đau Sưng Tấy', 
           N'Sản phẩm Túi Chườm Nóng Lạnh Bằng Gel Đa Năng Giảm Đau Sưng Tấy chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bao Cao Su Siêu Mỏng Gân Gai Kéo Dài Thời Gian Hộp 10 Chiếc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bao Cao Su Siêu Mỏng Gân Gai Kéo Dài Thời Gian Hộp 10 Chiếc', 
           N'Sản phẩm Bao Cao Su Siêu Mỏng Gân Gai Kéo Dài Thời Gian Hộp 10 Chiếc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gel Bôi Trơn Gốc Nước Tự Nhiên Dịu Nhẹ Chai Bơm 100ml')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gel Bôi Trơn Gốc Nước Tự Nhiên Dịu Nhẹ Chai Bơm 100ml', 
           N'Sản phẩm Gel Bôi Trơn Gốc Nước Tự Nhiên Dịu Nhẹ Chai Bơm 100ml chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cân Đo Chỉ Số BMI Gia Đình Mặt Kính Chịu Lực 180kg')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cân Đo Chỉ Số BMI Gia Đình Mặt Kính Chịu Lực 180kg', 
           N'Sản phẩm Cân Đo Chỉ Số BMI Gia Đình Mặt Kính Chịu Lực 180kg chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Hồng Ngoại Trị Liệu Giảm Đau Cơ Khớp Cắm Điện Tiện Dụng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Hồng Ngoại Trị Liệu Giảm Đau Cơ Khớp Cắm Điện Tiện Dụng', 
           N'Sản phẩm Đèn Hồng Ngoại Trị Liệu Giảm Đau Cơ Khớp Cắm Điện Tiện Dụng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/LamDep04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Hút Đờm Nhớt Gia Đình Đã Hỏng Động Cơ Bơm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Hút Đờm Nhớt Gia Đình Đã Hỏng Động Cơ Bơm', 
           N'Sản phẩm Máy Hút Đờm Nhớt Gia Đình Đã Hỏng Động Cơ Bơm tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/LamDep01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Oxy Thở Cầm Tay Mini Hết Khí Cần Nạp Lại')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Oxy Thở Cầm Tay Mini Hết Khí Cần Nạp Lại', 
           N'Sản phẩm Bình Oxy Thở Cầm Tay Mini Hết Khí Cần Nạp Lại đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/LamDep02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ghế Massage Toàn Thân Trí Tuệ Nhân Tạo AI 4D Con Lăn Silicon Cao Cấp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ghế Massage Toàn Thân Trí Tuệ Nhân Tạo AI 4D Con Lăn Silicon Cao Cấp', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Ghế Massage Toàn Thân Trí Tuệ Nhân Tạo AI 4D Con Lăn Silicon Cao Cấp.', 
           47000000, 
           3, 
           N'/images/LamDep03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Sức Khỏe & Y Tế';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Ảnh Mirrorless Sony Alpha A6400 Kèm Lens Kit 16-50mm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Ảnh Mirrorless Sony Alpha A6400 Kèm Lens Kit 16-50mm', 
           N'Sản phẩm Máy Ảnh Mirrorless Sony Alpha A6400 Kèm Lens Kit 16-50mm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ống Kính Chân Dung 50mm F1.8 Khẩu Độ Lớn Xóa Phông Ảo Diệu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ống Kính Chân Dung 50mm F1.8 Khẩu Độ Lớn Xóa Phông Ảo Diệu', 
           N'Sản phẩm Ống Kính Chân Dung 50mm F1.8 Khẩu Độ Lớn Xóa Phông Ảo Diệu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Gimbal Chống Rung 3 Trục Cho Điện Thoại Quay Video Chuyên Nghiệp')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Gimbal Chống Rung 3 Trục Cho Điện Thoại Quay Video Chuyên Nghiệp', 
           N'Sản phẩm Gimbal Chống Rung 3 Trục Cho Điện Thoại Quay Video Chuyên Nghiệp chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thẻ Nhớ SDHC 128GB Tốc Độ 170MB/s Chuyên Dụng Quay 4K Máy Ảnh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thẻ Nhớ SDHC 128GB Tốc Độ 170MB/s Chuyên Dụng Quay 4K Máy Ảnh', 
           N'Sản phẩm Thẻ Nhớ SDHC 128GB Tốc Độ 170MB/s Chuyên Dụng Quay 4K Máy Ảnh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chân Máy Ảnh Tripod Hợp Kim Nhôm Có Đầu Ballhead Xoay 360')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chân Máy Ảnh Tripod Hợp Kim Nhôm Có Đầu Ballhead Xoay 360', 
           N'Sản phẩm Chân Máy Ảnh Tripod Hợp Kim Nhôm Có Đầu Ballhead Xoay 360 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Pin Máy Ảnh Dung Lượng Cao Kèm Đốc Sạc Đôi Tiện Lợi Đầy Đủ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Pin Máy Ảnh Dung Lượng Cao Kèm Đốc Sạc Đôi Tiện Lợi Đầy Đủ', 
           N'Sản phẩm Pin Máy Ảnh Dung Lượng Cao Kèm Đốc Sạc Đôi Tiện Lợi Đầy Đủ chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đèn Led Quay Phim Chụp Ảnh Đổi Màu RGB Cầm Tay Có Nam Châm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đèn Led Quay Phim Chụp Ảnh Đổi Màu RGB Cầm Tay Có Nam Châm', 
           N'Sản phẩm Đèn Led Quay Phim Chụp Ảnh Đổi Màu RGB Cầm Tay Có Nam Châm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Chống Ẩm Máy Ảnh Dung Tích 12 Lít Kèm Đồng Hồ Đo Ẩm Ẩm Kế')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Chống Ẩm Máy Ảnh Dung Tích 12 Lít Kèm Đồng Hồ Đo Ẩm Ẩm Kế', 
           N'Sản phẩm Hộp Chống Ẩm Máy Ảnh Dung Tích 12 Lít Kèm Đồng Hồ Đo Ẩm Ẩm Kế chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Túi Đựng Máy Ảnh Chống Nước Chống Sốc Nhiều Ngăn Chứa Lens')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Túi Đựng Máy Ảnh Chống Nước Chống Sốc Nhiều Ngăn Chứa Lens', 
           N'Sản phẩm Túi Đựng Máy Ảnh Chống Nước Chống Sốc Nhiều Ngăn Chứa Lens chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Dụng Cụ Vệ Sinh Ống Kính Cọ Quét Bút Lau Bóng Thổi Bụi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Dụng Cụ Vệ Sinh Ống Kính Cọ Quét Bút Lau Bóng Thổi Bụi', 
           N'Sản phẩm Bộ Dụng Cụ Vệ Sinh Ống Kính Cọ Quét Bút Lau Bóng Thổi Bụi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kính Lọc UV Bảo Vệ Thấu Kính Ống Kính Filter Đủ Kích Cỡ Phi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kính Lọc UV Bảo Vệ Thấu Kính Ống Kính Filter Đủ Kích Cỡ Phi', 
           N'Sản phẩm Kính Lọc UV Bảo Vệ Thấu Kính Ống Kính Filter Đủ Kích Cỡ Phi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dây Đeo Máy Ảnh Thao Tác Nhanh Chống Mỏi Cổ Bản Rộng Êm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dây Đeo Máy Ảnh Thao Tác Nhanh Chống Mỏi Cổ Bản Rộng Êm', 
           N'Sản phẩm Dây Đeo Máy Ảnh Thao Tác Nhanh Chống Mỏi Cổ Bản Rộng Êm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Mic Thu Âm Không Dây Gắn Chân Hotshoe Máy Ảnh Lọc Gió Tốt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Mic Thu Âm Không Dây Gắn Chân Hotshoe Máy Ảnh Lọc Gió Tốt', 
           N'Sản phẩm Mic Thu Âm Không Dây Gắn Chân Hotshoe Máy Ảnh Lọc Gió Tốt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Màn Hình Rời Thu Âm Quay Phim Monitor 5.5 Inch Cảm Ứng 4K')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Màn Hình Rời Thu Âm Quay Phim Monitor 5.5 Inch Cảm Ứng 4K', 
           N'Sản phẩm Màn Hình Rời Thu Âm Quay Phim Monitor 5.5 Inch Cảm Ứng 4K chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Tấm Hắt Sáng 5 Trong 1 Gấp Gọn Chụp Ảnh Chân Dung Studio')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Tấm Hắt Sáng 5 Trong 1 Gấp Gọn Chụp Ảnh Chân Dung Studio', 
           N'Sản phẩm Tấm Hắt Sáng 5 Trong 1 Gấp Gọn Chụp Ảnh Chân Dung Studio chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Phông Nền Chụp Ảnh Sản Phẩm Vải Xi Măng Chống Nước 2 Mặt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Phông Nền Chụp Ảnh Sản Phẩm Vải Xi Măng Chống Nước 2 Mặt', 
           N'Sản phẩm Phông Nền Chụp Ảnh Sản Phẩm Vải Xi Măng Chống Nước 2 Mặt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bàn Xoay Chụp Ảnh Sản Phẩm Tự Động 360 Độ Có Điều Khiển')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bàn Xoay Chụp Ảnh Sản Phẩm Tự Động 360 Độ Có Điều Khiển', 
           N'Sản phẩm Bàn Xoay Chụp Ảnh Sản Phẩm Tự Động 360 Độ Có Điều Khiển chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ngàm Chuyển Đổi Ống Kính Canon EF Sang Sony E Mount Lấy Nét Tự Động')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ngàm Chuyển Đổi Ống Kính Canon EF Sang Sony E Mount Lấy Nét Tự Động', 
           N'Sản phẩm Ngàm Chuyển Đổi Ống Kính Canon EF Sang Sony E Mount Lấy Nét Tự Động chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Nắp Đậy Ống Kính Cap Trước Sau Chống Bụi Xước Thấu Kính')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Nắp Đậy Ống Kính Cap Trước Sau Chống Bụi Xước Thấu Kính', 
           N'Sản phẩm Nắp Đậy Ống Kính Cap Trước Sau Chống Bụi Xước Thấu Kính chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Đầu Đọc Thẻ Nhớ Đa Năng Type-C USB 3.0 Đọc Thẻ SD TF Nhanh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Đầu Đọc Thẻ Nhớ Đa Năng Type-C USB 3.0 Đọc Thẻ SD TF Nhanh', 
           N'Sản phẩm Đầu Đọc Thẻ Nhớ Đa Năng Type-C USB 3.0 Đọc Thẻ SD TF Nhanh chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/ThietBiDienTu04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Quay Băng MiniDV Cổ Điển Bị Hỏng Mắt Từ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Quay Băng MiniDV Cổ Điển Bị Hỏng Mắt Từ', 
           N'Sản phẩm Máy Quay Băng MiniDV Cổ Điển Bị Hỏng Mắt Từ tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/ThietBiDienTu01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Ảnh Cơ Film SLR Lên Cót Tay Bị Kẹt Màn Trập Cũ')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Ảnh Cơ Film SLR Lên Cót Tay Bị Kẹt Màn Trập Cũ', 
           N'Sản phẩm Máy Ảnh Cơ Film SLR Lên Cót Tay Bị Kẹt Màn Trập Cũ đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/ThietBiDienTu02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Máy Ảnh Chuyên Nghiệp Canon EOS R5 Mark II Full Frame 8K RAW')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Máy Ảnh Chuyên Nghiệp Canon EOS R5 Mark II Full Frame 8K RAW', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Máy Ảnh Chuyên Nghiệp Canon EOS R5 Mark II Full Frame 8K RAW.', 
           48000000, 
           3, 
           N'/images/ThietBiDienTu03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Máy Ảnh - Quay Phim';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Nồi Inox 304 3 Đáy Nắp Kính Cường Lực 3 Món Chống Cháy')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Nồi Inox 304 3 Đáy Nắp Kính Cường Lực 3 Món Chống Cháy', 
           N'Sản phẩm Bộ Nồi Inox 304 3 Đáy Nắp Kính Cường Lực 3 Món Chống Cháy chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           50000, 
           20, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Chảo Chống Dính Vân Đá Hoa Cương Bếp Từ Không Bong Tróc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Chảo Chống Dính Vân Đá Hoa Cương Bếp Từ Không Bong Tróc', 
           N'Sản phẩm Chảo Chống Dính Vân Đá Hoa Cương Bếp Từ Không Bong Tróc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           87000, 
           27, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Dao Bếp Nhật Thép Không Gỉ 6 Món Sắc Bén Kháng Khuẩn')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Dao Bếp Nhật Thép Không Gỉ 6 Món Sắc Bén Kháng Khuẩn', 
           N'Sản phẩm Bộ Dao Bếp Nhật Thép Không Gỉ 6 Món Sắc Bén Kháng Khuẩn chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           124000, 
           34, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thớt Gỗ Nghiến Tự Nhiên Không Mùn Bền Vĩnh Cửu Đường Kính 30cm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thớt Gỗ Nghiến Tự Nhiên Không Mùn Bền Vĩnh Cửu Đường Kính 30cm', 
           N'Sản phẩm Thớt Gỗ Nghiến Tự Nhiên Không Mùn Bền Vĩnh Cửu Đường Kính 30cm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           161000, 
           41, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Bát Đĩa Sứ Men Hỏa Biến Bát Tràng 16 Món Cao Cấp Sang Trọng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Bát Đĩa Sứ Men Hỏa Biến Bát Tràng 16 Món Cao Cấp Sang Trọng', 
           N'Sản phẩm Bộ Bát Đĩa Sứ Men Hỏa Biến Bát Tràng 16 Món Cao Cấp Sang Trọng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           198000, 
           48, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Hộp Đựng Thức Ăn Thủy Tinh Chịu Nhiệt Lò Vi Sóng Nắp Khóa Chặt')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Hộp Đựng Thức Ăn Thủy Tinh Chịu Nhiệt Lò Vi Sóng Nắp Khóa Chặt', 
           N'Sản phẩm Hộp Đựng Thức Ăn Thủy Tinh Chịu Nhiệt Lò Vi Sóng Nắp Khóa Chặt chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           235000, 
           55, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kéo Cắt Gà Cắt Xương Đa Năng Lưỡi Răng Cưa Cực Khỏe Inox')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kéo Cắt Gà Cắt Xương Đa Năng Lưỡi Răng Cưa Cực Khỏe Inox', 
           N'Sản phẩm Kéo Cắt Gà Cắt Xương Đa Năng Lưỡi Răng Cưa Cực Khỏe Inox chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           272000, 
           62, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cây Đánh Trứng Cầm Tay Lò Xo Bằng Inox Không Gỉ Bền Chắc')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cây Đánh Trứng Cầm Tay Lò Xo Bằng Inox Không Gỉ Bền Chắc', 
           N'Sản phẩm Cây Đánh Trứng Cầm Tay Lò Xo Bằng Inox Không Gỉ Bền Chắc chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           309000, 
           69, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Kẹp Gắp Thức Ăn Đồ Nướng Silicon Chịu Nhiệt Chống Trầy Chảo')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Kẹp Gắp Thức Ăn Đồ Nướng Silicon Chịu Nhiệt Chống Trầy Chảo', 
           N'Sản phẩm Kẹp Gắp Thức Ăn Đồ Nướng Silicon Chịu Nhiệt Chống Trầy Chảo chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           346000, 
           76, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Dụng Cụ Gọt Vỏ Củ Quả Lưỡi Gốm Sứ Siêu Sắc Không Bị Thâm')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Dụng Cụ Gọt Vỏ Củ Quả Lưỡi Gốm Sứ Siêu Sắc Không Bị Thâm', 
           N'Sản phẩm Dụng Cụ Gọt Vỏ Củ Quả Lưỡi Gốm Sứ Siêu Sắc Không Bị Thâm chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           383000, 
           83, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khay Đựng Gia Vị Xoay 360 Độ Bằng Nhựa Trong Suốt Tiện Lợi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khay Đựng Gia Vị Xoay 360 Độ Bằng Nhựa Trong Suốt Tiện Lợi', 
           N'Sản phẩm Khay Đựng Gia Vị Xoay 360 Độ Bằng Nhựa Trong Suốt Tiện Lợi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           420000, 
           90, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Rổ Rửa Rau Kèm Chậu Ráo Nước Xoay Nghiêng Không Rơi Rau')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Rổ Rửa Rau Kèm Chậu Ráo Nước Xoay Nghiêng Không Rơi Rau', 
           N'Sản phẩm Rổ Rửa Rau Kèm Chậu Ráo Nước Xoay Nghiêng Không Rơi Rau chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           457000, 
           97, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bình Rót Dầu Ăn Thủy Tinh Tự Động Mở Nắp Khi Rót Không Rỉ Dầu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bình Rót Dầu Ăn Thủy Tinh Tự Động Mở Nắp Khi Rót Không Rỉ Dầu', 
           N'Sản phẩm Bình Rót Dầu Ăn Thủy Tinh Tự Động Mở Nắp Khi Rót Không Rỉ Dầu chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           494000, 
           104, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đũa Ăn Cơm Gỗ Mun Khảm Ốc Cao Cấp Không Ẩm Mốc Set 10 Đôi')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đũa Ăn Cơm Gỗ Mun Khảm Ốc Cao Cấp Không Ẩm Mốc Set 10 Đôi', 
           N'Sản phẩm Bộ Đũa Ăn Cơm Gỗ Mun Khảm Ốc Cao Cấp Không Ẩm Mốc Set 10 Đôi chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           531000, 
           111, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Thìa Muỗng Inox 304 Dày Dặn Cán Dài Ăn Cơm Canh Set 6')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Thìa Muỗng Inox 304 Dày Dặn Cán Dài Ăn Cơm Canh Set 6', 
           N'Sản phẩm Thìa Muỗng Inox 304 Dày Dặn Cán Dài Ăn Cơm Canh Set 6 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           568000, 
           118, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Ống Đựng Đũa Thìa Có Khay Thoát Nước Nắp Đậy Chống Côn Trùng')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Ống Đựng Đũa Thìa Có Khay Thoát Nước Nắp Đậy Chống Côn Trùng', 
           N'Sản phẩm Ống Đựng Đũa Thìa Có Khay Thoát Nước Nắp Đậy Chống Côn Trùng chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           605000, 
           125, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Cân Tiểu Ly Điện Tử Nhà Bếp Đo Định Lượng Làm Bánh Chính Xác 0.1g')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Cân Tiểu Ly Điện Tử Nhà Bếp Đo Định Lượng Làm Bánh Chính Xác 0.1g', 
           N'Sản phẩm Cân Tiểu Ly Điện Tử Nhà Bếp Đo Định Lượng Làm Bánh Chính Xác 0.1g chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           642000, 
           132, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bao Tay Nhấc Nồi Chống Nóng Silicon Dày Chịu Nhiệt Độ Cao')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bao Tay Nhấc Nồi Chống Nóng Silicon Dày Chịu Nhiệt Độ Cao', 
           N'Sản phẩm Bao Tay Nhấc Nồi Chống Nóng Silicon Dày Chịu Nhiệt Độ Cao chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           679000, 
           139, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Khăn Lau Bếp Đa Năng Thấm Hút Dầu Mỡ Không Bám Bẩn Set 5')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Khăn Lau Bếp Đa Năng Thấm Hút Dầu Mỡ Không Bám Bẩn Set 5', 
           N'Sản phẩm Khăn Lau Bếp Đa Năng Thấm Hút Dầu Mỡ Không Bám Bẩn Set 5 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           716000, 
           146, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Miếng Rửa Chén Bọt Biển Tạo Bọt Dày Dặn Kháng Khuẩn Set 10')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Miếng Rửa Chén Bọt Biển Tạo Bọt Dày Dặn Kháng Khuẩn Set 10', 
           N'Sản phẩm Miếng Rửa Chén Bọt Biển Tạo Bọt Dày Dặn Kháng Khuẩn Set 10 chính hãng chất lượng cao, độ bền vượt trội, bảo hành uy tín.', 
           753000, 
           153, 
           N'/images/NhaCua04.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bếp Củi Nhôm Dã Ngoại Xưa Cũ Đã Hỏng Đáy')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bếp Củi Nhôm Dã Ngoại Xưa Cũ Đã Hỏng Đáy', 
           N'Sản phẩm Bếp Củi Nhôm Dã Ngoại Xưa Cũ Đã Hỏng Đáy tạm thời hết hàng trong kho.', 
           790000, 
           0, 
           N'/images/NhaCua01.webp', 
           dm.MaDanhMuc, 
           N'Hết hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Nồi Đồng Đúc Thủ Công Bị Nứt Vỡ Để Làm Cảnh')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Nồi Đồng Đúc Thủ Công Bị Nứt Vỡ Để Làm Cảnh', 
           N'Sản phẩm Bộ Nồi Đồng Đúc Thủ Công Bị Nứt Vỡ Để Làm Cảnh đã dừng kinh doanh do mẫu cũ.', 
           827000, 
           5, 
           N'/images/NhaCua02.webp', 
           dm.MaDanhMuc, 
           N'Dừng bán'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO
IF NOT EXISTS (SELECT 1 FROM SanPham WHERE TenSanPham = N'Bộ Đồ Ăn Hoàng Gia Gốm Sứ Xương Dát Vàng 24K Xuất Khẩu Châu Âu')
BEGIN
    INSERT INTO SanPham (TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
    SELECT N'Bộ Đồ Ăn Hoàng Gia Gốm Sứ Xương Dát Vàng 24K Xuất Khẩu Châu Âu', 
           N'Phiên bản cao cấp thượng hạng độc bản dành cho người sành điệu: Bộ Đồ Ăn Hoàng Gia Gốm Sứ Xương Dát Vàng 24K Xuất Khẩu Châu Âu.', 
           25000000, 
           3, 
           N'/images/NhaCua03.webp', 
           dm.MaDanhMuc, 
           N'Còn hàng'
    FROM DanhMuc dm
    WHERE dm.TenDanhMuc = N'Dụng Cụ Nhà Bếp & Bàn Ăn';
END
GO

ENABLE TRIGGER trg_UpdateTrangThaiSanPham ON SanPham;
GO

-- ==============================================================================
-- 3. NẠP NGƯỜI DÙNG (NGUOIDUNG) - 1 Admin + 119 Users
-- ==============================================================================
PRINT N'3. Đang nạp người dùng...';
GO

IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'Admin')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'Admin', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Quản Trị Viên Hệ Thống', N'Tòa nhà Landmark 81, Phường 22, Quận Bình Thạnh, TP. Hồ Chí Minh', N'0988000000', N'admin@shopeeclone.vn', N'Admin', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'Admin',
        TrangThai = 1
    WHERE TenDangNhap = N'Admin';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user01')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user01', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thị Dung', N'Số 17, Đường Lê Lợi, TP. Hồ Chí Minh', N'090100001', N'user01@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user01';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user02')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user02', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Minh Hòa', N'Số 24, Đường Trần Hưng Đạo, Đà Nẵng', N'090100002', N'user02@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user02';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user03')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user03', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Hoàng Mai', N'Số 31, Đường Hai Bà Trưng, Hải Phòng', N'090100003', N'user03@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user03';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user04')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user04', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Đức Phúc', N'Số 38, Đường Giải Phóng, Cần Thơ', N'090100004', N'user04@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user04';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user05')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user05', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Thu Thảo', N'Số 45, Đường Cầu Giấy, Huế', N'090100005', N'user05@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user05';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user06')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user06', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Thanh Xuân', N'Số 52, Đường Võ Văn Kiệt, Nha Trang', N'090100006', N'user06@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user06';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user07')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user07', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Hải Bình', N'Số 59, Đường Nguyễn Huệ, Bình Dương', N'090100007', N'user07@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user07';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user08')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user08', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Quốc Em', N'Số 66, Đường Lê Lợi, Đồng Nai', N'090100008', N'user08@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user08';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user09')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user09', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Anh Linh', N'Số 73, Đường Trần Hưng Đạo, Vũng Tàu', N'090100009', N'user09@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user09';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user10')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user10', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Ngọc Nam', N'Số 80, Đường Hai Bà Trưng, Bắc Ninh', N'090100010', N'user10@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user10';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user11')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user11', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Gia Quang', N'Số 87, Đường Giải Phóng, Quảng Ninh', N'090100011', N'user11@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user11';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user12')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user12', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Văn Uyên', N'Số 94, Đường Cầu Giấy, Nam Định', N'090100012', N'user12@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user12';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user13')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user13', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Thị Yến', N'Số 101, Đường Võ Văn Kiệt, Thái Nguyên', N'090100013', N'user13@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user13';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user14')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user14', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Minh Cường', N'Số 108, Đường Nguyễn Huệ, Thanh Hóa', N'090100014', N'user14@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user14';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user15')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user15', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Hoàng Hạnh', N'Số 115, Đường Lê Lợi, Nghệ An', N'090100015', N'user15@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user15';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user16')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user16', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Đức Khoa', N'Số 122, Đường Trần Hưng Đạo, Hà Nội', N'090100016', N'user16@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user16';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user17')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user17', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thu Oanh', N'Số 129, Đường Hai Bà Trưng, TP. Hồ Chí Minh', N'090100017', N'user17@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user17';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user18')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user18', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Thanh Sơn', N'Số 136, Đường Giải Phóng, Đà Nẵng', N'090100018', N'user18@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user18';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user19')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user19', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Hải Việt', N'Số 143, Đường Cầu Giấy, Hải Phòng', N'090100019', N'user19@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user19';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user20')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user20', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Quốc An', N'Số 150, Đường Võ Văn Kiệt, Cần Thơ', N'090100020', N'user20@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user20';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user21')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user21', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Anh Dung', N'Số 157, Đường Nguyễn Huệ, Huế', N'090100021', N'user21@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user21';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user22')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user22', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Ngọc Hòa', N'Số 164, Đường Lê Lợi, Nha Trang', N'090100022', N'user22@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user22';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user23')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user23', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Gia Mai', N'Số 171, Đường Trần Hưng Đạo, Bình Dương', N'090100023', N'user23@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user23';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user24')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user24', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Văn Phúc', N'Số 178, Đường Hai Bà Trưng, Đồng Nai', N'090100024', N'user24@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user24';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user25')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user25', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Thị Thảo', N'Số 185, Đường Giải Phóng, Vũng Tàu', N'090100025', N'user25@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user25';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user26')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user26', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Minh Xuân', N'Số 192, Đường Cầu Giấy, Bắc Ninh', N'090100026', N'user26@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user26';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user27')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user27', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Hoàng Bình', N'Số 199, Đường Võ Văn Kiệt, Quảng Ninh', N'090100027', N'user27@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user27';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user28')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user28', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Đức Em', N'Số 16, Đường Nguyễn Huệ, Nam Định', N'090100028', N'user28@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user28';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user29')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user29', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Thu Linh', N'Số 23, Đường Lê Lợi, Thái Nguyên', N'090100029', N'user29@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user29';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user30')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user30', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Thanh Nam', N'Số 30, Đường Trần Hưng Đạo, Thanh Hóa', N'090100030', N'user30@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user30';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user31')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user31', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Hải Quang', N'Số 37, Đường Hai Bà Trưng, Nghệ An', N'090100031', N'user31@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user31';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user32')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user32', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Quốc Uyên', N'Số 44, Đường Giải Phóng, Hà Nội', N'090100032', N'user32@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user32';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user33')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user33', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Anh Yến', N'Số 51, Đường Cầu Giấy, TP. Hồ Chí Minh', N'090100033', N'user33@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user33';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user34')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user34', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Ngọc Cường', N'Số 58, Đường Võ Văn Kiệt, Đà Nẵng', N'090100034', N'user34@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user34';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user35')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user35', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Gia Hạnh', N'Số 65, Đường Nguyễn Huệ, Hải Phòng', N'090100035', N'user35@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user35';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user36')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user36', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Văn Khoa', N'Số 72, Đường Lê Lợi, Cần Thơ', N'090100036', N'user36@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user36';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user37')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user37', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Thị Oanh', N'Số 79, Đường Trần Hưng Đạo, Huế', N'090100037', N'user37@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user37';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user38')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user38', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Minh Sơn', N'Số 86, Đường Hai Bà Trưng, Nha Trang', N'090100038', N'user38@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user38';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user39')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user39', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Hoàng Việt', N'Số 93, Đường Giải Phóng, Bình Dương', N'090100039', N'user39@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user39';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user40')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user40', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Đức An', N'Số 100, Đường Cầu Giấy, Đồng Nai', N'090100040', N'user40@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user40';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user41')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user41', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Thu Dung', N'Số 107, Đường Võ Văn Kiệt, Vũng Tàu', N'090100041', N'user41@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user41';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user42')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user42', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Thanh Hòa', N'Số 114, Đường Nguyễn Huệ, Bắc Ninh', N'090100042', N'user42@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user42';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user43')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user43', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Hải Mai', N'Số 121, Đường Lê Lợi, Quảng Ninh', N'090100043', N'user43@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user43';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user44')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user44', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Quốc Phúc', N'Số 128, Đường Trần Hưng Đạo, Nam Định', N'090100044', N'user44@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user44';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user45')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user45', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Anh Thảo', N'Số 135, Đường Hai Bà Trưng, Thái Nguyên', N'090100045', N'user45@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user45';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user46')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user46', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Ngọc Xuân', N'Số 142, Đường Giải Phóng, Thanh Hóa', N'090100046', N'user46@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user46';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user47')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user47', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Gia Bình', N'Số 149, Đường Cầu Giấy, Nghệ An', N'090100047', N'user47@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user47';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user48')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user48', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Văn Em', N'Số 156, Đường Võ Văn Kiệt, Hà Nội', N'090100048', N'user48@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user48';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user49')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user49', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thị Linh', N'Số 163, Đường Nguyễn Huệ, TP. Hồ Chí Minh', N'090100049', N'user49@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user49';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user50')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user50', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Minh Nam', N'Số 170, Đường Lê Lợi, Đà Nẵng', N'090100050', N'user50@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user50';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user51')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user51', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Hoàng Quang', N'Số 177, Đường Trần Hưng Đạo, Hải Phòng', N'090100051', N'user51@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user51';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user52')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user52', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Đức Uyên', N'Số 184, Đường Hai Bà Trưng, Cần Thơ', N'090100052', N'user52@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user52';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user53')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user53', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Thu Yến', N'Số 191, Đường Giải Phóng, Huế', N'090100053', N'user53@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user53';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user54')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user54', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Thanh Cường', N'Số 198, Đường Cầu Giấy, Nha Trang', N'090100054', N'user54@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user54';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user55')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user55', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Hải Hạnh', N'Số 15, Đường Võ Văn Kiệt, Bình Dương', N'090100055', N'user55@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user55';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user56')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user56', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Quốc Khoa', N'Số 22, Đường Nguyễn Huệ, Đồng Nai', N'090100056', N'user56@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user56';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user57')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user57', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Anh Oanh', N'Số 29, Đường Lê Lợi, Vũng Tàu', N'090100057', N'user57@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user57';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user58')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user58', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Ngọc Sơn', N'Số 36, Đường Trần Hưng Đạo, Bắc Ninh', N'090100058', N'user58@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user58';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user59')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user59', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Gia Việt', N'Số 43, Đường Hai Bà Trưng, Quảng Ninh', N'090100059', N'user59@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user59';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user60')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user60', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Văn An', N'Số 50, Đường Giải Phóng, Nam Định', N'090100060', N'user60@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user60';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user61')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user61', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Thị Dung', N'Số 57, Đường Cầu Giấy, Thái Nguyên', N'090100061', N'user61@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user61';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user62')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user62', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Minh Hòa', N'Số 64, Đường Võ Văn Kiệt, Thanh Hóa', N'090100062', N'user62@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user62';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user63')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user63', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Hoàng Mai', N'Số 71, Đường Nguyễn Huệ, Nghệ An', N'090100063', N'user63@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user63';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user64')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user64', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Đức Phúc', N'Số 78, Đường Lê Lợi, Hà Nội', N'090100064', N'user64@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user64';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user65')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user65', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thu Thảo', N'Số 85, Đường Trần Hưng Đạo, TP. Hồ Chí Minh', N'090100065', N'user65@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user65';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user66')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user66', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Thanh Xuân', N'Số 92, Đường Hai Bà Trưng, Đà Nẵng', N'090100066', N'user66@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user66';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user67')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user67', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Hải Bình', N'Số 99, Đường Giải Phóng, Hải Phòng', N'090100067', N'user67@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user67';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user68')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user68', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Quốc Em', N'Số 106, Đường Cầu Giấy, Cần Thơ', N'090100068', N'user68@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user68';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user69')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user69', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Anh Linh', N'Số 113, Đường Võ Văn Kiệt, Huế', N'090100069', N'user69@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user69';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user70')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user70', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Ngọc Nam', N'Số 120, Đường Nguyễn Huệ, Nha Trang', N'090100070', N'user70@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user70';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user71')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user71', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Gia Quang', N'Số 127, Đường Lê Lợi, Bình Dương', N'090100071', N'user71@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user71';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user72')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user72', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Văn Uyên', N'Số 134, Đường Trần Hưng Đạo, Đồng Nai', N'090100072', N'user72@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user72';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user73')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user73', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Thị Yến', N'Số 141, Đường Hai Bà Trưng, Vũng Tàu', N'090100073', N'user73@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user73';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user74')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user74', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Minh Cường', N'Số 148, Đường Giải Phóng, Bắc Ninh', N'090100074', N'user74@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user74';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user75')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user75', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Hoàng Hạnh', N'Số 155, Đường Cầu Giấy, Quảng Ninh', N'090100075', N'user75@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user75';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user76')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user76', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Đức Khoa', N'Số 162, Đường Võ Văn Kiệt, Nam Định', N'090100076', N'user76@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user76';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user77')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user77', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Thu Oanh', N'Số 169, Đường Nguyễn Huệ, Thái Nguyên', N'090100077', N'user77@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user77';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user78')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user78', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Thanh Sơn', N'Số 176, Đường Lê Lợi, Thanh Hóa', N'090100078', N'user78@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user78';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user79')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user79', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Hải Việt', N'Số 183, Đường Trần Hưng Đạo, Nghệ An', N'090100079', N'user79@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user79';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user80')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user80', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Quốc An', N'Số 190, Đường Hai Bà Trưng, Hà Nội', N'090100080', N'user80@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user80';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user81')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user81', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Anh Dung', N'Số 197, Đường Giải Phóng, TP. Hồ Chí Minh', N'090100081', N'user81@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user81';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user82')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user82', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Ngọc Hòa', N'Số 14, Đường Cầu Giấy, Đà Nẵng', N'090100082', N'user82@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user82';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user83')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user83', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Gia Mai', N'Số 21, Đường Võ Văn Kiệt, Hải Phòng', N'090100083', N'user83@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user83';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user84')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user84', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Văn Phúc', N'Số 28, Đường Nguyễn Huệ, Cần Thơ', N'090100084', N'user84@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user84';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user85')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user85', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Thị Thảo', N'Số 35, Đường Lê Lợi, Huế', N'090100085', N'user85@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user85';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user86')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user86', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Minh Xuân', N'Số 42, Đường Trần Hưng Đạo, Nha Trang', N'090100086', N'user86@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user86';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user87')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user87', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Hoàng Bình', N'Số 49, Đường Hai Bà Trưng, Bình Dương', N'090100087', N'user87@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user87';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user88')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user88', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Đức Em', N'Số 56, Đường Giải Phóng, Đồng Nai', N'090100088', N'user88@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user88';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user89')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user89', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Thu Linh', N'Số 63, Đường Cầu Giấy, Vũng Tàu', N'090100089', N'user89@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user89';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user90')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user90', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Thanh Nam', N'Số 70, Đường Võ Văn Kiệt, Bắc Ninh', N'090100090', N'user90@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user90';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user91')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user91', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Hải Quang', N'Số 77, Đường Nguyễn Huệ, Quảng Ninh', N'090100091', N'user91@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user91';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user92')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user92', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Quốc Uyên', N'Số 84, Đường Lê Lợi, Nam Định', N'090100092', N'user92@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user92';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user93')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user93', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Anh Yến', N'Số 91, Đường Trần Hưng Đạo, Thái Nguyên', N'090100093', N'user93@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user93';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user94')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user94', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Ngọc Cường', N'Số 98, Đường Hai Bà Trưng, Thanh Hóa', N'090100094', N'user94@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user94';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user95')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user95', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Gia Hạnh', N'Số 105, Đường Giải Phóng, Nghệ An', N'090100095', N'user95@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user95';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user96')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user96', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Văn Khoa', N'Số 112, Đường Cầu Giấy, Hà Nội', N'090100096', N'user96@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user96';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user97')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user97', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thị Oanh', N'Số 119, Đường Võ Văn Kiệt, TP. Hồ Chí Minh', N'090100097', N'user97@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user97';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user98')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user98', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Minh Sơn', N'Số 126, Đường Nguyễn Huệ, Đà Nẵng', N'090100098', N'user98@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user98';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user99')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user99', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Hoàng Việt', N'Số 133, Đường Lê Lợi, Hải Phòng', N'090100099', N'user99@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user99';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user100')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user100', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Đức An', N'Số 140, Đường Trần Hưng Đạo, Cần Thơ', N'090100100', N'user100@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user100';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user101')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user101', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Thu Dung', N'Số 147, Đường Hai Bà Trưng, Huế', N'090100101', N'user101@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user101';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user102')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user102', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Thanh Hòa', N'Số 154, Đường Giải Phóng, Nha Trang', N'090100102', N'user102@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user102';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user103')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user103', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Hải Mai', N'Số 161, Đường Cầu Giấy, Bình Dương', N'090100103', N'user103@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user103';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user104')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user104', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Võ Quốc Phúc', N'Số 168, Đường Võ Văn Kiệt, Đồng Nai', N'090100104', N'user104@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user104';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user105')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user105', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Anh Thảo', N'Số 175, Đường Nguyễn Huệ, Vũng Tàu', N'090100105', N'user105@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user105';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user106')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user106', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Ngọc Xuân', N'Số 182, Đường Lê Lợi, Bắc Ninh', N'090100106', N'user106@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user106';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user107')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user107', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Gia Bình', N'Số 189, Đường Trần Hưng Đạo, Quảng Ninh', N'090100107', N'user107@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user107';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user108')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user108', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hồ Văn Em', N'Số 196, Đường Hai Bà Trưng, Nam Định', N'090100108', N'user108@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user108';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user109')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user109', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Thị Linh', N'Số 13, Đường Giải Phóng, Thái Nguyên', N'090100109', N'user109@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user109';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user110')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user110', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Dương Minh Nam', N'Số 20, Đường Cầu Giấy, Thanh Hóa', N'090100110', N'user110@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user110';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user111')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user111', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lý Hoàng Quang', N'Số 27, Đường Võ Văn Kiệt, Nghệ An', N'090100111', N'user111@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user111';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user112')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user112', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Đức Uyên', N'Số 34, Đường Nguyễn Huệ, Hà Nội', N'090100112', N'user112@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user112';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user113')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user113', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thu Yến', N'Số 41, Đường Lê Lợi, TP. Hồ Chí Minh', N'090100113', N'user113@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user113';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user114')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user114', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Thanh Cường', N'Số 48, Đường Trần Hưng Đạo, Đà Nẵng', N'090100114', N'user114@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user114';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user115')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user115', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Hải Hạnh', N'Số 55, Đường Hai Bà Trưng, Hải Phòng', N'090100115', N'user115@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user115';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user116')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user116', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Quốc Khoa', N'Số 62, Đường Giải Phóng, Cần Thơ', N'090100116', N'user116@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user116';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user117')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user117', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Huỳnh Anh Oanh', N'Số 69, Đường Cầu Giấy, Huế', N'090100117', N'user117@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user117';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user118')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user118', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phan Ngọc Sơn', N'Số 76, Đường Võ Văn Kiệt, Nha Trang', N'090100118', N'user118@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user118';
END
GO
IF NOT EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = N'user119')
BEGIN
    INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro, TrangThai)
    VALUES (N'user119', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Gia Việt', N'Số 83, Đường Nguyễn Huệ, Bình Dương', N'090100119', N'user119@shopeeclone.vn', N'User', 1);
END
ELSE
BEGIN
    UPDATE NguoiDung
    SET MatKhau = N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        VaiTro = N'User',
        TrangThai = 1
    WHERE TenDangNhap = N'user119';
END
GO

-- ==============================================================================
-- 4. NẠP GIỎ HÀNG (GIOHANG) & CHI TIẾT GIỎ HÀNG (CHITIETGIOHANG)
-- ==============================================================================
PRINT N'4. Đang nạp giỏ hàng và chi tiết giỏ hàng...';
GO

-- Tạo giỏ hàng cho tất cả người dùng chưa có giỏ
INSERT INTO GioHang (MaNguoiDung, NgayTao)
SELECT u.MaNguoiDung, GETDATE()
FROM NguoiDung u
WHERE NOT EXISTS (SELECT 1 FROM GioHang g WHERE g.MaNguoiDung = u.MaNguoiDung);
GO

-- Thêm sản phẩm vào giỏ hàng cho các user mẫu (User 1 đến User 50)
DECLARE @MaGH INT, @MaSP INT;

DECLARE curGH CURSOR FOR
SELECT g.MaGioHang, u.MaNguoiDung
FROM GioHang g
JOIN NguoiDung u ON g.MaNguoiDung = u.MaNguoiDung
WHERE u.VaiTro = N'User' AND u.MaNguoiDung <= 50;

OPEN curGH;
DECLARE @ghId INT, @uId INT;
FETCH NEXT FROM curGH INTO @ghId, @uId;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Thêm 2-3 sản phẩm ngẫu nhiên còn hàng vào giỏ
    INSERT INTO ChiTietGioHang (MaGioHang, MaSanPham, SoLuong)
    SELECT @ghId, s.MaSanPham, ((@uId % 3) + 1)
    FROM (
        SELECT TOP 3 MaSanPham
        FROM SanPham
        WHERE TrangThai = N'Còn hàng'
        ORDER BY ABS(CHECKSUM(HASHBYTES('MD5', CONCAT(@uId, '-', MaSanPham))))
    ) s
    WHERE NOT EXISTS (
        SELECT 1 FROM ChiTietGioHang ct WHERE ct.MaGioHang = @ghId AND ct.MaSanPham = s.MaSanPham
    );

    FETCH NEXT FROM curGH INTO @ghId, @uId;
END

CLOSE curGH;
DEALLOCATE curGH;
GO

-- ==============================================================================
-- 5. NẠP ĐƠN HÀNG (DONHANG) & CHI TIẾT ĐƠN HÀNG (CHITIETDONHANG)
-- ==============================================================================
PRINT N'5. Đang nạp đơn hàng và chi tiết đơn hàng...';
GO

-- Tạm thời vô hiệu hóa triggers kiểm tra tồn kho và trừ kho khi nạp đơn hàng lịch sử
DISABLE TRIGGER trg_CheckSoLuong ON ChiTietDonHang;
DISABLE TRIGGER trg_TruKho ON ChiTietDonHang;
DISABLE TRIGGER trg_TinhTongTien ON ChiTietDonHang;
GO

-- 5.1. Khắc phục các đơn hàng cũ (nếu có MaDonHang <= 5 thiếu chi tiết)
IF EXISTS (SELECT 1 FROM DonHang WHERE TongTien = 0 OR NOT EXISTS (SELECT 1 FROM ChiTietDonHang WHERE MaDonHang = DonHang.MaDonHang))
BEGIN
    DECLARE @dhFixId INT;
    DECLARE curFix CURSOR FOR
    SELECT MaDonHang FROM DonHang WHERE NOT EXISTS (SELECT 1 FROM ChiTietDonHang WHERE MaDonHang = DonHang.MaDonHang);
    
    OPEN curFix;
    FETCH NEXT FROM curFix INTO @dhFixId;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO ChiTietDonHang (MaDonHang, MaSanPham, SoLuong, DonGia)
        SELECT TOP 2 @dhFixId, sp.MaSanPham, 1, sp.Gia
        FROM SanPham sp
        WHERE sp.TrangThai = N'Còn hàng'
        ORDER BY sp.MaSanPham;

        FETCH NEXT FROM curFix INTO @dhFixId;
    END
    CLOSE curFix;
    DEALLOCATE curFix;
END
GO

-- 5.2. Nạp thêm đơn hàng nếu tổng đơn hàng hiện tại chưa đạt 300
IF (SELECT COUNT(*) FROM DonHang) < 320
BEGIN
    PRINT N'Đang nạp 320 đơn hàng mẫu...';

    DECLARE @i INT = 1;
    DECLARE @MaxOrders INT = 320;
    DECLARE @OrderUser INT;
    DECLARE @OrderDate DATETIME;
    DECLARE @OrderStatus NVARCHAR(50);
    DECLARE @NewOrderId INT;

    WHILE @i <= @MaxOrders
    BEGIN
        -- Chọn User
        SELECT TOP 1 @OrderUser = MaNguoiDung 
        FROM NguoiDung 
        WHERE VaiTro = N'User' 
        ORDER BY ABS(CHECKSUM(HASHBYTES('MD5', CONCAT(@i, '-', MaNguoiDung))));

        -- Chọn Ngày
        SET @OrderDate = DATEADD(MINUTE, -((@i * 350) % 129600), GETDATE());

        -- Chọn Trạng thái
        SET @OrderStatus = CASE (@i % 10)
            WHEN 0 THEN N'Hoàn thành'
            WHEN 1 THEN N'Hoàn thành'
            WHEN 2 THEN N'Hoàn thành'
            WHEN 3 THEN N'Hoàn thành'
            WHEN 4 THEN N'Hoàn thành'
            WHEN 5 THEN N'Đang giao'
            WHEN 6 THEN N'Đang giao'
            WHEN 7 THEN N'Đã duyệt'
            WHEN 8 THEN N'Chờ xử lý'
            ELSE N'Đã hủy'
        END;

        -- Tạo đơn hàng
        INSERT INTO DonHang (MaNguoiDung, NgayDat, TongTien, TrangThai)
        VALUES (@OrderUser, @OrderDate, 0, @OrderStatus);

        SET @NewOrderId = SCOPE_IDENTITY();

        -- Nạp chi tiết đơn hàng (1 đến 4 sản phẩm)
        DECLARE @ItemCount INT = (@i % 4) + 1;

        INSERT INTO ChiTietDonHang (MaDonHang, MaSanPham, SoLuong, DonGia)
        SELECT TOP (@ItemCount) 
               @NewOrderId, 
               sp.MaSanPham, 
               ((@i + sp.MaSanPham) % 3) + 1, 
               sp.Gia
        FROM SanPham sp
        ORDER BY ABS(CHECKSUM(HASHBYTES('MD5', CONCAT(@i, '-', sp.MaSanPham))));

        SET @i = @i + 1;
    END
END
GO

-- 5.3. Cập nhật lại chính xác TongTien = SUM(SoLuong * DonGia) cho TẤT CẢ đơn hàng
PRINT N'Cập nhật lại TongTien cho tất cả đơn hàng...';
UPDATE dh
SET TongTien = ISNULL(sub.TongTienTinh, 0)
FROM DonHang dh
OUTER APPLY (
    SELECT SUM(ct.SoLuong * ct.DonGia) AS TongTienTinh
    FROM ChiTietDonHang ct
    WHERE ct.MaDonHang = dh.MaDonHang
) sub;
GO

-- Kích hoạt lại toàn bộ triggers
ENABLE TRIGGER trg_CheckSoLuong ON ChiTietDonHang;
ENABLE TRIGGER trg_TruKho ON ChiTietDonHang;
ENABLE TRIGGER trg_TinhTongTien ON ChiTietDonHang;
GO

PRINT N'>>> HOÀN TẤT NẠP SEED DATA THÀNH CÔNG!';
GO
