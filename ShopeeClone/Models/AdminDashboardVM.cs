using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.ViewModels
{
    public class AdminDashboardVM
    {
        public int TongSanPham { get; set; }
        public int TongDonHang { get; set; }
        public decimal TongDoanhThu { get; set; }

        public List<SanPham>? SanPhams { get; set; }
        public List<DanhMuc>? DanhMucs { get; set; }
        public List<DonHang>? DonHangs { get; set; }
        public List<NguoiDung>? NguoiDungs { get; set; }
    }
}