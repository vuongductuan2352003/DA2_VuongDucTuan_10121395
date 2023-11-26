using BusinessLogicLayer;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.DoGoMyNghe.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class DatHangController: ControllerBase
    {
        private IDatHangBusiness _datHangBusiness;
        public DatHangController(IDatHangBusiness datHangBusiness)
        {
            _datHangBusiness = datHangBusiness;
        }
        [Route("create-DatHang")]
        [HttpPost]
        public DatHangModel CreateItem([FromBody] DatHangModel model)
        {
            _datHangBusiness.Create(model);
            return model;
        }
    }
}
