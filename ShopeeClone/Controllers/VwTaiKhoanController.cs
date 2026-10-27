using Microsoft.AspNetCore.Mvc;
using ShopeeClone.BAL;
using ShopeeClone.Models.ViewModels;

namespace ShopeeClone.Controllers
{
    public class VwTaiKhoanController : Controller
    {
        private readonly TaiKhoanBAL _taiKhoanBAL;

        public VwTaiKhoanController(
            TaiKhoanBAL taiKhoanBAL)
        {
            _taiKhoanBAL = taiKhoanBAL;
        }

        // =========================
        // ĐĂNG NHẬP
        // =========================

        [HttpGet]
        public IActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> DangNhap(
            DangNhapViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            var user = await _taiKhoanBAL.DangNhap(
                model.TenDangNhap ?? "",
                model.MatKhau ?? ""
            );

            if (user == null)
            {
                TempData["Error"] =
                    "Sai tài khoản hoặc mật khẩu";

                return View(model);
            }

            // =====================================
            // LƯU SESSION
            // =====================================

            HttpContext.Session.SetString(
                "TenDangNhap",
                user.TenDangNhap ?? ""
            );

            HttpContext.Session.SetInt32(
                "MaNguoiDung",
                user.MaNguoiDung
            );

            HttpContext.Session.SetString(
                "VaiTro",
                user.VaiTro ?? ""
            );

            // =====================================
            // ADMIN -> CHUYỂN TRANG QUẢN TRỊ
            // =====================================

            if (!string.IsNullOrEmpty(user.VaiTro) &&
                user.VaiTro.Trim().ToLower() == "admin")
            {
                return RedirectToAction(
                    "Dashboard",
                    "VwQuanTri"
                );
            }

            // =====================================
            // USER THƯỜNG
            // =====================================

            return RedirectToAction(
                "Index",
                "Home"
            );
        }

        // =========================
        // ĐĂNG KÝ
        // =========================

        [HttpGet]
        public IActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> DangKy(
            DangKyViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            try
            {
                await _taiKhoanBAL.DangKy(
                    model.TenDangNhap ?? "",
                    model.MatKhau ?? "",
                    model.HoTen ?? "",
                    model.Email ?? "",
                    model.DiaChi ?? "",
                    model.SoDienThoai ?? ""
                );

                TempData["Success"] =
                    "Đăng ký thành công";

                return RedirectToAction("DangNhap");
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;

                return View(model);
            }
        }

        // =========================
        // ĐĂNG XUẤT
        // =========================

        public IActionResult DangXuat()
        {
            HttpContext.Session.Clear();

            return RedirectToAction(
                "Index",
                "Home"
            );
        }

        // =========================
        // THÔNG TIN TÀI KHOẢN
        // =========================

        [HttpGet]
        public async Task<IActionResult> TaiKhoan()
        {
            int? maNguoiDung =
                HttpContext.Session.GetInt32("MaNguoiDung");

            if (maNguoiDung == null)
                return RedirectToAction("DangNhap");

            var user = await _taiKhoanBAL
                .LayThongTinNguoiDung(maNguoiDung.Value);

            if (user == null)
                return RedirectToAction("DangNhap");

            CapNhatThongTinViewModel model =
                new()
                {
                    MaNguoiDung = user.MaNguoiDung,
                    HoTen = user.HoTen,
                    Email = user.Email,
                    DiaChi = user.DiaChi,
                    SoDienThoai = user.SoDienThoai
                };

            return View(model);
        }

        // =========================
        // CẬP NHẬT THÔNG TIN
        // =========================

        [HttpPost]
        public async Task<IActionResult> TaiKhoan(
            CapNhatThongTinViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            try
            {
                await _taiKhoanBAL.CapNhatThongTin(
                    model.MaNguoiDung,
                    model.HoTen ?? "",
                    model.Email ?? "",
                    model.DiaChi ?? "",
                    model.SoDienThoai ?? ""
                );

                TempData["Success"] =
                    "Cập nhật thành công";
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
            }

            return View(model);
        }

        // =========================
        // ĐỔI MẬT KHẨU
        // =========================

        [HttpGet]
        public IActionResult DoiMatKhau()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> DoiMatKhau(
            DoiMatKhauViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            try
            {
                int? maNguoiDung =
                    HttpContext.Session.GetInt32("MaNguoiDung");

                if (maNguoiDung == null)
                    return RedirectToAction("DangNhap");

                await _taiKhoanBAL.DoiMatKhau(
                    maNguoiDung.Value,
                    model.MatKhauCu ?? "",
                    model.MatKhauMoi ?? ""
                );

                TempData["Success"] =
                    "Đổi mật khẩu thành công";

                return RedirectToAction("TaiKhoan");
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;

                return View(model);
            }
        }

        // =========================
        // QUÊN MẬT KHẨU
        // =========================

        [HttpGet]
        public IActionResult QuenMatKhau()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> QuenMatKhau(
            QuenMatKhauViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            try
            {
                var user =
                    await _taiKhoanBAL
                        .KiemTraLayLaiMatKhau(
                            model.TenDangNhap ?? "",
                            model.SoDienThoai ?? ""
                        );

                if (user == null)
                {
                    TempData["Error"] =
                        "Tên đăng nhập hoặc số điện thoại không đúng";

                    return View(model);
                }

                await _taiKhoanBAL.DatLaiMatKhau(
                    user.MaNguoiDung,
                    model.MatKhauMoi ?? ""
                );

                TempData["Success"] =
                    "Đặt lại mật khẩu thành công";

                return RedirectToAction("DangNhap");
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;

                return View(model);
            }
        }
    }
}