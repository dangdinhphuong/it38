using Microsoft.EntityFrameworkCore;
using ShopeeClone.Models;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.DATA
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(
            DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Model_DB.NguoiDung> NguoiDungs { get; set; }
        public DbSet<Model_DB.SanPham> SanPhams { get; set; }
        public DbSet<Model_DB.DanhMuc> DanhMucs { get; set; }
        public DbSet<Model_DB.GioHang> GioHangs { get; set; }
        public DbSet<Model_DB.ChiTietGioHang> ChiTietGioHangs { get; set; }
        public DbSet<Model_DB.DonHang> DonHangs { get; set; }
        public DbSet<Model_DB.ChiTietDonHang> ChiTietDonHangs { get; set; }

        public DbSet<TopSanPhamBanChayModel> TopSanPhamBanChay { get; set; }

        protected override void OnModelCreating(
            ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // =========================
            // TÊN BẢNG + TRIGGERS
            // =========================

            modelBuilder.Entity<Model_DB.NguoiDung>()
                .ToTable("NguoiDung");

            modelBuilder.Entity<Model_DB.DanhMuc>()
                .ToTable("DanhMuc");

            modelBuilder.Entity<Model_DB.GioHang>()
                .ToTable("GioHang");

            modelBuilder.Entity<Model_DB.ChiTietGioHang>()
                .ToTable("ChiTietGioHang");

            modelBuilder.Entity<Model_DB.DonHang>()
                .ToTable("DonHang");

            modelBuilder.Entity<Model_DB.SanPham>()
                .ToTable("SanPham", tb =>
                {
                    tb.HasTrigger("trg_UpdateTrangThaiSanPham");
                    tb.HasTrigger("trg_KhongXoaSanPhamDaBan");
                });

            modelBuilder.Entity<Model_DB.ChiTietDonHang>()
                .ToTable("ChiTietDonHang", tb =>
                {
                    tb.HasTrigger("trg_CheckSoLuong");
                    tb.HasTrigger("trg_TruKho");
                    tb.HasTrigger("trg_TinhTongTien");
                });

            // =========================================
            // ENUM -> STRING
            // =========================================

            modelBuilder.Entity<Model_DB.SanPham>()
               .Property(p => p.TrangThai)
               .HasConversion(
                   v => v == TrangThaiSanPham.ConHang
                        ? "Còn hàng"
                        : v == TrangThaiSanPham.HetHang
                        ? "Hết hàng"
                        : "Dừng bán",

                   v => v == "Còn hàng"
                        ? TrangThaiSanPham.ConHang
                        : v == "Hết hàng"
                        ? TrangThaiSanPham.HetHang
                        : TrangThaiSanPham.DungBan
               );

            // =========================================
            // UNIQUE
            // =========================================

            modelBuilder.Entity<Model_DB.ChiTietGioHang>()
                .HasIndex(c =>
                    new
                    {
                        c.MaGioHang,
                        c.MaSanPham
                    })
                .IsUnique();

            // =========================================
            // RELATIONSHIPS
            // =========================================

            modelBuilder.Entity<Model_DB.GioHang>()
                .HasOne(g => g.NguoiDung)
                .WithOne(u => u.GioHang)
                .HasForeignKey<Model_DB.GioHang>(
                    g => g.MaNguoiDung)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Model_DB.DonHang>()
                .HasOne(d => d.NguoiDung)
                .WithMany(u => u.DonHangs)
                .HasForeignKey(d => d.MaNguoiDung)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Model_DB.SanPham>()
                .HasOne(p => p.DanhMuc)
                .WithMany(d => d.SanPhams)
                .HasForeignKey(p => p.MaDanhMuc)
                .OnDelete(DeleteBehavior.SetNull);

            // =========================================
            // VIEW MODEL
            // =========================================

            modelBuilder.Entity<TopSanPhamBanChayModel>()
                .HasNoKey();
        }
    }
}