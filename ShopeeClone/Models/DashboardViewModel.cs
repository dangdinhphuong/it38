using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.Models
{
    public class DashboardViewModel
    {
        public required List<DanhMuc> Categories { get; set; }
        public required List<SanPham> Products { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
        public int SelectedCategoryId { get; set; }
    }
}
