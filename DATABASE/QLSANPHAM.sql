-- =============================================
-- TẠO CƠ SỞ DỮ LIỆU QLSANPHAM
-- =============================================

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QLSANPHAM')
BEGIN
    CREATE DATABASE QLSANPHAM;
END
GO

USE QLSANPHAM;
GO

-- =============================================
-- NGƯỜI DÙNG
-- =============================================

CREATE TABLE NguoiDung (
    MaNguoiDung INT IDENTITY PRIMARY KEY,
    TenDangNhap NVARCHAR(50) UNIQUE NOT NULL,
    MatKhau NVARCHAR(255) NOT NULL,
    HoTen NVARCHAR(100),
	DiaChi NVARCHAR(255) NOT NULL DEFAULT N'',
    SoDienThoai NVARCHAR(20) NOT NULL DEFAULT N'',
    Email NVARCHAR(100),
    VaiTro NVARCHAR(20) DEFAULT N'User',
    NgayTao DATETIME DEFAULT GETDATE(),
    TrangThai BIT DEFAULT 1
);
GO

-- select * from NguoiDung
-- =============================================
-- DANH MỤC
-- =============================================

CREATE TABLE DanhMuc (
    MaDanhMuc INT IDENTITY PRIMARY KEY,
    TenDanhMuc NVARCHAR(100) NOT NULL,
	HinhAnh NVARCHAR(255)
);
GO

-- =============================================
-- SẢN PHẨM 
-- =============================================

CREATE TABLE SanPham (
    MaSanPham INT IDENTITY PRIMARY KEY,
    TenSanPham NVARCHAR(200) NOT NULL,
    MoTa NVARCHAR(MAX),
    Gia DECIMAL(18,2) NOT NULL CHECK (Gia >= 0),
    SoLuongTon INT DEFAULT 0 CHECK (SoLuongTon >= 0),
    HinhAnh NVARCHAR(255),
    MaDanhMuc INT,
    NgayTao DATETIME DEFAULT GETDATE(),
    TrangThai NVARCHAR(50) NOT NULL DEFAULT N'Còn hàng',

    CONSTRAINT CK_TrangThaiSanPham 
        CHECK (TrangThai IN (N'Còn hàng', N'Hết hàng', N'Dừng bán')),

    CONSTRAINT FK_SanPham_DanhMuc 
        FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc)
);
GO

-- =============================================
-- GIỎ HÀNG
-- =============================================

CREATE TABLE GioHang (
    MaGioHang INT IDENTITY PRIMARY KEY,
    MaNguoiDung INT UNIQUE, -- mỗi user 1 giỏ
    NgayTao DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_GioHang_NguoiDung 
        FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);
GO

-- =============================================
-- CHI TIẾT GIỎ HÀNG
-- =============================================

CREATE TABLE ChiTietGioHang (
    MaCTGioHang INT IDENTITY PRIMARY KEY,
    MaGioHang INT,
    MaSanPham INT,
    SoLuong INT DEFAULT 1 CHECK (SoLuong > 0),

    CONSTRAINT UQ_GioHang_SanPham UNIQUE (MaGioHang, MaSanPham),

    CONSTRAINT FK_CTGH_GioHang 
        FOREIGN KEY (MaGioHang) REFERENCES GioHang(MaGioHang),

    CONSTRAINT FK_CTGH_SanPham 
        FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);
GO

-- =============================================
-- ĐƠN HÀNG
-- =============================================

CREATE TABLE DonHang (
    MaDonHang INT IDENTITY PRIMARY KEY,
    MaNguoiDung INT,
    NgayDat DATETIME DEFAULT GETDATE(),
    TongTien DECIMAL(18,2) DEFAULT 0,

    TrangThai NVARCHAR(50) DEFAULT N'Chờ xử lý',

    CONSTRAINT FK_DonHang_NguoiDung 
        FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);
GO

-- =============================================
-- CHI TIẾT ĐƠN HÀNG
-- =============================================

CREATE TABLE ChiTietDonHang (
    MaCTDonHang INT IDENTITY PRIMARY KEY,
    MaDonHang INT,
    MaSanPham INT,
    SoLuong INT CHECK (SoLuong > 0),
    DonGia DECIMAL(18,2) CHECK (DonGia >= 0),

    CONSTRAINT FK_CTDH_DonHang 
        FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),

    CONSTRAINT FK_CTDH_SanPham 
        FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);
GO


-- =============================================
-- 1. AUTHENTICATION
-- =============================================

CREATE OR ALTER PROC sp_DangKy
    @TenDangNhap NVARCHAR(50),
    @MatKhau NVARCHAR(255),
    @HoTen NVARCHAR(100),
    @Email NVARCHAR(100),
    @DiaChi NVARCHAR(255),
    @SoDienThoai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Kiểm tra username
    IF EXISTS (SELECT 1 FROM NguoiDung WHERE TenDangNhap = @TenDangNhap)
    BEGIN
        RAISERROR(N'Tên đăng nhập đã tồn tại',16,1)
        RETURN
    END

    -- 2. Kiểm tra email
    IF EXISTS (SELECT 1 FROM NguoiDung WHERE Email = @Email)
    BEGIN
        RAISERROR(N'Email đã tồn tại',16,1)
        RETURN
    END

    -- 3. Kiểm tra số điện thoại
    IF EXISTS (SELECT 1 FROM NguoiDung WHERE SoDienThoai = @SoDienThoai)
    BEGIN
        RAISERROR(N'Số điện thoại đã tồn tại',16,1)
        RETURN
    END

    -- 4. Validate mật khẩu
    IF LEN(@MatKhau) < 6
    BEGIN
        RAISERROR(N'Mật khẩu phải >= 6 ký tự',16,1)
        RETURN
    END

    -- 5. Validate số điện thoại
    IF @SoDienThoai NOT LIKE '[0-9]%'
       OR LEN(@SoDienThoai) < 9
       OR LEN(@SoDienThoai) > 11
    BEGIN
        RAISERROR(N'Số điện thoại không hợp lệ',16,1)
        RETURN
    END

    -- 6. Insert
    INSERT INTO NguoiDung
    (TenDangNhap,MatKhau,HoTen,Email,DiaChi,SoDienThoai)
    VALUES
    (@TenDangNhap,@MatKhau,@HoTen,@Email,@DiaChi,@SoDienThoai)
