using ShopeeClone.DAL;
using ShopeeClone.Helpers;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.BAL
{
    public class TaiKhoanBAL
    {
        private readonly TaiKhoanDAL _taiKhoanDAL;

        public TaiKhoanBAL(TaiKhoanDAL taiKhoanDAL)
        {
            _taiKhoanDAL = taiKhoanDAL;
        }

        // =========================
        // ĐĂNG NHẬP
        // =========================

        public async Task<NguoiDung?> DangNhap(
            string tenDangNhap,
            string matKhau)
        {
            string matKhauMaHoa =
                MaHoaHelper.MaHoaSHA256(matKhau);

            return await _taiKhoanDAL.DangNhap(
                tenDangNhap,
                matKhauMaHoa
            );
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
            string matKhauMaHoa =
                MaHoaHelper.MaHoaSHA256(matKhau);

            await _taiKhoanDAL.DangKy(
                tenDangNhap,
                matKhauMaHoa,
                hoTen,
                email,
                diaChi,
                soDienThoai
            );
        }

        // =========================
        // LẤY THÔNG TIN USER
        // =========================

        public async Task<NguoiDung?> LayThongTinNguoiDung(
            int maNguoiDung)
        {
            return await _taiKhoanDAL
                .LayThongTinNguoiDung(maNguoiDung);
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
            await _taiKhoanDAL.CapNhatThongTin(
                maNguoiDung,
                hoTen,
                email,
                diaChi,
                soDienThoai
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
            string mkCuMaHoa =
                MaHoaHelper.MaHoaSHA256(matKhauCu);

            string mkMoiMaHoa =
                MaHoaHelper.MaHoaSHA256(matKhauMoi);

            await _taiKhoanDAL.DoiMatKhau(
                maNguoiDung,
                mkCuMaHoa,
                mkMoiMaHoa
            );
        }

        // =========================
        // KIỂM TRA QUÊN MẬT KHẨU
        // =========================

        public async Task<NguoiDung?> KiemTraLayLaiMatKhau(
            string tenDangNhap,
            string soDienThoai)
        {
            return await _taiKhoanDAL
                .KiemTraLayLaiMatKhau(
                    tenDangNhap,
                    soDienThoai
                );
        }

        // =========================
        // ĐẶT LẠI MẬT KHẨU
        // =========================

        public async Task DatLaiMatKhau(
            int maNguoiDung,
            string matKhauMoi)
        {
            string matKhauMaHoa =
                MaHoaHelper.MaHoaSHA256(matKhauMoi);

            await _taiKhoanDAL.DatLaiMatKhau(
                maNguoiDung,
                matKhauMaHoa
            );
        }
    }
}