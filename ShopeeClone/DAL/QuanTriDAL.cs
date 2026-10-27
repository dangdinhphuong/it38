using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.DAL
{
    public class QuanTriDAL
    {
        private readonly ApplicationDbContext _context;

        public QuanTriDAL(ApplicationDbContext context)
        {
            _context = context;
        }

        // =========================================
        // DASHBOARD
        // =========================================

        public async Task<int> DemSanPham()
            => await _context.SanPhams.CountAsync();

        public async Task<int> DemDanhMuc()
            => await _context.DanhMucs.CountAsync();

        public async Task<int> DemDonHang()
            => await _context.DonHangs.CountAsync();

        public async Task<int> DemNguoiDung()
            => await _context.NguoiDungs.CountAsync();

        public async Task<decimal> TongDoanhThu()
        {
            return await _context.DonHangs
                .Where(x => x.TrangThai == "Hoàn thành")
                .SumAsync(x => (decimal?)x.TongTien) ?? 0;
        }

        public async Task<List<TopSanPhamBanChayModel>>
            TopSanPhamBanChay()
        {
            return await _context.TopSanPhamBanChay
                .FromSqlRaw("EXEC sp_TopSanPhamBanChay")
                .ToListAsync();
        }

        // =========================================
        // DANH MỤC
        // =========================================

        public async Task<List<DanhMuc>> LayDanhSachDanhMuc()
        {
            return await _context.DanhMucs
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task ThemDanhMuc(DanhMuc model)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_ThemDanhMuc
            @TenDanhMuc,
            @HinhAnh",

                new SqlParameter(
                    "@TenDanhMuc",
                    model.TenDanhMuc ?? (object)DBNull.Value),

                new SqlParameter(
                    "@HinhAnh",
                    model.HinhAnh ?? (object)DBNull.Value)
            );
        }

        public async Task SuaDanhMuc(DanhMuc model)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_SuaDanhMuc
            @MaDanhMuc,
            @TenDanhMuc,
            @HinhAnh",

                new SqlParameter(
                    "@MaDanhMuc",
                    model.MaDanhMuc),

                new SqlParameter(
                    "@TenDanhMuc",
                    model.TenDanhMuc ?? (object)DBNull.Value),

                new SqlParameter(
                    "@HinhAnh",
                    model.HinhAnh ?? (object)DBNull.Value)
            );
        }

        public async Task XoaDanhMuc(int id)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_XoaDanhMuc
            @MaDanhMuc",

                new SqlParameter(
                    "@MaDanhMuc",
                    id)
            );
        }

        // =========================================
        // SẢN PHẨM
        // =========================================

        public async Task<List<SanPham>> LayDanhSachSanPham(
            string keyword)
        {
            var query = _context.SanPhams
                .Include(x => x.DanhMuc)
                .AsQueryable();

            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(x =>
                    x.TenSanPham != null &&
                    x.TenSanPham.Contains(keyword));
            }

            return await query
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task ThemSanPham(SanPham model)
        {
            _context.SanPhams.Add(model);

            await _context.SaveChangesAsync();
        }

        public async Task SuaSanPham(SanPham model)
        {
            var item = await _context.SanPhams
                .FindAsync(model.MaSanPham);

            if (item != null)
            {
                item.TenSanPham = model.TenSanPham;
                item.MoTa = model.MoTa;
                item.Gia = model.Gia;
                item.SoLuongTon = model.SoLuongTon;
                item.MaDanhMuc = model.MaDanhMuc;
                item.HinhAnh = model.HinhAnh;
                item.TrangThai = model.TrangThai;

                await _context.SaveChangesAsync();
            }
        }

        public async Task XoaSanPham(int id)
        {
            var item = await _context.SanPhams
                .FindAsync(id);

            if (item != null)
            {
                _context.SanPhams.Remove(item);

                await _context.SaveChangesAsync();
            }
        }

        // =========================================
        // ĐƠN HÀNG
        // =========================================

        public async Task<List<DonHang>> LayDanhSachDonHang()
        {
            return await _context.DonHangs
                .Include(x => x.NguoiDung)
                .OrderByDescending(x => x.NgayDat)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task DuyetDon(int id)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC sp_DuyetDonHang @MaDonHang",
                new SqlParameter("@MaDonHang", id)
            );
        }

        public async Task HuyDon(int id)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC sp_HuyDonHang @MaDonHang",
                new SqlParameter("@MaDonHang", id)
            );
        }
    }
}