using BusinessLogicLayer;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
namespace Api.DoGoMyNghe.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class DanhMucController : ControllerBase
    {
        private IDanhMucBusiness _danhMucBusiness;
        public DanhMucController(IDanhMucBusiness danhMucBusiness)
        {
            _danhMucBusiness = danhMucBusiness;
        }
        [Route("get-listDanhMuc")]
        [HttpGet]
        public List<DanhMucModel> GetDanhSachDanhMuc()
        {
            return _danhMucBusiness.GetDanhSachDanhMuc();
        }
    }
}
