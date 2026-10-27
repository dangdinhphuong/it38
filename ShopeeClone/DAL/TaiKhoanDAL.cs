using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;

using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.DAL
{
    public class TaiKhoanDAL
    {
        private readonly ApplicationDbContext _context;

        public TaiKhoanDAL(ApplicationDbContext context)
        {
            _context = context;
        }

        // =========================
        // ĐĂNG NHẬP
        // =========================

        public async Task<NguoiDung?> DangNhap(
            string tenDangNhap,
            string matKhau)
        {
            var result = await _context.NguoiDungs
                .FromSqlRaw(
                    @"EXEC sp_DangNhap
                        @TenDangNhap,
                        @MatKhau",

                    new SqlParameter("@TenDangNhap", tenDangNhap),

                    new SqlParameter("@MatKhau", matKhau)
                )
                .AsNoTracking()
                .ToListAsync();

            return result.FirstOrDefault();
        }

        // =========================
        // ĐĂNG KÝ
        // =========================

        public async Task DangKy(
            string tenDangNhap,
            string matKhau,
            string hoTen,
            string email,
            string diaChi,
            string soDienThoai)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_DangKy
                    @TenDangNhap,
                    @MatKhau,
                    @HoTen,
                    @Email,
                    @DiaChi,
                    @SoDienThoai",

                new SqlParameter("@TenDangNhap", tenDangNhap),

                new SqlParameter("@MatKhau", matKhau),

                new SqlParameter("@HoTen", hoTen),

                new SqlParameter("@Email", email),

                new SqlParameter("@DiaChi", diaChi),

                new SqlParameter("@SoDienThoai", soDienThoai)
            );
        }

        // =========================
        // LẤY THÔNG TIN USER
        // =========================

        public async Task<NguoiDung?> LayThongTinNguoiDung(
            int maNguoiDung)
        {
            return await _context.NguoiDungs
                .AsNoTracking()
                .FirstOrDefaultAsync(x =>
                    x.MaNguoiDung == maNguoiDung);
        }

        // =========================
        // CẬP NHẬT THÔNG TIN
        // =========================

        public async Task CapNhatThongTin(
            int maNguoiDung,
            string hoTen,
            string email,
            string diaChi,
            string soDienThoai)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_CapNhatThongTinNguoiDung
                    @MaNguoiDung,
                    @HoTen,
                    @Email,
                    @DiaChi,
                    @SoDienThoai",

                new SqlParameter("@MaNguoiDung", maNguoiDung),

                new SqlParameter("@HoTen", hoTen),

                new SqlParameter("@Email", email),

                new SqlParameter("@DiaChi", diaChi),

                new SqlParameter("@SoDienThoai", soDienThoai)
            );
        }

        // =========================
        // ĐỔI MẬT KHẨU
        // =========================

        public async Task DoiMatKhau(
            int maNguoiDung,
            string matKhauCu,
            string matKhauMoi)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_DoiMatKhau
                    @MaNguoiDung,
                    @MatKhauCu,
                    @MatKhauMoi",

                new SqlParameter("@MaNguoiDung", maNguoiDung),

                new SqlParameter("@MatKhauCu", matKhauCu),

                new SqlParameter("@MatKhauMoi", matKhauMoi)
            );
        }

        // =========================
        // QUÊN MẬT KHẨU
        // =========================

        public async Task<NguoiDung?> KiemTraLayLaiMatKhau(
            string tenDangNhap,
            string soDienThoai)
        {
            var result = await _context.NguoiDungs
                .FromSqlRaw(
                    @"EXEC sp_KiemTraLayLaiMatKhau
                        @TenDangNhap,
                        @SoDienThoai",

                    new SqlParameter("@TenDangNhap", tenDangNhap),

                    new SqlParameter("@SoDienThoai", soDienThoai)
                )
                .AsNoTracking()
                .ToListAsync();

            return result.FirstOrDefault();
        }

        // =========================
        // ĐẶT LẠI MẬT KHẨU
        // =========================

        public async Task DatLaiMatKhau(
            int maNguoiDung,
            string matKhauMoi)
        {
            await _context.Database.ExecuteSqlRawAsync(
                @"EXEC sp_DatLaiMatKhau
                    @MaNguoiDung,
                    @MatKhauMoi",

                new SqlParameter("@MaNguoiDung", maNguoiDung),

                new SqlParameter("@MatKhauMoi", matKhauMoi)
            );
        }
    }
}