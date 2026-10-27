using ShopeeClone.DAL;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.BAL
{
    public class QuanTriBAL
    {
        private readonly QuanTriDAL _quanTriDAL;

        public QuanTriBAL(QuanTriDAL quanTriDAL)
        {
            _quanTriDAL = quanTriDAL;
        }

        // =========================================
        // DASHBOARD
        // =========================================

        public async Task<int> DemSanPham()
            => await _quanTriDAL.DemSanPham();

        public async Task<int> DemDanhMuc()
            => await _quanTriDAL.DemDanhMuc();

        public async Task<int> DemDonHang()
            => await _quanTriDAL.DemDonHang();

        public async Task<int> DemNguoiDung()
            => await _quanTriDAL.DemNguoiDung();

        public async Task<decimal> TongDoanhThu()
            => await _quanTriDAL.TongDoanhThu();

        public async Task<List<TopSanPhamBanChayModel>>
            TopSanPhamBanChay()
            => await _quanTriDAL.TopSanPhamBanChay();

        // =========================================
        // DANH MỤC
        // =========================================

        public async Task<List<DanhMuc>>
            LayDanhSachDanhMuc()
            => await _quanTriDAL.LayDanhSachDanhMuc();

        public async Task ThemDanhMuc(DanhMuc model)
            => await _quanTriDAL.ThemDanhMuc(model);

        public async Task SuaDanhMuc(DanhMuc model)
            => await _quanTriDAL.SuaDanhMuc(model);

        public async Task XoaDanhMuc(int id)
            => await _quanTriDAL.XoaDanhMuc(id);

        // =========================================
        // SẢN PHẨM
        // =========================================

        public async Task<List<SanPham>>
            LayDanhSachSanPham(string keyword)
            => await _quanTriDAL.LayDanhSachSanPham(keyword);

        public async Task ThemSanPham(SanPham model)
            => await _quanTriDAL.ThemSanPham(model);

        public async Task SuaSanPham(SanPham model)
            => await _quanTriDAL.SuaSanPham(model);

        public async Task XoaSanPham(int id)
            => await _quanTriDAL.XoaSanPham(id);

        // =========================================
        // ĐƠN HÀNG
        // =========================================

        public async Task<List<DonHang>>
            LayDanhSachDonHang()
            => await _quanTriDAL.LayDanhSachDonHang();

        public async Task DuyetDon(int id)
            => await _quanTriDAL.DuyetDon(id);

        public async Task HuyDon(int id)
            => await _quanTriDAL.HuyDon(id);
    }
}