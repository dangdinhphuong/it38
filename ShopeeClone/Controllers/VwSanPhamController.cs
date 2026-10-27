using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;
using ShopeeClone.Models;
using System.Linq;

namespace ShopeeClone.Controllers
{
    public class VwSanPhamController : Controller
    {
        private readonly ApplicationDbContext _context;

        public VwSanPhamController(ApplicationDbContext context)
        {
            _context = context;
        }

        // DASHBOARD
        public IActionResult Dashboard(int id, int page = 1)
        {
            int pageSize = 12;

            var query = _context.SanPhams
                                .Include(x => x.DanhMuc)
                                .Where(x => x.MaDanhMuc == id);

            int totalProducts = query.Count();

            var products = query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            var model = new DashboardViewModel
            {
                Products = products,
                Categories = _context.DanhMucs.ToList(),
                SelectedCategoryId = id,
                CurrentPage = page,
                TotalPages = (int)System.Math.Ceiling((double)totalProducts / pageSize)
            };

            return View(model);
        }

        // CHI TIẾT
        public IActionResult ChiTietSanPham(int id)
        {
            var sp = _context.SanPhams
                             .Include(x => x.DanhMuc)
                             .FirstOrDefault(x => x.MaSanPham == id);

            if (sp == null)
            {
                return NotFound();
            }

            return View(sp);
        }
    }
}