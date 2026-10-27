using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using ShopeeClone.DATA;
using ShopeeClone.Models;

namespace ShopeeClone.DAL
{
    public class DonHangDAL
    {
        private readonly ApplicationDbContext _context;

        public DonHangDAL(
            ApplicationDbContext context)
        {
            _context = context;
        }

        // =====================================
        // DASHBOARD ĐƠN HÀNG
        // =====================================
        public async Task<List<Model_DB.DonHang>>
            GetDonHangsAsync(
            int maNguoiDung)
        {
            var donHangsDb =
                await _context.DonHangs
                .AsNoTracking()
                .Where(x =>
                    x.MaNguoiDung
                    == maNguoiDung)
                .OrderByDescending(x =>
                    x.NgayDat)
                .ToListAsync();

            var chiTietDb =
                await _context.ChiTietDonHangs
                .AsNoTracking()
                .Include(x => x.SanPham)
                .ToListAsync();

            return donHangsDb
                .Select(d =>
                    new Model_DB.DonHang
                    {
                        MaDonHang =
                            d.MaDonHang,

                        MaNguoiDung =
                            d.MaNguoiDung,

                        NgayDat =
                            d.NgayDat,

                        TongTien =
                            d.TongTien,

                        TrangThai =
                            d.TrangThai
                            ?? "Chờ xử lý",

                        ChiTietDonHangs =
                            chiTietDb
                            .Where(ct =>
                                ct.MaDonHang
                                == d.MaDonHang)

                            .Select(ct =>
                                new Model_DB
                                .ChiTietDonHang
                                {
                                    MaCTDonHang =
                                        ct.MaCTDonHang,

                                    MaDonHang =
                                        ct.MaDonHang,

                                    MaSanPham =
                                        ct.MaSanPham,

                                    SoLuong =
                                        ct.SoLuong,

                                    DonGia =
                                        ct.DonGia,

                                    SanPham =
                                        ct.SanPham
                                        == null
                                        ? null
                                        : new Model_DB
                                        .SanPham
                                        {
                                            MaSanPham =
                                                ct.SanPham
                                                .MaSanPham,

                                            TenSanPham =
                                                ct.SanPham
                                                .TenSanPham
                                                ?? "",

                                            HinhAnh =
                                                ct.SanPham
                                                .HinhAnh
                                                ?? "/images/no-image.png",

                                            Gia =
                                                ct.SanPham
                                                .Gia,

                                            SoLuongTon =
                                                ct.SanPham
                                                .SoLuongTon
                                        }
                                })
                            .ToList()
                    })
                .ToList();
        }

        // =====================================
        // LẤY GIỎ HÀNG
        // =====================================
        public async Task<Model_DB.GioHang?>
            GetGioHangAsync(
            int maNguoiDung)
        {
            return await _context.GioHangs
                .Include(g =>
                    g.ChiTietGioHangs!)
                .ThenInclude(ct =>
                    ct.SanPham)

                .FirstOrDefaultAsync(g =>
                    g.MaNguoiDung
                    == maNguoiDung);
        }

        // =====================================
        // TẠO ĐƠN HÀNG
        // =====================================
        public async Task<Model_DB.DonHang>
            TaoDonHangAsync(
            int maNguoiDung)
        {
            var donHang =
                new Model_DB.DonHang
                {
                    MaNguoiDung =
                        maNguoiDung,

                    NgayDat =
                        DateTime.Now,

                    TongTien = 0,

                    TrangThai =
                        "Chờ xử lý"
                };

            _context.DonHangs.Add(donHang);

            await _context.SaveChangesAsync();

            return donHang;
        }

        // =====================================
        // THÊM CHI TIẾT ĐƠN HÀNG
        // =====================================
        public async Task ThemChiTietDonHangAsync(
            int maDonHang,
            int maSanPham,
            int soLuong,
            decimal donGia)
        {
            await _context.Database
            .ExecuteSqlInterpolatedAsync($@"

                INSERT INTO ChiTietDonHang
                (
                    MaDonHang,
                    MaSanPham,
                    SoLuong,
                    DonGia
                )
                VALUES
                (
                    {maDonHang},
                    {maSanPham},
                    {soLuong},
                    {donGia}
                )

            ");
        }

        // =====================================
        // SAVE
        // =====================================
        public async Task SaveAsync()
        {
            await _context.SaveChangesAsync();
        }

        // =====================================
        // XÓA GIỎ HÀNG
        // =====================================
        public async Task RemoveChiTietGioHangAsync(
            List<Model_DB.ChiTietGioHang>
            dsChiTiet)
        {
            _context.ChiTietGioHangs
                .RemoveRange(dsChiTiet);

            await _context.SaveChangesAsync();
        }

        // =====================================
        // TRANSACTION
        // =====================================
        public async Task<IDbContextTransaction>
            BeginTransactionAsync()
        {
            return await _context.Database
                .BeginTransactionAsync();
        }
    }
}