END
GO

CREATE OR ALTER PROC sp_CapNhatThongTinNguoiDung
    @MaNguoiDung INT,
    @HoTen NVARCHAR(100),
    @Email NVARCHAR(100),
    @DiaChi NVARCHAR(255),
    @SoDienThoai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- kiểm tra email trùng
    IF EXISTS (
        SELECT 1
        FROM NguoiDung
        WHERE Email = @Email
        AND MaNguoiDung <> @MaNguoiDung
    )
    BEGIN
        RAISERROR(N'Email đã tồn tại',16,1)
        RETURN
    END

    -- kiểm tra sdt trùng
    IF EXISTS (
        SELECT 1
        FROM NguoiDung
        WHERE SoDienThoai = @SoDienThoai
        AND MaNguoiDung <> @MaNguoiDung
    )
    BEGIN
        RAISERROR(N'Số điện thoại đã tồn tại',16,1)
        RETURN
    END

    UPDATE NguoiDung
    SET
        HoTen = @HoTen,
        Email = @Email,
        DiaChi = @DiaChi,
        SoDienThoai = @SoDienThoai
    WHERE MaNguoiDung = @MaNguoiDung
END
GO

CREATE PROC sp_DoiMatKhau
    @MaNguoiDung INT,
    @MatKhauCu NVARCHAR(255),
    @MatKhauMoi NVARCHAR(255)
AS
BEGIN
    -- 1. Check user
    IF NOT EXISTS (
        SELECT 1 FROM NguoiDung 
        WHERE MaNguoiDung = @MaNguoiDung 
        AND MatKhau = @MatKhauCu
    )
    BEGIN
        RAISERROR(N'Mật khẩu cũ không đúng',16,1)
        RETURN
    END

    -- 2. Validate mật khẩu mới
    IF LEN(@MatKhauMoi) < 6
    BEGIN
        RAISERROR(N'Mật khẩu mới phải >= 6 ký tự',16,1)
        RETURN
    END

    -- 3. Update
    UPDATE NguoiDung
    SET MatKhau = @MatKhauMoi
    WHERE MaNguoiDung = @MaNguoiDung
END
GO

CREATE OR ALTER PROC sp_KiemTraLayLaiMatKhau
    @TenDangNhap NVARCHAR(50),
    @SoDienThoai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap
    AND SoDienThoai = @SoDienThoai
    AND TrangThai = 1
END
GO

CREATE OR ALTER PROC sp_DatLaiMatKhau
    @MaNguoiDung INT,
    @MatKhauMoi NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    IF LEN(@MatKhauMoi) < 6
    BEGIN
        RAISERROR(N'Mật khẩu phải >= 6 ký tự',16,1)
        RETURN
    END

    UPDATE NguoiDung
    SET MatKhau = @MatKhauMoi
    WHERE MaNguoiDung = @MaNguoiDung
END
GO

CREATE PROC sp_KhoaNguoiDung
    @MaNguoiDung INT,
    @TrangThai BIT
AS
BEGIN
    UPDATE NguoiDung
    SET TrangThai = @TrangThai
    WHERE MaNguoiDung = @MaNguoiDung
END
GO

CREATE PROC sp_DangNhap
    @TenDangNhap NVARCHAR(50),
    @MatKhau NVARCHAR(255)
AS
BEGIN
    SELECT * 
    FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap 
      AND MatKhau = @MatKhau
      AND TrangThai = 1
END
GO

-- =============================================
-- 2. CRUD DANH MỤC
-- =============================================

-- THÊM DANH MỤC

CREATE PROC sp_ThemDanhMuc
    @TenDanhMuc NVARCHAR(100),
    @HinhAnh NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DanhMuc (
        TenDanhMuc,
        HinhAnh
    )
    VALUES (
        @TenDanhMuc,
        @HinhAnh
    );
END
GO


-- SỬA DANH MỤC

CREATE PROC sp_SuaDanhMuc
    @MaDanhMuc INT,
    @TenDanhMuc NVARCHAR(100),
    @HinhAnh NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE DanhMuc
    SET
        TenDanhMuc = @TenDanhMuc,
        HinhAnh = @HinhAnh
    WHERE MaDanhMuc = @MaDanhMuc;
END
GO


-- XOÁ DANH MỤC

CREATE PROC sp_XoaDanhMuc
    @MaDanhMuc INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra còn sản phẩm thuộc danh mục không
    IF EXISTS (
        SELECT 1
        FROM SanPham
        WHERE MaDanhMuc = @MaDanhMuc
    )
    BEGIN
        RAISERROR (
            N'Danh mục đang chứa sản phẩm, không thể xoá!',
            16,
            1
        );
        RETURN;
    END

    DELETE FROM DanhMuc
    WHERE MaDanhMuc = @MaDanhMuc;
END
GO

-- =============================================
-- 2. CRUD SẢN PHẨM
-- =============================================

CREATE PROC sp_ThemSanPham
    @Ten NVARCHAR(200),
    @Gia DECIMAL(18,2),
    @SoLuong INT,
    @MaDanhMuc INT
AS
BEGIN
    INSERT INTO SanPham(TenSanPham, Gia, SoLuongTon, MaDanhMuc, TrangThai)
    VALUES(
        @Ten,
        @Gia,
        @SoLuong,
        @MaDanhMuc,
        CASE WHEN @SoLuong = 0 THEN N'Hết hàng' ELSE N'Còn hàng' END
    )
END
GO

CREATE PROC sp_SuaSanPham
    @Ma INT,
    @Ten NVARCHAR(200),
    @Gia DECIMAL(18,2),
    @SoLuong INT,
    @TrangThai NVARCHAR(50)
AS
BEGIN
    UPDATE SanPham
    SET 
        TenSanPham = @Ten,
        Gia = @Gia,
        SoLuongTon = @SoLuong,
        TrangThai = @TrangThai
    WHERE MaSanPham = @Ma
