// =======================
// DAL/DanhMucDAL.cs
// =======================

using Microsoft.EntityFrameworkCore;
using ShopeeClone.DATA;
using System.Linq;
using System.Threading.Tasks;

namespace ShopeeClone.DAL
{
    public class DanhMucDAL
    {
        private readonly ApplicationDbContext _context;

        public DanhMucDAL(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<object> GetDanhMuc()
        {
            var data = await _context.DanhMucs
                .OrderBy(x => x.MaDanhMuc)
                .Select(x => new
                {
                    x.MaDanhMuc,
                    x.TenDanhMuc,
                    x.HinhAnh
                })
                .ToListAsync();

            return data;
        }
    }
}