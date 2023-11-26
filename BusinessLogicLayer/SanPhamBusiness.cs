using BusinessLogicLayer;
using DataAccessLayer;
using DataModel;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class SanPhamBusiness:ISanPhamBusiness
    {
        private ISanPhamRepository _res;
        public SanPhamBusiness(ISanPhamRepository res)
        {
            _res = res;
        }
        public SanPhamModel GetChiTietSanPham(int id)

        {
            return _res.GetChiTietSanPham(id);
        }
      
        public  bool Create(SanPhamModel model)
        {
            return _res.Create(model);
        }
        public bool Update(SanPhamModel model)
        {
            return _res.Update(model);
        }
        public List<SanPhamModel> GetDanhSachSanPham()
        {
            return _res.GetDanhSachSanPham();
        }
        public bool Delete(int maSanPham)
        {
            return _res.Delete(maSanPham);
        }
        public List<ChiTietSanPhamModel> GetDanhSachChiTietSanPham()
        {
            return _res.GetDanhSachChiTietSanPham();
        }
    }
}