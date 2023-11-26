using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class DatHangModel
    {
        public DateTime NgayTao { get; set; }
        public DateTime NgayDuyet { get; set; }
  
        public string TenKH { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string SDT { get; set; }
        public string Email { get; set; }
        public decimal TongGia { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
     

    }
}