END
GO

-- ❌ KHÔNG XOÁ SẢN PHẨM ĐÃ BÁN
CREATE PROC sp_XoaSanPham
    @Ma INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ChiTietDonHang WHERE MaSanPham = @Ma)
    BEGIN
        -- Soft delete
        UPDATE SanPham
        SET TrangThai = N'Dừng bán'
        WHERE MaSanPham = @Ma
        RETURN
    END

    DELETE FROM SanPham WHERE MaSanPham = @Ma
END
GO

CREATE PROC sp_GetSanPham
AS
BEGIN
    SELECT sp.*, dm.TenDanhMuc
    FROM SanPham sp
    LEFT JOIN DanhMuc dm ON sp.MaDanhMuc = dm.MaDanhMuc
END
GO

----------------------------------GIỎ HÀNG - ĐƠN HÀNG-------------------------------------------
-- =====================================================
-- THÊM VÀO GIỎ HÀNG (CHECK FULL)
-- =====================================================

CREATE OR ALTER PROC sp_ThemVaoGioHang
    @MaNguoiDung INT,
    @MaSanPham INT,
    @SoLuong INT = 1
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaGioHang INT
    DECLARE @TonKho INT
    DECLARE @TrangThai NVARCHAR(50)

    -- 1. Check user
    IF NOT EXISTS (
        SELECT 1
        FROM NguoiDung
        WHERE MaNguoiDung = @MaNguoiDung
        AND TrangThai = 1
    )
    BEGIN
        RAISERROR(N'Người dùng không tồn tại hoặc đã bị khóa',16,1)
        RETURN
    END

    -- 2. Check sản phẩm
    SELECT
        @TonKho = SoLuongTon,
        @TrangThai = TrangThai
    FROM SanPham
    WHERE MaSanPham = @MaSanPham

    IF @TonKho IS NULL
    BEGIN
        RAISERROR(N'Sản phẩm không tồn tại',16,1)
        RETURN
    END

    IF @TrangThai = N'Dừng bán'
    BEGIN
        RAISERROR(N'Sản phẩm đã dừng bán',16,1)
        RETURN
    END

    IF @TonKho <= 0
    BEGIN
        RAISERROR(N'Sản phẩm đã hết hàng',16,1)
        RETURN
    END

    IF @SoLuong <= 0
    BEGIN
        RAISERROR(N'Số lượng không hợp lệ',16,1)
        RETURN
    END

    -- 3. Tạo giỏ hàng nếu chưa có
    SELECT @MaGioHang = MaGioHang
    FROM GioHang
    WHERE MaNguoiDung = @MaNguoiDung

    IF @MaGioHang IS NULL
    BEGIN
        INSERT INTO GioHang(MaNguoiDung)
        VALUES(@MaNguoiDung)

        SET @MaGioHang = SCOPE_IDENTITY()
    END

    -- 4. Nếu SP đã có trong giỏ
    IF EXISTS (
        SELECT 1
        FROM ChiTietGioHang
        WHERE MaGioHang = @MaGioHang
        AND MaSanPham = @MaSanPham
    )
    BEGIN
        DECLARE @SoLuongCu INT

        SELECT @SoLuongCu = SoLuong
        FROM ChiTietGioHang
        WHERE MaGioHang = @MaGioHang
        AND MaSanPham = @MaSanPham

        IF (@SoLuongCu + @SoLuong) > @TonKho
        BEGIN
            RAISERROR(N'Vượt quá số lượng tồn kho',16,1)
            RETURN
        END

        UPDATE ChiTietGioHang
        SET SoLuong = SoLuong + @SoLuong
        WHERE MaGioHang = @MaGioHang
        AND MaSanPham = @MaSanPham
    END
    ELSE
    BEGIN
        IF @SoLuong > @TonKho
        BEGIN
            RAISERROR(N'Số lượng vượt quá tồn kho',16,1)
            RETURN
        END

        INSERT INTO ChiTietGioHang
        (
            MaGioHang,
            MaSanPham,
            SoLuong
        )
        VALUES
        (
            @MaGioHang,
            @MaSanPham,
            @SoLuong
        )
    END

    PRINT N'Thêm vào giỏ hàng thành công'
END
GO

-- =====================================================
-- CẬP NHẬT SỐ LƯỢNG GIỎ HÀNG
-- =====================================================

CREATE OR ALTER PROC sp_CapNhatSoLuongGioHang
    @MaNguoiDung INT,
    @MaSanPham INT,
    @SoLuongMoi INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaGioHang INT
    DECLARE @TonKho INT

    SELECT @MaGioHang = MaGioHang
    FROM GioHang
    WHERE MaNguoiDung = @MaNguoiDung

    IF @MaGioHang IS NULL
    BEGIN
        RAISERROR(N'Giỏ hàng không tồn tại',16,1)
        RETURN
    END

    SELECT @TonKho = SoLuongTon
    FROM SanPham
    WHERE MaSanPham = @MaSanPham

    IF @SoLuongMoi <= 0
    BEGIN
        DELETE FROM ChiTietGioHang
        WHERE MaGioHang = @MaGioHang
        AND MaSanPham = @MaSanPham

        RETURN
    END

    IF @SoLuongMoi > @TonKho
    BEGIN
        RAISERROR(N'Số lượng vượt quá tồn kho',16,1)
        RETURN
    END

    UPDATE ChiTietGioHang
    SET SoLuong = @SoLuongMoi
    WHERE MaGioHang = @MaGioHang
    AND MaSanPham = @MaSanPham
END
GO

-- =====================================================
-- XÓA 1 SẢN PHẨM KHỎI GIỎ
-- =====================================================

CREATE OR ALTER PROC sp_XoaSanPhamKhoiGio
    @MaNguoiDung INT,
    @MaSanPham INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE ct
    FROM ChiTietGioHang ct
    JOIN GioHang gh ON ct.MaGioHang = gh.MaGioHang
    WHERE gh.MaNguoiDung = @MaNguoiDung
    AND ct.MaSanPham = @MaSanPham
