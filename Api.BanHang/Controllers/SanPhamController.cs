using BusinessLogicLayer;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.DoGoMyNghe.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness _sanPhamBusiness;
        public SanPhamController(ISanPhamBusiness sanPhamBusiness)
        {
            _sanPhamBusiness = sanPhamBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public SanPhamModel GetDatabyID(int id)
        {
            return _sanPhamBusiness.GetChiTietSanPham(id);
        }
        [Route("create-khachh")]
        [HttpPost]
        public ChiTietSanPhamModel CreateItem([FromBody] ChiTietSanPhamModel model)
        {
            _sanPhamBusiness.Create(model);
            return model;
        }
        [Route("create-sp")]
        [HttpPost]
        public SanPhamModel CreateItem(SanPhamModel model)
        {
            _sanPhamBusiness.Create(model);
            return model;
        }
        [Route("update-khach")]
        [HttpPost]
        public SanPhamModel UpdateItem([FromBody] SanPhamModel model)
        {
            _sanPhamBusiness.Update(model);
            return model;
        }

        [Route("get-listSanPham")]
            [HttpGet]
            public List<SanPhamModel> GetDanhSachSanPham()
            {
                return _sanPhamBusiness.GetDanhSachSanPham();
            }
        
    }
}
