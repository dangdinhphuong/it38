using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShopeeClone.Models
{
    // =========================================
    // ENUM TRẠNG THÁI SẢN PHẨM 
    // =========================================
    public enum TrangThaiSanPham
    {
        [Display(Name = "Còn hàng")]
        ConHang = 0,

        [Display(Name = "Hết hàng")]
        HetHang = 1,

        [Display(Name = "Dừng bán")]
        DungBan = 2
    }

    public class Model_DB
    {
        // ================================
        // NGUOI DUNG
        // ================================
        public class NguoiDung
        {
            [Key]
            public int MaNguoiDung { get; set; }

            [Required]
            [StringLength(50)]
            public string? TenDangNhap { get; set; }

            [Required]
            public string? MatKhau { get; set; }

            [StringLength(100)]
            public string? HoTen { get; set; }

            [EmailAddress]
            [StringLength(100)]
            public string? Email { get; set; }

            [StringLength(255)]
            public string? DiaChi { get; set; }

            [StringLength(20)]
            public string? SoDienThoai { get; set; }

            [StringLength(50)]
            public string? VaiTro { get; set; }

            public DateTime NgayTao { get; set; }
                = DateTime.Now;

            public bool TrangThai { get; set; }
                = true;

            // =========================
            // NAVIGATION
            // =========================

            public virtual GioHang? GioHang { get; set; }

            public virtual List<DonHang>? DonHangs { get; set; }
        }

        // ================================
        // DANH MUC
        // ================================
        public class DanhMuc
        {
            [Key]
            public int MaDanhMuc { get; set; }

            [Required]
            public string? TenDanhMuc { get; set; }
            public string? HinhAnh { get; set; }

            public virtual List<SanPham>? SanPhams { get; set; }
        }

        // ================================
        // SAN PHAM (Đã sửa dùng Enum)
        // ================================
        public class SanPham
        {
            [Key]
            public int MaSanPham { get; set; }

            [Required]
            public string? TenSanPham { get; set; }

            public string? MoTa { get; set; }

            [Range(0, double.MaxValue)]
            public decimal Gia { get; set; }

            [Range(0, int.MaxValue)]
            public int SoLuongTon { get; set; }

            public string? HinhAnh { get; set; }

            public int? MaDanhMuc { get; set; }

            public DateTime NgayTao { get; set; } = DateTime.Now;

            [Required]
            public TrangThaiSanPham TrangThai { get; set; } = TrangThaiSanPham.ConHang;

            // Navigation
            [ForeignKey("MaDanhMuc")]
            public virtual DanhMuc? DanhMuc { get; set; }

            public virtual List<ChiTietGioHang>? ChiTietGioHangs { get; set; }
            public virtual List<ChiTietDonHang>? ChiTietDonHangs { get; set; }
        }

        // ================================
        // GIO HANG
        // ================================
        public class GioHang
        {
            [Key]
            public int MaGioHang { get; set; }

            public int? MaNguoiDung { get; set; }

            public DateTime NgayTao { get; set; } = DateTime.Now;

            [ForeignKey("MaNguoiDung")]
            public virtual NguoiDung? NguoiDung { get; set; }

            public virtual List<ChiTietGioHang>? ChiTietGioHangs { get; set; }
        }

        // ================================
        // CHI TIET GIO HANG
        // ================================
        public class ChiTietGioHang
        {
            [Key]
            public int MaCTGioHang { get; set; }

            public int MaGioHang { get; set; }
            public int MaSanPham { get; set; }

            [Range(1, int.MaxValue)]
            public int SoLuong { get; set; }

            [ForeignKey("MaGioHang")]
            public virtual GioHang? GioHang { get; set; }

            [ForeignKey("MaSanPham")]
            public virtual SanPham? SanPham { get; set; }
        }

        // ================================
        // DON HANG
        // ================================
        public class DonHang
        {
            [Key]
            public int MaDonHang { get; set; }

            public int MaNguoiDung { get; set; }

            public DateTime NgayDat { get; set; } = DateTime.Now;

            public decimal TongTien { get; set; }

            public string? TrangThai { get; set; }

            [ForeignKey("MaNguoiDung")]
            public virtual NguoiDung? NguoiDung { get; set; }

            public virtual List<ChiTietDonHang>? ChiTietDonHangs { get; set; }
        }

        // ================================
        // CHI TIET DON HANG
        // ================================
        public class ChiTietDonHang
        {
            [Key]
            public int MaCTDonHang { get; set; }

            public int MaDonHang { get; set; }
            public int MaSanPham { get; set; }

            [Range(1, int.MaxValue)]
            public int SoLuong { get; set; }

            [Range(0, double.MaxValue)]
            public decimal DonGia { get; set; }

            [ForeignKey("MaDonHang")]
            public virtual DonHang? DonHang { get; set; }

            [ForeignKey("MaSanPham")]
            public virtual SanPham? SanPham { get; set; }
        }

        //Top sản phẩm bán chạy
        public class TopSanPhamBanChayModel
        {
            public string? TenSanPham { get; set; }
            public int TongBan { get; set; }
        }
    }
}