END
GO

-- =====================================================
-- XEM GIỎ HÀNG CHI TIẾT
-- =====================================================

CREATE OR ALTER PROC sp_XemChiTietGioHang
    @MaNguoiDung INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        sp.MaSanPham,
        sp.TenSanPham,
        sp.HinhAnh,
        sp.Gia,
        ct.SoLuong,
        (sp.Gia * ct.SoLuong) AS ThanhTien,
        sp.SoLuongTon,
        sp.TrangThai
    FROM GioHang gh
    JOIN ChiTietGioHang ct
        ON gh.MaGioHang = ct.MaGioHang
    JOIN SanPham sp
        ON ct.MaSanPham = sp.MaSanPham
    WHERE gh.MaNguoiDung = @MaNguoiDung
END
GO

-- =====================================================
-- MUA NGAY
-- Tạo đơn trực tiếp không qua giỏ hàng
-- =====================================================

CREATE OR ALTER PROC sp_MuaNgay
    @MaNguoiDung INT,
    @MaSanPham INT,
    @SoLuong INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TonKho INT
    DECLARE @Gia DECIMAL(18,2)
    DECLARE @TrangThai NVARCHAR(50)
    DECLARE @MaDonHang INT

    -- 1. Kiểm tra sản phẩm
    SELECT
        @TonKho = SoLuongTon,
        @Gia = Gia,
        @TrangThai = TrangThai
    FROM SanPham
    WHERE MaSanPham = @MaSanPham

    IF @TonKho IS NULL
    BEGIN
        RAISERROR(N'Sản phẩm không tồn tại',16,1)
        RETURN
    END

    IF @TrangThai = N'Dừng bán'
    BEGIN
        RAISERROR(N'Sản phẩm đã dừng bán',16,1)
        RETURN
    END

    IF @TonKho < @SoLuong
    BEGIN
        RAISERROR(N'Không đủ hàng trong kho',16,1)
        RETURN
    END

    -- 2. Tạo đơn hàng
    INSERT INTO DonHang
    (
        MaNguoiDung,
        TongTien,
        TrangThai
    )
    VALUES
    (
        @MaNguoiDung,
        (@Gia * @SoLuong),
        N'Chờ xử lý'
    )

    SET @MaDonHang = SCOPE_IDENTITY()

    -- 3. Chi tiết đơn hàng
    INSERT INTO ChiTietDonHang
    (
        MaDonHang,
        MaSanPham,
        SoLuong,
        DonGia
    )
    VALUES
    (
        @MaDonHang,
        @MaSanPham,
        @SoLuong,
        @Gia
    )

    PRINT N'Mua ngay thành công'
END
GO

-- =====================================================
-- THANH TOÁN TOÀN BỘ GIỎ HÀNG
-- =====================================================

CREATE OR ALTER PROC sp_CheckoutGioHang
    @MaNguoiDung INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaGioHang INT
    DECLARE @MaDonHang INT

    -- 1. Lấy giỏ hàng
    SELECT @MaGioHang = MaGioHang
    FROM GioHang
    WHERE MaNguoiDung = @MaNguoiDung

    IF @MaGioHang IS NULL
    BEGIN
        RAISERROR(N'Giỏ hàng không tồn tại',16,1)
        RETURN
    END

    -- 2. Check rỗng
    IF NOT EXISTS (
        SELECT 1
        FROM ChiTietGioHang
        WHERE MaGioHang = @MaGioHang
    )
    BEGIN
        RAISERROR(N'Giỏ hàng đang trống',16,1)
        RETURN
    END

    -- 3. Check tồn kho
    IF EXISTS (
        SELECT 1
        FROM ChiTietGioHang ct
        JOIN SanPham sp
            ON ct.MaSanPham = sp.MaSanPham
        WHERE ct.MaGioHang = @MaGioHang
        AND (
            ct.SoLuong > sp.SoLuongTon
            OR sp.TrangThai = N'Dừng bán'
        )
    )
    BEGIN
        RAISERROR(N'Một số sản phẩm không đủ hàng',16,1)
        RETURN
    END

    -- 4. Tạo đơn hàng
    INSERT INTO DonHang
    (
        MaNguoiDung,
        TongTien,
        TrangThai
    )
    VALUES
    (
        @MaNguoiDung,
        0,
        N'Chờ xử lý'
    )

    SET @MaDonHang = SCOPE_IDENTITY()

    -- 5. Copy sang chi tiết đơn
    INSERT INTO ChiTietDonHang
    (
        MaDonHang,
        MaSanPham,
        SoLuong,
        DonGia
    )
    SELECT
        @MaDonHang,
        ct.MaSanPham,
        ct.SoLuong,
        sp.Gia
    FROM ChiTietGioHang ct
    JOIN SanPham sp
        ON ct.MaSanPham = sp.MaSanPham
    WHERE ct.MaGioHang = @MaGioHang

    -- 6. Xóa giỏ
    DELETE FROM ChiTietGioHang
    WHERE MaGioHang = @MaGioHang

    PRINT N'Đặt hàng thành công'
END
GO

-- =====================================================
-- XEM LỊCH SỬ ĐƠN HÀNG
-- =====================================================

CREATE OR ALTER PROC sp_LichSuMuaHang
    @MaNguoiDung INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        dh.MaDonHang,
        dh.NgayDat,
        dh.TongTien,
        dh.TrangThai,
        sp.TenSanPham,
        sp.HinhAnh,
        ct.SoLuong,
        ct.DonGia
    FROM DonHang dh
    JOIN ChiTietDonHang ct
        ON dh.MaDonHang = ct.MaDonHang
    JOIN SanPham sp
        ON ct.MaSanPham = sp.MaSanPham
    WHERE dh.MaNguoiDung = @MaNguoiDung
    ORDER BY dh.MaDonHang DESC
END
GO
-----
CREATE PROC sp_DuyetDonHang
@MaDonHang INT
AS
BEGIN
UPDATE DonHang
SET TrangThai = N'Đang giao'
WHERE MaDonHang = @MaDonHang
END
GO
-----
CREATE PROC sp_HuyDonHang
@MaDonHang INT
AS
BEGIN
UPDATE DonHang
SET TrangThai = N'Đã hủy'
WHERE MaDonHang = @MaDonHang
END
GO



