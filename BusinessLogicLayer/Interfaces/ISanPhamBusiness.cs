using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public partial interface ISanPhamBusiness
    {
        public SanPhamModel GetChiTietSanPham(int id);

        List<SanPhamModel> GetDanhSachSanPham();
        bool Create(SanPhamModel model);
        public bool Update(SanPhamModel model);
        public List<ChiTietSanPhamModel> GetDanhSachChiTietSanPham();
        public bool Delete(int maSanPham);
    }
}
