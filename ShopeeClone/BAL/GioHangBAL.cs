using ShopeeClone.DAL;
using ShopeeClone.Models;

namespace ShopeeClone.BAL
{
    public class GioHangBAL
    {
        private readonly GioHangDAL _gioHangDAL;

        public GioHangBAL(GioHangDAL gioHangDAL)
        {
            _gioHangDAL = gioHangDAL;
        }

        // =========================================
        // DASHBOARD
        // =========================================
        public async Task<List<Model_DB.ChiTietGioHang>>
            GetDashboardAsync(
            int maNguoiDung)
        {
            var gioHang =
                await _gioHangDAL.GetGioHangAsync(
                    maNguoiDung);

            return gioHang?.ChiTietGioHangs?
                .ToList()
                ?? new List<Model_DB.ChiTietGioHang>();
        }

        // =========================================
        // THÊM VÀO GIỎ
        // =========================================
        public async Task<(bool, string)>
            ThemVaoGioAsync(
            int maNguoiDung,
            int maSanPham,
            int soLuong)
        {
            var sanPham =
                await _gioHangDAL.GetSanPhamAsync(
                    maSanPham);

            if (sanPham == null)
            {
                return (false,
                    "Sản phẩm không tồn tại");
            }

            if (sanPham.TrangThai
                == TrangThaiSanPham.DungBan)
            {
                return (false,
                    "Sản phẩm đã dừng bán");
            }

            if (sanPham.SoLuongTon <= 0)
            {
                return (false,
                    "Sản phẩm đã hết hàng");
            }

            var gioHang =
                await _gioHangDAL.GetGioHangAsync(
                    maNguoiDung);

            if (gioHang == null)
            {
                gioHang =
                    await _gioHangDAL.TaoGioHangAsync(
                        maNguoiDung);
            }

            var chiTiet =
                await _gioHangDAL
                .GetChiTietGioHangAsync(
                    gioHang.MaGioHang,
                    maSanPham);

            if (chiTiet != null)
            {
                if ((chiTiet.SoLuong + soLuong)
                    > sanPham.SoLuongTon)
                {
                    return (false,
                        "Vượt quá tồn kho");
                }

                chiTiet.SoLuong += soLuong;

                await _gioHangDAL
                    .UpdateChiTietAsync(chiTiet);
            }
            else
            {
                if (soLuong > sanPham.SoLuongTon)
                {
                    return (false,
                        "Vượt quá tồn kho");
                }

                var item =
                    new Model_DB.ChiTietGioHang
                    {
                        MaGioHang =
                            gioHang.MaGioHang,
                        MaSanPham = maSanPham,
                        SoLuong = soLuong
                    };

                await _gioHangDAL
                    .ThemChiTietAsync(item);
            }

            return (true,
                "Đã thêm vào giỏ hàng");
        }

        // =========================================
        // MUA NGAY
        // =========================================
        public async Task<(bool, string)>
            MuaNgayAsync(
            int maNguoiDung,
            int maSanPham,
            int soLuong)
        {
            var sanPham =
                await _gioHangDAL.GetSanPhamAsync(
                    maSanPham);

            if (sanPham == null)
            {
                return (false,
                    "Sản phẩm không tồn tại");
            }

            if (sanPham.SoLuongTon < soLuong)
            {
                return (false,
                    "Không đủ hàng");
            }

            var donHang =
                await _gioHangDAL
                .TaoDonHangAsync(
                    maNguoiDung,
                    sanPham.Gia * soLuong);

            var ctDonHang =
                new Model_DB.ChiTietDonHang
                {
                    MaDonHang = donHang.MaDonHang,
                    MaSanPham = maSanPham,
                    SoLuong = soLuong,
                    DonGia = sanPham.Gia
                };

            await _gioHangDAL
                .ThemChiTietDonHangAsync(
                    ctDonHang);

            sanPham.SoLuongTon -= soLuong;

            if (sanPham.SoLuongTon <= 0)
            {
                sanPham.TrangThai =
                    TrangThaiSanPham.HetHang;
            }

            await _gioHangDAL.SaveAsync();

            return (true,
                "Mua hàng thành công");
        }

        // =========================================
        // XOÁ
        // =========================================
        public async Task<(bool, string)>
            XoaAsync(int id)
        {
            var result =
                await _gioHangDAL.XoaAsync(id);

            if (!result)
            {
                return (false,
                    "Không tìm thấy sản phẩm");
            }

            return (true,
                "Đã xoá sản phẩm");
        }

        // =========================================
        // TĂNG
        // =========================================
        public async Task<(bool, string)>
            TangAsync(int id)
        {
            var item =
                await _gioHangDAL
                .GetChiTietByIdAsync(id);

            if (item == null)
            {
                return (false,
                    "Không tìm thấy sản phẩm");
            }

            if (item.SoLuong
                >= item.SanPham!.SoLuongTon)
            {
                return (false,
                    "Đã đạt tối đa tồn kho");
            }

            item.SoLuong++;

            await _gioHangDAL.SaveAsync();

            return (true, "");
        }

        // =========================================
        // GIẢM
        // =========================================
        public async Task<(bool, string)>
            GiamAsync(int id)
        {
            var item =
                await _gioHangDAL
                .GetChiTietByIdAsync(id);

            if (item == null)
            {
                return (false,
                    "Không tìm thấy sản phẩm");
            }

            item.SoLuong--;

            if (item.SoLuong <= 0)
            {
                await _gioHangDAL.XoaAsync(id);
            }
            else
            {
                await _gioHangDAL.SaveAsync();
            }

            return (true, "");
        }
    }
}