-- ==================================================================================
-- 5. TRIGGER
-- ==================================================================================

-- =============================================
-- KHÔNG CHO XOÁ SẢN PHẨM ĐÃ BÁN
-- =============================================

CREATE OR ALTER TRIGGER trg_KhongXoaSanPhamDaBan
ON SanPham
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT OFF;

    IF EXISTS
    (
        SELECT 1
        FROM deleted d
        JOIN ChiTietDonHang ct
            ON d.MaSanPham = ct.MaSanPham
    )
    BEGIN
        RAISERROR(N'Không thể xoá sản phẩm đã bán',16,1);
        RETURN;
    END

    DELETE FROM SanPham
    WHERE MaSanPham IN
    (
        SELECT MaSanPham
        FROM deleted
    );
END
GO

-- =============================================
-- CHECK TỒN KHO + DỪNG BÁN
-- =============================================

CREATE OR ALTER TRIGGER trg_CheckSoLuong
ON ChiTietDonHang
AFTER INSERT
AS
BEGIN
    SET NOCOUNT OFF;

    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        JOIN SanPham sp
            ON i.MaSanPham = sp.MaSanPham
        WHERE i.SoLuong > sp.SoLuongTon
           OR sp.TrangThai = N'Dừng bán'
    )
    BEGIN
        RAISERROR(N'Sản phẩm không khả dụng',16,1);

        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO

-- =============================================
-- TRỪ KHO
-- =============================================

CREATE OR ALTER TRIGGER trg_TruKho
ON ChiTietDonHang
AFTER INSERT
AS
BEGIN
    SET NOCOUNT OFF;

    UPDATE sp
    SET sp.SoLuongTon =
        sp.SoLuongTon - i.SoLuong
    FROM SanPham sp
    JOIN inserted i
        ON sp.MaSanPham = i.MaSanPham;
END
GO

-- =============================================
-- TÍNH TỔNG TIỀN
-- =============================================

CREATE OR ALTER TRIGGER trg_TinhTongTien
ON ChiTietDonHang
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT OFF;

    UPDATE dh
    SET TongTien =
        ISNULL(t.TongTien, 0)
    FROM DonHang dh
    OUTER APPLY
    (
        SELECT
            SUM(ct.SoLuong * ct.DonGia)
            AS TongTien
        FROM ChiTietDonHang ct
        WHERE ct.MaDonHang =
              dh.MaDonHang
    ) t;
END
GO

-- =============================================
-- AUTO TRẠNG THÁI SẢN PHẨM
-- =============================================

CREATE OR ALTER TRIGGER trg_UpdateTrangThaiSanPham
ON SanPham
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT OFF;

    UPDATE sp
    SET TrangThai =
        CASE
            WHEN sp.SoLuongTon <= 0
                THEN N'Hết hàng'

            WHEN sp.TrangThai = N'Dừng bán'
                THEN N'Dừng bán'

            ELSE N'Còn hàng'
        END
    FROM SanPham sp
    JOIN inserted i
        ON sp.MaSanPham = i.MaSanPham;
END
GO

-- =============================================
-- 6. TÌM KIẾM
-- =============================================

CREATE PROC sp_TimKiemSanPham
    @Keyword NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM SanPham
    WHERE TenSanPham LIKE N'%' + @Keyword + N'%' OR MoTa LIKE N'%' + @Keyword + N'%'
          AND TrangThai != N'Dừng bán'
END
GO

-- =============================================
-- 7. THỐNG KÊ
-- =============================================

CREATE PROC sp_DoanhThuTheoNgay
AS
BEGIN
    SELECT CAST(NgayDat AS DATE) Ngay, SUM(TongTien) DoanhThu
    FROM DonHang
    WHERE TrangThai = N'Hoàn thành'
    GROUP BY CAST(NgayDat AS DATE)
END
GO

-- Top sản phẩm bán chạy
CREATE PROC sp_TopSanPhamBanChay
AS
BEGIN
    -- Nếu có dữ liệu bán
    IF EXISTS (
        SELECT 1
        FROM ChiTietDonHang ct
        JOIN DonHang dh ON ct.MaDonHang = dh.MaDonHang
        WHERE dh.TrangThai = N'Hoàn thành'
    )
    BEGIN
        SELECT TOP 24 
            sp.MaSanPham,
            sp.TenSanPham,
            SUM(ct.SoLuong) AS TongBan
        FROM ChiTietDonHang ct
        JOIN SanPham sp ON ct.MaSanPham = sp.MaSanPham
        JOIN DonHang dh ON ct.MaDonHang = dh.MaDonHang
        WHERE dh.TrangThai = N'Hoàn thành'
        GROUP BY sp.MaSanPham, sp.TenSanPham
        ORDER BY TongBan DESC
    END
    ELSE
    BEGIN
        ;WITH RandomPerCategory AS
        (
            SELECT 
                sp.MaSanPham,
                sp.TenSanPham,
                0 AS TongBan,
                ROW_NUMBER() OVER (
                    PARTITION BY sp.MaDanhMuc 
                    ORDER BY NEWID()
                ) AS rn
            FROM SanPham sp
        ),
        OneEachCategory AS
        (
            SELECT 
                MaSanPham,
                TenSanPham,
                TongBan
            FROM RandomPerCategory
            WHERE rn = 1
        ),
        RandomFill AS
        (
            SELECT TOP (24 - (SELECT COUNT(*) FROM OneEachCategory))
                sp.MaSanPham,
                sp.TenSanPham,
                0 AS TongBan
            FROM SanPham sp
            ORDER BY NEWID()
        )
        SELECT * FROM OneEachCategory
        UNION ALL
        SELECT * FROM RandomFill
    END
END
GO

CREATE PROC sp_TongQuan
AS
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM SanPham) AS TongSanPham,
        (SELECT COUNT(*) FROM DonHang) AS TongDonHang,
        (SELECT SUM(TongTien) FROM DonHang WHERE TrangThai = N'Hoàn thành') AS TongDoanhThu
