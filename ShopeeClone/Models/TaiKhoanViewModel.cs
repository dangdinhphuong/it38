using System.ComponentModel.DataAnnotations;

namespace ShopeeClone.Models.ViewModels
{
    // =========================================
    // ĐĂNG NHẬP
    // =========================================

    public class DangNhapViewModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
        public string? TenDangNhap { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string? MatKhau { get; set; }
    }

    // =========================================
    // ĐĂNG KÝ
    // =========================================

    public class DangKyViewModel
    {
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public string? HoTen { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
        public string? TenDangNhap { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        public string? SoDienThoai { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string? DiaChi { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [MinLength(6, ErrorMessage = "Mật khẩu phải >= 6 ký tự")]
        public string? MatKhau { get; set; }

        [Required(ErrorMessage = "Vui lòng xác nhận mật khẩu")]
        [Compare("MatKhau",
            ErrorMessage = "Mật khẩu xác nhận không khớp")]
        public string? XacNhanMatKhau { get; set; }
    }

    // =========================================
    // CẬP NHẬT THÔNG TIN
    // =========================================

    public class CapNhatThongTinViewModel
    {
        public int MaNguoiDung { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public string? HoTen { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        public string? SoDienThoai { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string? DiaChi { get; set; }
    }

    // =========================================
    // ĐỔI MẬT KHẨU
    // =========================================

    public class DoiMatKhauViewModel
    {
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu cũ")]
        public string? MatKhauCu { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu mới")]
        [MinLength(6,
            ErrorMessage = "Mật khẩu phải >= 6 ký tự")]
        public string? MatKhauMoi { get; set; }

        [Required(ErrorMessage = "Vui lòng xác nhận mật khẩu")]
        [Compare("MatKhauMoi",
            ErrorMessage = "Mật khẩu xác nhận không khớp")]
        public string? XacNhanMatKhauMoi { get; set; }
    }

    // =========================================
    // QUÊN MẬT KHẨU
    // =========================================

    public class QuenMatKhauViewModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
        public string? TenDangNhap { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        public string? SoDienThoai { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu mới")]
        [MinLength(6,
            ErrorMessage = "Mật khẩu phải >= 6 ký tự")]
        public string? MatKhauMoi { get; set; }

        [Required(ErrorMessage = "Vui lòng xác nhận mật khẩu")]
        [Compare("MatKhauMoi",
            ErrorMessage = "Mật khẩu xác nhận không khớp")]
        public string? XacNhanMatKhauMoi { get; set; }
    }
}