using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;
using ShopeeClone.Models;

namespace ShopeeClone.DAL
{
    public class GioHangDAL
    {
        private readonly ApplicationDbContext _context;

        public GioHangDAL(ApplicationDbContext context)
        {
            _context = context;
        }

        // =========================================
        // LẤY GIỎ HÀNG
        // =========================================
        public async Task<Model_DB.GioHang?> GetGioHangAsync(
            int maNguoiDung)
        {
            return await _context.GioHangs
                .Include(g => g.ChiTietGioHangs!)
                .ThenInclude(ct => ct.SanPham)
                .FirstOrDefaultAsync(g =>
                    g.MaNguoiDung == maNguoiDung);
        }

        // =========================================
        // LẤY SẢN PHẨM
        // =========================================
        public async Task<Model_DB.SanPham?> GetSanPhamAsync(
            int maSanPham)
        {
            return await _context.SanPhams
                .FirstOrDefaultAsync(x =>
                    x.MaSanPham == maSanPham);
        }

        // =========================================
        // TẠO GIỎ HÀNG
        // =========================================
        public async Task<Model_DB.GioHang> TaoGioHangAsync(
            int maNguoiDung)
        {
            var gioHang = new Model_DB.GioHang
            {
                MaNguoiDung = maNguoiDung,
                NgayTao = DateTime.Now
            };

            _context.GioHangs.Add(gioHang);

            await _context.SaveChangesAsync();

            return gioHang;
        }

        // =========================================
        // LẤY CHI TIẾT GIỎ
        // =========================================
        public async Task<Model_DB.ChiTietGioHang?>
            GetChiTietGioHangAsync(
            int maGioHang,
            int maSanPham)
        {
            return await _context.ChiTietGioHangs
                .FirstOrDefaultAsync(x =>
                    x.MaGioHang == maGioHang
                    && x.MaSanPham == maSanPham);
        }

        // =========================================
        // THÊM CHI TIẾT GIỎ
        // =========================================
        public async Task ThemChiTietAsync(
            Model_DB.ChiTietGioHang item)
        {
            _context.ChiTietGioHangs.Add(item);

            await _context.SaveChangesAsync();
        }

        // =========================================
        // UPDATE CHI TIẾT GIỎ
        // =========================================
        public async Task UpdateChiTietAsync(
            Model_DB.ChiTietGioHang item)
        {
            _context.ChiTietGioHangs.Update(item);

            await _context.SaveChangesAsync();
        }

        // =========================================
        // XOÁ CHI TIẾT GIỎ
        // =========================================
        public async Task<bool> XoaAsync(int id)
        {
            var item = await _context.ChiTietGioHangs
                .FindAsync(id);

            if (item == null)
            {
                return false;
            }

            _context.ChiTietGioHangs.Remove(item);

            await _context.SaveChangesAsync();

            return true;
        }

        // =========================================
        // TĂNG SỐ LƯỢNG
        // =========================================
        public async Task<Model_DB.ChiTietGioHang?>
            GetChiTietByIdAsync(int id)
        {
            return await _context.ChiTietGioHangs
                .Include(x => x.SanPham)
                .FirstOrDefaultAsync(x =>
                    x.MaCTGioHang == id);
        }

        // =========================================
        // LƯU
        // =========================================
        public async Task SaveAsync()
        {
            await _context.SaveChangesAsync();
        }

        // =========================================
        // TẠO ĐƠN HÀNG
        // =========================================
        public async Task<Model_DB.DonHang>
            TaoDonHangAsync(
            int maNguoiDung,
            decimal tongTien)
        {
            var donHang = new Model_DB.DonHang
            {
                MaNguoiDung = maNguoiDung,
                NgayDat = DateTime.Now,
                TongTien = tongTien,
                TrangThai = "Chờ xử lý"
            };

            _context.DonHangs.Add(donHang);

            await _context.SaveChangesAsync();

            return donHang;
        }

        // =========================================
        // THÊM CHI TIẾT ĐƠN HÀNG
        // =========================================
        public async Task ThemChiTietDonHangAsync(
            Model_DB.ChiTietDonHang item)
        {
            _context.ChiTietDonHangs.Add(item);

            await _context.SaveChangesAsync();
        }
    }
}