END
GO

-- SELECT * from DanhMuc
-- =============================================
-- DỮ LIỆU MINH HOẠ
-- =============================================
----------------------------BẢNG DANH  MỤC
INSERT INTO DanhMuc (TenDanhMuc, HinhAnh) VALUES
(N'Thời Trang Nam', N'/images/ThoiTrangNam.PNG'),
(N'Thời Trang Nữ', N'/images/ThoiTrangNu.PNG'),
(N'Điện Thoại & Phụ Kiện', N'/images/DienThoai.PNG'),
(N'Máy Tính & Laptop', N'/images/Laptop.PNG'),
(N'Đồng Hồ', N'/images/DongHo.PNG'),
(N'Giày Dép Nam', N'/images/GiayDepNam.PNG'),
(N'Mỹ Phẩm', N'/images/LamDep.PNG'),
(N'Nhà Cửa & Đời Sống', N'/images/NhaCua.PNG'),
(N'Túi ví nữ', N'/images/TuiViNu.PNG'),
(N'Thiết bị điện tử', N'/images/ThietBiDienTu.PNG'),
(N'Giày Dép Nữ', N'/images/GiayDepNu.PNG'),
(N'Mẹ & Bé', N'/images/MeBe.PNG');
GO
----------------------------- BẢNG SẢN PHẨM
INSERT INTO SanPham 
(TenSanPham, MoTa, Gia, SoLuongTon, HinhAnh, MaDanhMuc, TrangThai)
VALUES

-- THỜI TRANG NAM (1)
(N'Áo Apolo nam tay ngắn', N'Áo thun nam chất liệu cotton mềm mại, thoáng mát.', 199000, 50, N'/images/thoitrangnam01.webp', 1, N'Còn hàng'),
(N'Áo Khoác gió nam', N'Cản gió, bụi nhờ bề mặt có kết cấu chắc chắn, giúp sản phẩm có khả năng cản bụi.', 399000, 35, N'/images/thoitrangnam02.webp', 1, N'Còn hàng'),
(N'Áo Ba lỗ nam Basic', N'Áo 100% cotton, thoáng, mát thời trang dành cho nam.', 549000, 20, N'/images/thoitrangnam03.webp', 1, N'Còn hàng'),
(N'Quần tây Nam Công Sở', N'Quần tây nam lịch lãm phù hợp môi trường công sở.', 299000, 40, N'/images/thoitrangnam04.webp', 1, N'Còn hàng'),

-- THỜI TRANG NỮ (2)
(N'Áo Khoác gió nữ', N'Áo có thiết kế sang trọng và thanh lịch, không thấm nước.', 699000, 25, N'/images/thoitrangnu01.webp', 2, N'Còn hàng'),
(N'Áo Khoác chống nắng nữ', N'Áo kiểu nữ thời trang phong cách Hàn Quốc, chông nắng.', 259000, 30, N'/images/thoitrangnu02.webp', 2, N'Còn hàng'),
(N'Quần Jean Nữ Ống Rộng', N'Quần jean nữ cá tính và trẻ trung.', 420000, 28, N'/images/thoitrangnu03.webp', 2, N'Còn hàng'),
(N'Chân Váy Xếp Ly', N'Chân váy xếp ly dễ phối đồ.', 279000, 45, N'/images/thoitrangnu04.webp', 2, N'Còn hàng'),

-- ĐIỆN THOẠI & PHỤ KIỆN (3)
(N'iPhone 15 Pro Max 256GB', N'Điện thoại cao cấp hiệu năng mạnh mẽ.', 32990000, 15, N'/images/dienthoai01.webp', 3, N'Còn hàng'),
(N'Samsung Galaxy S25 Ultra', N'Flagship Android camera chất lượng cao.', 28990000, 18, N'/images/dienthoai02.webp', 3, N'Còn hàng'),
(N'Tai Nghe Bluetooth Gaming', N'Tai nghe không dây âm thanh sống động.', 890000, 60, N'/images/dienthoai03.webp', 3, N'Còn hàng'),
(N'Sạc Dự Phòng 20000mAh', N'Pin sạc dung lượng lớn hỗ trợ sạc nhanh.', 490000, 75, N'/images/dienthoai04.webp', 3, N'Còn hàng'),

-- MÁY TÍNH & LAPTOP (4)
(N'Laptop Dell Inspiron 15', N'Laptop học tập và làm việc hiệu quả.', 15990000, 12, N'/images/laptop01.webp', 4, N'Còn hàng'),
(N'MacBook Air M3', N'Laptop Apple thiết kế mỏng nhẹ hiệu năng cao.', 28990000, 10, N'/images/laptop02.webp', 4, N'Còn hàng'),
(N'Chuột Không Dây Logitech', N'Chuột wireless độ bền cao.', 350000, 80, N'/images/laptop03.webp', 4, N'Còn hàng'),
(N'Bàn Phím Cơ Gaming RGB', N'Bàn phím cơ LED RGB chuyên game.', 1290000, 32, N'/images/laptop04.webp', 4, N'Còn hàng'),

-- ĐỒNG HỒ (5)
(N'Đồng Hồ Nam Dây Thép', N'Đồng hồ nam sang trọng chống nước.', 1890000, 22, N'/images/dongho01.webp', 5, N'Còn hàng'),
(N'Đồng Hồ Nữ Thời Trang', N'Đồng hồ nữ thiết kế thanh lịch.', 1490000, 25, N'/images/dongho02.webp', 5, N'Còn hàng'),
(N'Đồng Hồ Thể Thao', N'Đồng hồ điện tử chống sốc.', 990000, 35, N'/images/dongho03.webp', 5, N'Còn hàng'),
(N'Đồng Hồ Thông Minh', N'Đồng hồ smartwatch đa chức năng.', 3290000, 16, N'/images/dongho04.webp', 5, N'Còn hàng'),

