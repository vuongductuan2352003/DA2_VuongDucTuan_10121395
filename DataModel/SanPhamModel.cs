using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class SanPhamModel
    {
        public int MaSanPham { get; set; }
        public int MaDanhMuc { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }        
        public decimal Gia { get; set; }
        public int SoLuong { get; set; }
        public string NhaSanXuat { get; set; }

        public string BaoHanh { get; set; }
        public List<ChiTietSanPhamModel> list_json_chitietsanpham { get; set; }
    }
    public class ChiTietSanPhamModel
    {
        public int MaChiTietSanPham { get; set; }
        public int MaChiTietDanhMuc { get; set; }
        public int MaSanPham { get; set; }
        
        public string MoTa { get; set; }
    

    }
}
