using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ShopeeClone.Models;

namespace ShopeeClone.DTOS
{
    public class Dto_DB
    {
        // ================================
        // NGUOI DUNG
        // ================================
        public class NguoiDungCreateDTO
        {
            [Required(ErrorMessage = "Tên đăng nhập là bắt buộc")]
            public string? TenDangNhap { get; set; }

            [Required(ErrorMessage = "Mật khẩu là bắt buộc")]
            [MinLength(6, ErrorMessage = "Mật khẩu phải >= 6 ký tự")]
            public string? MatKhau { get; set; }

            public string? HoTen { get; set; }

            public string? DiaChi { get; set; }

            public string? SoDienThoai { get; set; }

            [EmailAddress]
            public string? Email { get; set; }
        }

        public class NguoiDungLoginDTO
        {
            [Required]
            public string? TenDangNhap { get; set; }
            [Required]
            public string? MatKhau { get; set; }
        }

        public class NguoiDungResponseDTO
        {
            public int MaNguoiDung { get; set; }
            public string? TenDangNhap { get; set; }
            public string? HoTen { get; set; }
            public string? Email { get; set; }
            public string? VaiTro { get; set; }
        }

        // ================================
        // SAN PHAM
        // ================================
        public class SanPhamCreateDTO
        {
            [Required(ErrorMessage = "Tên sản phẩm là bắt buộc")]
            public string? TenSanPham { get; set; }

            public string? MoTa { get; set; }

            [Required(ErrorMessage = "Giá bán là bắt buộc")]
            [Range(0, double.MaxValue, ErrorMessage = "Giá không được âm")]
            public decimal Gia { get; set; }

            [Range(0, int.MaxValue, ErrorMessage = "Số lượng không hợp lệ")]
            public int SoLuongTon { get; set; }

            public int? MaDanhMuc { get; set; }

        }

        public class SanPhamUpdateDTO
        {
            public string? TenSanPham { get; set; }
            public string? MoTa { get; set; }

            public decimal? Gia { get; set; }

            public int? SoLuongTon { get; set; }

            public TrangThaiSanPham? TrangThai { get; set; }
        }

        public class SanPhamResponseDTO
        {
            public int MaSanPham { get; set; }
            public string? TenSanPham { get; set; }
            public string? MoTa { get; set; }
            public decimal Gia { get; set; }
            public int SoLuongTon { get; set; }

            // Đường dẫn ảnh (có thể xử lý ở Service để thêm URL đầy đủ)
            public string? HinhAnh { get; set; }

            public TrangThaiSanPham TrangThai { get; set; }

            public string? TenDanhMuc { get; set; }
        }

        // ================================
        // GIO HANG
        // ================================
        public class GioHangItemDTO
        {
            public int MaSanPham { get; set; }
            public string? TenSanPham { get; set; }
            public string? HinhAnh { get; set; }
            public decimal Gia { get; set; }
            public int SoLuong { get; set; }
        }

        public class GioHangResponseDTO
        {
            public int MaGioHang { get; set; }
            public required List<GioHangItemDTO> Items { get; set; }
            public decimal TongTien { get; set; }
        }

        public class ThemGioHangDTO
        {
            public int MaSanPham { get; set; }
            [Range(1, int.MaxValue)]
            public int SoLuong { get; set; } = 1; // Mặc định thêm 1
        }

        // ================================
        // DON HANG
        // ================================

        public class DonHangResponseDTO
        {
            public int MaDonHang { get; set; }
            public DateTime NgayDat { get; set; }
            public decimal TongTien { get; set; }
            public string? TrangThai { get; set; } 

            public required List<ChiTietDonHangDTO> ChiTiet { get; set; }
        }

        public class ChiTietDonHangDTO
        {
            public int MaSanPham { get; set; }
            public string? TenSanPham { get; set; }
            public int SoLuong { get; set; }
            public decimal DonGia { get; set; }
            public decimal ThanhTien { get; set; } // Tổng tiền dòng
        }
    }
}