-- GIÀY DÉP NAM (6)
(N'Giày Sneaker Nam Trắng', N'Giày sneaker phong cách trẻ trung.', 790000, 40, N'/images/giaydepnam01.webp', 6, N'Còn hàng'),
(N'Giày Tây Nam Công Sở', N'Giày da nam lịch lãm.', 1290000, 18, N'/images/giaydepnam02.webp', 6, N'Còn hàng'),
(N'Dép Nam Quai Ngang', N'Dép nam tiện lợi đi hàng ngày.', 250000, 55, N'/images/giaydepnam03.webp', 6, N'Còn hàng'),
(N'Giày Thể Thao Nam', N'Giày chạy bộ nhẹ và êm chân.', 990000, 27, N'/images/giaydepnam04.webp', 6, N'Còn hàng'),

-- MỸ PHẨM (7)
(N'Son Lì Cao Cấp', N'Son môi lâu trôi nhiều màu sắc.', 320000, 70, N'/images/lamdep01.webp', 7, N'Còn hàng'),
(N'Kem Chống Nắng SPF50+', N'Kem chống nắng bảo vệ da hiệu quả.', 450000, 50, N'/images/lamdep02.webp', 7, N'Còn hàng'),
(N'Sữa Rửa Mặt Dịu Nhẹ', N'Làm sạch da không gây kích ứng.', 180000, 65, N'/images/lamdep03.webp', 7, N'Còn hàng'),
(N'Nước Hoa Nữ Cao Cấp', N'Hương thơm quyến rũ sang trọng.', 1250000, 20, N'/images/lamdep04.webp', 7, N'Còn hàng'),

-- NHÀ CỬA & ĐỜI SỐNG (8)
(N'Nồi Chiên Không Dầu', N'Nồi chiên dung tích lớn tiết kiệm dầu.', 2490000, 14, N'/images/nhacua01.webp', 8, N'Còn hàng'),
(N'Máy Hút Bụi Mini', N'Máy hút bụi nhỏ gọn tiện lợi.', 1390000, 21, N'/images/nhacua02.webp', 8, N'Còn hàng'),
(N'Bộ Chăn Ga Gối', N'Bộ chăn ga chất liệu cotton cao cấp.', 890000, 26, N'/images/nhacua03.webp', 8, N'Còn hàng'),
(N'Kệ Đựng Đồ Đa Năng', N'Kệ nhựa nhiều tầng tiện dụng.', 350000, 44, N'/images/nhacua04.webp', 8, N'Còn hàng'),

-- TÚI VÍ NỮ (9)
(N'Túi Xách Nữ Công Sở', N'Túi xách thời trang cao cấp.', 890000, 30, N'/images/tuivinu01.webp', 9, N'Còn hàng'),
(N'Ví Nữ Cầm Tay', N'Ví nữ nhỏ gọn sang trọng.', 390000, 45, N'/images/tuivinu02.webp', 9, N'Còn hàng'),
(N'Balo Nữ Mini', N'Balo mini phong cách Hàn Quốc.', 520000, 34, N'/images/tuivinu03.webp', 9, N'Còn hàng'),
(N'Túi Đeo Chéo Nữ', N'Túi đeo chéo trẻ trung hiện đại.', 470000, 38, N'/images/tuivinu04.webp', 9, N'Còn hàng'),

-- THIẾT BỊ ĐIỆN TỬ (10)
(N'Tivi 4K Smart 55 Inch', N'Tivi độ phân giải cao hình ảnh sắc nét.', 10990000, 8, N'/images/thietbidientu01.webp', 10, N'Còn hàng'),
(N'Loa Bluetooth Mini', N'Loa không dây âm thanh mạnh mẽ.', 790000, 33, N'/images/thietbidientu02.webp', 10, N'Còn hàng'),
(N'Camera An Ninh Wifi', N'Camera giám sát hỗ trợ xem từ xa.', 1290000, 25, N'/images/thietbidientu03.webp', 10, N'Còn hàng'),
(N'Micro Karaoke Bluetooth', N'Micro hát karaoke chất lượng cao.', 650000, 29, N'/images/thietbidientu04.webp', 10, N'Còn hàng'),

-- GIÀY DÉP NỮ (11)
(N'Giày Cao Gót Nữ', N'Giày cao gót thiết kế thanh lịch.', 790000, 24, N'/images/giaydepnu01.webp', 11, N'Còn hàng'),
(N'Giày Sneaker Nữ', N'Giày sneaker nữ trẻ trung năng động.', 850000, 32, N'/images/giaydepnu02.webp', 11, N'Còn hàng'),
(N'Dép Sandal Nữ', N'Sandal nữ thời trang mùa hè.', 390000, 40, N'/images/giaydepnu03.webp', 11, N'Còn hàng'),
(N'Boot Nữ Cá Tính', N'Boot nữ phong cách hiện đại.', 1290000, 18, N'/images/giaydepnu04.webp', 11, N'Còn hàng'),

-- MẸ & BÉ (12)
(N'Áo hút sữa rảnh tay có dây', N'Áo hút sữa giúp các mẹ rảnh tay.', 560000, 35, N'/images/mebe01.webp', 12, N'Còn hàng'),
(N'Xe Đẩy Em Bé', N'Xe đẩy tiện lợi an toàn cho bé.', 2490000, 12, N'/images/mebe02.webp', 12, N'Còn hàng'),
(N'Tã Quần Cao Cấp', N'Tã mềm mại chống tràn hiệu quả.', 420000, 50, N'/images/mebe03.webp', 12, N'Còn hàng'),
(N'Bình Sữa Chống Sặc', N'Bình sữa an toàn cho trẻ nhỏ.', 180000, 60, N'/images/mebe04.webp', 12, N'Còn hàng');
GO


DELETE FROM SanPham;
DELETE FROM DanhMuc;

DBCC CHECKIDENT ('DanhMuc', RESEED, 0);
DBCC CHECKIDENT ('SanPham', RESEED, 0);
GO

