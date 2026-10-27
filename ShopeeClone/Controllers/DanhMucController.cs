using Microsoft.AspNetCore.Mvc;
using ShopeeClone.BAL;
using ShopeeClone.Models;
using System.Linq;
using System.Threading.Tasks;
using static ShopeeClone.Models.Model_DB;

namespace ShopeeClone.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]")]
    public class DanhMucController : ControllerBase
    {
        private readonly DanhMucBAL _danhMucBAL;

        public DanhMucController(DanhMucBAL danhMucBAL)
        {
            _danhMucBAL = danhMucBAL;
        }

        // GET: api/danhmuc
        [HttpGet]
        public async Task<IActionResult> GetDanhMuc()
        {
            var data = await _danhMucBAL.GetDanhMuc();

            return Ok(data);
        }

        // GET: api/danhmuc/1
        [HttpGet("{id}")]
        public async Task<IActionResult> GetDanhMucById(int id)
        {
            var data =
                (IEnumerable<DanhMuc>)await _danhMucBAL.GetDanhMuc();

            var danhMuc =
                data.FirstOrDefault(x => x.MaDanhMuc == id);

            if (danhMuc == null)
            {
                return NotFound(new
                {
                    success = false,
                    message = "Không tìm thấy danh mục"
                });
            }

            return Ok(danhMuc);
        }
    }
}