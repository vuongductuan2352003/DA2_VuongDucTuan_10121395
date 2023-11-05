    using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public partial interface ISanPhamRepository
    {
        SanPhamModel GetChiTietSanPham(int id);
        public bool Create(ChiTietSanPhamModel model);
        List<SanPhamModel> GetDanhSachSanPham();
        public bool Create(SanPhamModel model);
        public bool Update(SanPhamModel model);
    }
}
                                                                                    