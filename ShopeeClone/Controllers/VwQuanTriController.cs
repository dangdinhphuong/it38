using Microsoft.AspNetCore.Mvc;
using ShopeeClone.BAL;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.Controllers
{
    public class VwQuanTriController : Controller
    {
        private readonly QuanTriBAL _quanTriBAL;

        public VwQuanTriController(
            QuanTriBAL quanTriBAL)
        {
            _quanTriBAL = quanTriBAL;
        }

        // =========================================
        // DASHBOARD
        // =========================================

        public async Task<IActionResult> Dashboard()
        {
            ViewBag.TongSanPham =
                await _quanTriBAL.DemSanPham();

            ViewBag.TongDanhMuc =
                await _quanTriBAL.DemDanhMuc();

            ViewBag.TongDonHang =
                await _quanTriBAL.DemDonHang();

            ViewBag.TongNguoiDung =
                await _quanTriBAL.DemNguoiDung();

            ViewBag.DoanhThu =
                await _quanTriBAL.TongDoanhThu();

            ViewBag.TopSanPham =
                await _quanTriBAL.TopSanPhamBanChay();

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetDashboardData()
        {
            return Json(new
            {
                tongSanPham =
                    await _quanTriBAL.DemSanPham(),

                tongDanhMuc =
                    await _quanTriBAL.DemDanhMuc(),

                tongDonHang =
                    await _quanTriBAL.DemDonHang(),

                tongNguoiDung =
                    await _quanTriBAL.DemNguoiDung(),

                doanhThu =
                    await _quanTriBAL.TongDoanhThu(),

                topSanPham =
                    (await _quanTriBAL.TopSanPhamBanChay())
                    .Select(x => new
                    {
                        tenSanPham = x.TenSanPham,
                        tongBan = x.TongBan
                    })
            });
        }

        // =========================================
        // DANH MỤC
        // =========================================

        public async Task<IActionResult> DanhMuc()
        {
            var data =
                await _quanTriBAL.LayDanhSachDanhMuc();

            return View(data);
        }

        [HttpPost]
        public async Task<IActionResult> ThemDanhMuc(
            DanhMuc model,
            IFormFile? fileAnh)
        {
            try
            {
                if (fileAnh != null && fileAnh.Length > 0)
                {
                    string folder =
                        Path.Combine(
                            Directory.GetCurrentDirectory(),
                            "wwwroot/uploads");

                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    string fileName =
                        Guid.NewGuid().ToString() +
                        Path.GetExtension(fileAnh.FileName);

                    string path =
                        Path.Combine(folder, fileName);

                    using (var stream =
                        new FileStream(path, FileMode.Create))
                    {
                        await fileAnh.CopyToAsync(stream);
                    }

                    model.HinhAnh =
                        "/uploads/" + fileName;
                }

                await _quanTriBAL.ThemDanhMuc(model);

                return Json(new
                {
                    success = true,

                    data = new
                    {
                        maDanhMuc = model.MaDanhMuc,
                        tenDanhMuc = model.TenDanhMuc,
                        hinhAnh = model.HinhAnh
                    }
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> SuaDanhMuc(
            DanhMuc model,
            IFormFile? fileAnh)
        {
            try
            {
                var dsDanhMuc =
                    await _quanTriBAL.LayDanhSachDanhMuc();

                var old =
                    dsDanhMuc.FirstOrDefault(x =>
                        x.MaDanhMuc == model.MaDanhMuc);

                if (old == null)
                {
                    return Json(new
                    {
                        success = false,
                        message = "Không tìm thấy danh mục"
                    });
                }

                if (fileAnh != null && fileAnh.Length > 0)
                {
                    string folder =
                        Path.Combine(
                            Directory.GetCurrentDirectory(),
                            "wwwroot/uploads");

                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    string fileName =
                        Guid.NewGuid().ToString() +
                        Path.GetExtension(fileAnh.FileName);

                    string path =
                        Path.Combine(folder, fileName);

                    using (var stream =
                        new FileStream(path, FileMode.Create))
                    {
                        await fileAnh.CopyToAsync(stream);
                    }

                    model.HinhAnh =
                        "/uploads/" + fileName;
                }
                else
                {
                    model.HinhAnh = old.HinhAnh;
                }

                await _quanTriBAL.SuaDanhMuc(model);

                return Json(new
                {
                    success = true,

                    data = new
                    {
                        maDanhMuc = model.MaDanhMuc,
                        tenDanhMuc = model.TenDanhMuc,
                        hinhAnh = model.HinhAnh
                    }
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> XoaDanhMuc(
            int id)
        {
            try
            {
                await _quanTriBAL.XoaDanhMuc(id);

                return Json(new
                {
                    success = true
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        // =========================================
        // SẢN PHẨM
        // =========================================

        public async Task<IActionResult> SanPham(
            string? keyword)
        {
            var data =
                await _quanTriBAL
                    .LayDanhSachSanPham(keyword ?? "");

            ViewBag.DanhMuc =
                await _quanTriBAL
                    .LayDanhSachDanhMuc();

            return View(data);
        }

        public async Task<IActionResult> SanPhamTheoDanhMuc(
            int id)
        {
            var data =
                await _quanTriBAL
                    .LayDanhSachSanPham("");

            ViewBag.DanhMuc =
                await _quanTriBAL
                    .LayDanhSachDanhMuc();

            data = data.Where(x =>
                x.MaDanhMuc == id)
                .ToList();

            return View("SanPham", data);
        }

        [HttpPost]
        public async Task<IActionResult> ThemSanPham(
            SanPham model,
            IFormFile? fileAnh)
        {
            try
            {
                if (fileAnh != null && fileAnh.Length > 0)
                {
                    string folder =
                        Path.Combine(
                            Directory.GetCurrentDirectory(),
                            "wwwroot/uploads");

                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    string fileName =
                        Guid.NewGuid().ToString() +
                        Path.GetExtension(fileAnh.FileName);

                    string path =
                        Path.Combine(folder, fileName);

                    using (var stream =
                           new FileStream(path, FileMode.Create))
                    {
                        await fileAnh.CopyToAsync(stream);
                    }

                    model.HinhAnh =
                        "/uploads/" + fileName;
                }

                await _quanTriBAL.ThemSanPham(model);

                var dsDanhMuc =
                    await _quanTriBAL.LayDanhSachDanhMuc();

                var tenDanhMuc =
                    dsDanhMuc.FirstOrDefault(x =>
                        x.MaDanhMuc == model.MaDanhMuc)
                    ?.TenDanhMuc;

                return Json(new
                {
                    success = true,

                    data = new
                    {
                        maSanPham = model.MaSanPham,
                        tenSanPham = model.TenSanPham,
                        gia = model.Gia,
                        soLuongTon = model.SoLuongTon,
                        trangThai = model.TrangThai,
                        hinhAnh = model.HinhAnh,
                        tenDanhMuc = tenDanhMuc
                    }
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> SuaSanPham(
            SanPham model,
            IFormFile? fileAnh)
        {
            try
            {
                var dsSanPham =
                    await _quanTriBAL
                        .LayDanhSachSanPham("");

                var old =
                    dsSanPham.FirstOrDefault(x =>
                        x.MaSanPham == model.MaSanPham);

                if (old == null)
                {
                    return Json(new
                    {
                        success = false,
                        message = "Không tìm thấy sản phẩm"
                    });
                }

                if (fileAnh != null && fileAnh.Length > 0)
                {
                    string folder =
                        Path.Combine(
                            Directory.GetCurrentDirectory(),
                            "wwwroot/uploads");

                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    string fileName =
                        Guid.NewGuid().ToString() +
                        Path.GetExtension(fileAnh.FileName);

                    string path =
                        Path.Combine(folder, fileName);

                    using (var stream =
                           new FileStream(path, FileMode.Create))
                    {
                        await fileAnh.CopyToAsync(stream);
                    }

                    model.HinhAnh =
                        "/uploads/" + fileName;
                }
                else
                {
                    model.HinhAnh = old.HinhAnh;
                }

                await _quanTriBAL.SuaSanPham(model);

                var dsDanhMuc =
                    await _quanTriBAL.LayDanhSachDanhMuc();

                var tenDanhMuc =
                    dsDanhMuc.FirstOrDefault(x =>
                        x.MaDanhMuc == model.MaDanhMuc)
                    ?.TenDanhMuc;

                return Json(new
                {
                    success = true,

                    data = new
                    {
                        maSanPham = model.MaSanPham,
                        tenSanPham = model.TenSanPham,
                        gia = model.Gia,
                        soLuongTon = model.SoLuongTon,
                        trangThai = model.TrangThai,
                        hinhAnh = model.HinhAnh,
                        tenDanhMuc = tenDanhMuc
                    }
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> XoaSanPham(
            int id)
        {
            try
            {
                await _quanTriBAL.XoaSanPham(id);

                return Json(new
                {
                    success = true
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        // =========================================
        // ĐƠN HÀNG
        // =========================================

        public async Task<IActionResult> DonHang()
        {
            var data =
                await _quanTriBAL
                    .LayDanhSachDonHang();

            return View(data);
        }

        [HttpPost]
        public async Task<IActionResult> DuyetDon(
            int id)
        {
            try
            {
                await _quanTriBAL.DuyetDon(id);

                return Json(new
                {
                    success = true
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> HuyDon(
            int id)
        {
            try
            {
                await _quanTriBAL.HuyDon(id);

                return Json(new
                {
                    success = true
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }
    }
}