// =======================
// BAL/DanhMucBAL.cs
// =======================

using ShopeeClone.DAL;
using System.Threading.Tasks;

namespace ShopeeClone.BAL
{
    public class DanhMucBAL
    {
        private readonly DanhMucDAL _danhMucDAL;

        public DanhMucBAL(DanhMucDAL danhMucDAL)
        {
            _danhMucDAL = danhMucDAL;
        }

        public async Task<object> GetDanhMuc()
        {
            return await _danhMucDAL.GetDanhMuc();
        }
    }
}