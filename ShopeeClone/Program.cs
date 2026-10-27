using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;
using ShopeeClone.BAL;
using ShopeeClone.DAL;

var builder = WebApplication.CreateBuilder(args);

// ==========================================
// 1. ĐĂNG KÝ CƠ SỞ DỮ LIỆU
// ==========================================

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("DefaultConnection"),
        sql => sql.UseCompatibilityLevel(120)
    )
);
// ==========================================
// 2. ĐĂNG KÝ SESSION
// ==========================================

builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// ==========================================
// 3. ĐĂNG KÝ BAL & DAL
// ==========================================

builder.Services.AddScoped<DanhMucDAL>();
builder.Services.AddScoped<DanhMucBAL>();
builder.Services.AddScoped<TaiKhoanDAL>();
builder.Services.AddScoped<TaiKhoanBAL>();
builder.Services.AddScoped<QuanTriDAL>();
builder.Services.AddScoped<QuanTriBAL>();
builder.Services.AddScoped<GioHangDAL>();
builder.Services.AddScoped<GioHangBAL>();
builder.Services.AddScoped<DonHangDAL>();
builder.Services.AddScoped<DonHangBAL>();

// ==========================================
// 4. ADD CONTROLLERS
// ==========================================

builder.Services.AddControllersWithViews();

var app = builder.Build();


// ==========================================
// 5. CONFIGURE PIPELINE
// ==========================================

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
    app.UseHttpsRedirection();
}


// ==========================================
// STATIC FILES
// ==========================================

app.MapStaticAssets();

app.UseRouting();


// ==========================================
// 6. SESSION MIDDLEWARE
// ==========================================

app.UseSession();

app.UseAuthorization();


// ==========================================
// 7. ROUTE
// ==========================================

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();