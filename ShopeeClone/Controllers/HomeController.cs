using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;
using System.Linq;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index(string keyword)
        {
            List<SanPham> sanPhams;

            if (!string.IsNullOrEmpty(keyword))
            {
                sanPhams = _context.SanPhams
                    .FromSqlRaw("EXEC sp_TimKiemSanPham @Keyword",
                        new SqlParameter("@Keyword", keyword))
                    .ToList();
            }
            else
            {
                sanPhams = _context.SanPhams.ToList();
            }

            // TOP sản phẩm
            var topSanPham = _context.TopSanPhamBanChay
                .FromSqlRaw("EXEC sp_TopSanPhamBanChay")
                .ToList();

            ViewBag.TopSanPham = topSanPham;

            return View(sanPhams);
        }
    }
}