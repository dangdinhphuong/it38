using ShopeeClone.DAL;
using ShopeeClone.Models;

namespace ShopeeClone.BAL
{
    public class DonHangBAL
    {
        private readonly DonHangDAL _donHangDAL;

        public DonHangBAL(
            DonHangDAL donHangDAL)
        {
            _donHangDAL = donHangDAL;
        }

        // =====================================
        // DASHBOARD
        // =====================================
        public async Task<List<Model_DB.DonHang>>
            GetDashboardAsync(
            int maNguoiDung)
        {
            return await _donHangDAL
                .GetDonHangsAsync(
                    maNguoiDung);
        }

        // =====================================
        // THANH TOÁN
        // =====================================
        public async Task<(bool, string)>
            ThanhToanAsync(
            int maNguoiDung,
            List<int> dsChiTiet)
        {
            using var transaction =
                await _donHangDAL
                .BeginTransactionAsync();

            try
            {
                if (dsChiTiet == null
                    || !dsChiTiet.Any())
                {
                    return (false,
                        "Vui lòng chọn sản phẩm");
                }

                var gioHang =
                    await _donHangDAL
                    .GetGioHangAsync(
                        maNguoiDung);

                if (gioHang == null)
                {
                    return (false,
                        "Giỏ hàng trống");
                }

                var dsSanPhamMua =
                    gioHang.ChiTietGioHangs!
                    .Where(x =>
                        dsChiTiet.Contains(
                            x.MaCTGioHang))
                    .ToList();

                if (!dsSanPhamMua.Any())
                {
                    return (false,
                        "Không có sản phẩm được chọn");
                }

                decimal tongTien = 0;

                // =========================
                // TẠO ĐƠN HÀNG
                // =========================

                var donHang =
                    await _donHangDAL
                    .TaoDonHangAsync(
                        maNguoiDung);

                // =========================
                // CHI TIẾT ĐƠN HÀNG
                // =========================

                foreach (var item
                    in dsSanPhamMua)
                {
                    if (item.SanPham == null)
                    {
                        continue;
                    }

                    if (item.SoLuong >
                        item.SanPham
                        .SoLuongTon)
                    {
                        return (false,
                            $"Sản phẩm {item.SanPham.TenSanPham} không đủ hàng");
                    }

                    await _donHangDAL
                        .ThemChiTietDonHangAsync(
                            donHang.MaDonHang,
                            item.MaSanPham,
                            item.SoLuong,
                            item.SanPham.Gia);

                    // =====================
                    // TRỪ TỒN KHO
                    // =====================

                    item.SanPham.SoLuongTon -=
                        item.SoLuong;

                    if (item.SanPham.SoLuongTon
                        <= 0)
                    {
                        item.SanPham.TrangThai =
                            TrangThaiSanPham
                            .HetHang;
                    }

                    tongTien +=
                        item.SoLuong
                        * item.SanPham.Gia;
                }

                // =========================
                // UPDATE TỔNG TIỀN
                // =========================

                donHang.TongTien =
                    tongTien;

                await _donHangDAL
                    .SaveAsync();

                // =========================
                // XÓA ITEM ĐÃ MUA
                // =========================

                await _donHangDAL
                    .RemoveChiTietGioHangAsync(
                        dsSanPhamMua);

                await transaction.CommitAsync();

                return (true,
                    "Đặt hàng thành công");
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();

                return (false,
                    ex.InnerException != null
                    ? ex.InnerException.Message
                    : ex.Message);
            }
        }
    }
}