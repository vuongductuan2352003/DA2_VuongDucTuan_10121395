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
        public SanPhamModel GetChiTietSanPham(int id)
        {
            return _sanPhamBusiness.GetChiTietSanPham(id);
        }
      
      
        [Route("create-sp")]
        [HttpPost]
        public SanPhamModel CreateItem(SanPhamModel model)
        {
            _sanPhamBusiness.Create(model);
            return model;
        }
        [Route("update-sanpham")]
        [HttpPost]
        public SanPhamModel UpdateItem([FromBody] SanPhamModel model)
        {
            _sanPhamBusiness.Update(model);
            return model;
        }
        [Route("delete-san-pham")]
        [HttpPost]
        public bool DeleteItem([FromBody] int maSanPham)
        {
            try
            {
                // Call your repository or business logic to delete the product
                bool result = _sanPhamBusiness.Delete(maSanPham);

                // Return the result
                return result;
            }
            catch (Exception ex)
            {
                // Handle exceptions or log errors if needed
                throw ex;
            }
        }


        [Route("get-listSanPham")]
            [HttpGet]
            public List<SanPhamModel> GetDanhSachSanPham()
            {
                return _sanPhamBusiness.GetDanhSachSanPham();
            }
        [Route("get-listChiTietSanPham")]
        [HttpGet]
        public List<ChiTietSanPhamModel> GetDanhSachChiTietSanPham()
        {
            return _sanPhamBusiness.GetDanhSachChiTietSanPham();
        }


    }
}
