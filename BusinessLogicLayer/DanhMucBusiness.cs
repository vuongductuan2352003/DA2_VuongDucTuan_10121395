using BusinessLogicLayer;
using DataAccessLayer;
using DataModel;
using System.Reflection;



namespace BusinessLogicLayer
{
    public class DanhMucBusiness: IDanhMucBusiness
    {
        private IDanhMucRepository _res;
        public DanhMucBusiness(IDanhMucRepository res)
        {
            _res = res;
        }
        public List<DanhMucModel> GetDanhSachDanhMuc()
        {
            return _res.GetDanhSachDanhMuc();
        }
    }
}
