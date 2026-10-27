using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopeeClone.BAL;

namespace ShopeeClone.Controllers
{
    [Route("VwDonHang")]
    public class VwDonHangController : Controller
    {
        private readonly DonHangBAL _donHangBAL;

        public VwDonHangController(
            DonHangBAL donHangBAL)
        {
            _donHangBAL = donHangBAL;
        }

        // =====================================
        // DASHBOARD
        // =====================================
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
                await _donHangBAL
                .GetDashboardAsync(
                    maNguoiDung.Value);

            return View(data);
        }

        // =====================================
        // THANH TOÁN
        // =====================================
        [HttpPost("ThanhToan")]
        public async Task<IActionResult> ThanhToan(
            List<int> dsChiTiet)
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
                await _donHangBAL
                .ThanhToanAsync(
                    maNguoiDung.Value,
                    dsChiTiet);

            return Json(new
            {
                success = result.Item1,
                message = result.Item2
            });
        }
    }
}