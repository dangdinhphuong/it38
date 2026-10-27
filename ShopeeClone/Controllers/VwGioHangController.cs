using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopeeClone.BAL;

namespace ShopeeClone.Controllers
{
    [Route("VwGioHang")]
    public class VwGioHangController : Controller
    {
        private readonly GioHangBAL _gioHangBAL;

        public VwGioHangController(
            GioHangBAL gioHangBAL)
        {
            _gioHangBAL = gioHangBAL;
        }

        // =========================================
        // DASHBOARD
        // =========================================
        [HttpGet("Dashboard")]
        public async Task<IActionResult> Dashboard()
        {
            int? maNguoiDung =
                HttpContext.Session
                .GetInt32("MaNguoiDung");

            if (maNguoiDung == null)
            {
                return RedirectToAction(
                    "DangNhap",
                    "VwTaiKhoan");
            }

            var data =
                await _gioHangBAL
                .GetDashboardAsync(
                    maNguoiDung.Value);

            ViewBag.TongTien =
                data.Sum(x =>
                    (x.SanPham?.Gia ?? 0)
                    * x.SoLuong);

            return View(data);
        }

        // =========================================
        // THÊM GIỎ
        // =========================================
        [HttpPost("ThemVaoGio")]
        public async Task<IActionResult> ThemVaoGio(
            int maSanPham,
            int soLuong = 1)
        {
            int? maNguoiDung =
                HttpContext.Session
                .GetInt32("MaNguoiDung");

            if (maNguoiDung == null)
            {
                return Json(new
                {
                    success = false,
                    message = "Vui lòng đăng nhập"
                });
            }

            var result =
                await _gioHangBAL
                .ThemVaoGioAsync(
                    maNguoiDung.Value,
                    maSanPham,
                    soLuong);

            return Json(new
            {
                success = result.Item1,
                message = result.Item2
            });
        }

        // =========================================
        // MUA NGAY
        // =========================================
        [HttpPost("MuaNgay")]
        public async Task<IActionResult> MuaNgay(
            int maSanPham,
            int soLuong = 1)
        {
            int? maNguoiDung =
                HttpContext.Session
                .GetInt32("MaNguoiDung");

            if (maNguoiDung == null)
            {
                return Json(new
                {
                    success = false,
                    message = "Vui lòng đăng nhập"
                });
            }

            var result =
                await _gioHangBAL
                .MuaNgayAsync(
                    maNguoiDung.Value,
                    maSanPham,
                    soLuong);

            return Json(new
            {
                success = result.Item1,
                message = result.Item2
            });
        }

        // =========================================
        // XOÁ
        // =========================================
        [HttpPost("Xoa")]
        public async Task<IActionResult> Xoa(int id)
        {
            var result =
                await _gioHangBAL.XoaAsync(id);

            return Json(new
            {
                success = result.Item1,
                message = result.Item2
            });
        }

        // =========================================
        // TĂNG
        // =========================================
        [HttpPost("Tang")]
        public async Task<IActionResult> Tang(int id)
        {
            var result =
                await _gioHangBAL.TangAsync(id);

            return Json(new
            {
                success = result.Item1,
                message = result.Item2
            });
        }

        // =========================================
        // GIẢM
        // =========================================
        [HttpPost("Giam")]
        public async Task<IActionResult> Giam(int id)
        {
            var result =
                await _gioHangBAL.GiamAsync(id);

            return Json(new
            {
                success = result.Item1,
                message = result.Item2
            });
        }
    }
}