--------------------------------BẢNG NGƯỜI DÙNG
INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Email, VaiTro)
VALUES
(N'user01', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyễn Văn An', N'12A, Phường Liên Bảo, TP Vĩnh Yên, Vĩnh Phúc', '0901000001', 'user01@gmail.com', N'User'),
(N'user02', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Trần Thị Bình', N'45, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Hà Nội', '0901000002', 'user02@gmail.com', N'User'),
(N'user03', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Lê Văn Cường', N'88, Phường Hàng Bồ, Quận Hoàn Kiếm, Hà Nội', '0901000003', 'user03@gmail.com', N'User'),
(N'user04', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Phạm Thị Dung', N'21, Phường Thanh Xuân Trung, Quận Thanh Xuân, Hà Nội', '0901000004', 'user04@gmail.com', N'User'),
(N'user05', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Hoàng Văn Em', N'56, Phường Ninh Xá, TP Bắc Ninh, Bắc Ninh', '0901000005', 'user05@gmail.com', N'User'),
(N'user06', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Vũ Thị Hạnh', N'102, Phường Đồng Quang, TP Thái Nguyên, Thái Nguyên', '0901000006', 'user06@gmail.com', N'User'),
(N'user07', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đặng Văn Hòa', N'77, Phường Hiến Nam, TP Hưng Yên, Hưng Yên', '0901000007', 'user07@gmail.com', N'User'),
(N'user08', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Bùi Thị Linh', N'33, Phường Nam Thành, TP Ninh Bình, Ninh Bình', '0901000008', 'user08@gmail.com', N'User'),
(N'user09', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Ngô Văn Khoa', N'19, Phường Hồng Gai, TP Hạ Long, Quảng Ninh', '0901000009', 'user09@gmail.com', N'User'),
(N'Admin', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Đỗ Thị Mai', N'66, Phường Lam Sơn, TP Thanh Hóa, Thanh Hóa', '0912345678', 'Admin@gmail.com', N'Admin');

-- =============================================
-- DEMO GIỎ HÀNG
-- =============================================

-- USER01
INSERT INTO GioHang (MaNguoiDung)
VALUES (1);

INSERT INTO ChiTietGioHang (MaGioHang, MaSanPham, SoLuong)
VALUES
(1, 1, 2),   -- Áo Apolo nam
(1, 9, 1),   -- iPhone 15
(1, 15, 1);  -- Chuột Logitech
GO

-- USER02
INSERT INTO GioHang (MaNguoiDung)
VALUES (2);

INSERT INTO ChiTietGioHang (MaGioHang, MaSanPham, SoLuong)
VALUES
(2, 5, 1),   -- Áo khoác nữ
(2, 24, 2),  -- Giày thể thao nam
(2, 33, 1);  -- Túi xách nữ
GO

-- USER03
INSERT INTO GioHang (MaNguoiDung)
VALUES (3);

INSERT INTO ChiTietGioHang (MaGioHang, MaSanPham, SoLuong)
VALUES
(3, 41, 1),  -- Giày sneaker nữ
(3, 27, 2),  -- Sữa rửa mặt
(3, 48, 3);  -- Bình sữa chống sặc
GO


-- =============================================
-- DEMO ĐƠN HÀNG
-- =============================================

-- ĐƠN HÀNG 1
INSERT INTO DonHang
(MaNguoiDung, NgayDat, TrangThai)
VALUES
( 1, GETDATE() - 10, N'Hoàn thành');

DECLARE @MaDonHang1 INT = SCOPE_IDENTITY();

INSERT INTO ChiTietDonHang
(MaDonHang, MaSanPham, SoLuong, DonGia )
VALUES
(@MaDonHang1, 9, 1, 32990000),   -- iPhone
(@MaDonHang1, 11, 2, 890000);    -- Tai nghe
GO


-- ĐƠN HÀNG 2
INSERT INTO DonHang
(MaNguoiDung, NgayDat, TrangThai
)
VALUES
(2,GETDATE() - 7, N'Hoàn thành');

DECLARE @MaDonHang2 INT = SCOPE_IDENTITY();

INSERT INTO ChiTietDonHang
(MaDonHang,MaSanPham,SoLuong, DonGia)
VALUES
(@MaDonHang2, 14, 1, 28990000),  -- Macbook
(@MaDonHang2, 16, 1, 1290000),   -- Bàn phím cơ
(@MaDonHang2, 15, 2, 350000);    -- Chuột Logitech
GO


-- ĐƠN HÀNG 3
INSERT INTO DonHang
(MaNguoiDung, NgayDat,TrangThai)
VALUES
(3,GETDATE() - 5,N'Đang giao');

DECLARE @MaDonHang3 INT = SCOPE_IDENTITY();

INSERT INTO ChiTietDonHang
(MaDonHang,MaSanPham,SoLuong,DonGia)
VALUES
(@MaDonHang3, 37, 1, 10990000),  -- TV
(@MaDonHang3, 38, 2, 790000);    -- Loa bluetooth
GO


-- ĐƠN HÀNG 4
INSERT INTO DonHang
(
    MaNguoiDung,
    NgayDat,
    TrangThai
)
VALUES
(
    4,
    GETDATE() - 2,
    N'Chờ xử lý'
);

DECLARE @MaDonHang4 INT = SCOPE_IDENTITY();

INSERT INTO ChiTietDonHang
(MaDonHang,MaSanPham,SoLuong,DonGia)
VALUES
(@MaDonHang4, 5, 1, 699000),
(@MaDonHang4, 7, 2, 420000),
(@MaDonHang4, 8, 1, 279000);
GO


-- ĐƠN HÀNG 5
INSERT INTO DonHang
(MaNguoiDung,NgayDat,TrangThai)
VALUES
(5,GETDATE() - 1,N'Đã hủy');

DECLARE @MaDonHang5 INT = SCOPE_IDENTITY();

INSERT INTO ChiTietDonHang
(MaDonHang,MaSanPham,SoLuong,DonGia)
VALUES
(@MaDonHang5, 21, 1, 790000),
(@MaDonHang5, 22, 1, 1290000);
GO


-- =============================================
-- KIỂM TRA DỮ LIỆU
-- =============================================

SELECT * FROM GioHang;
SELECT * FROM ChiTietGioHang;

SELECT * FROM DonHang;
SELECT * FROM ChiTietDonHang;

SELECT * FROM SanPham;
GO
