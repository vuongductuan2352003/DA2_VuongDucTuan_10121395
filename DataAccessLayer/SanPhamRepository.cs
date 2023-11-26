using DataModel;

namespace DataAccessLayer
{
    public class SanPhamRepository: ISanPhamRepository
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public SanPhamModel GetChiTietSanPham(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetSanPhamById",
                     "@id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

     
        public bool Delete(int maSanPham)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "XOA_SAN_PHAM",
                    "@MaSanPham", maSanPham);

                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
     

        public bool Create(SanPhamModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "THEM_SAN_PHAM",
              
                "@MaDanhMuc", model.MaDanhMuc,
                "@TenSanPham", model.TenSanPham,
                "@AnhDaiDien", model.AnhDaiDien,
                "@Gia", model.Gia,
                "@NhaSanXuat", model.NhaSanXuat,
                 "@BaoHanh", model.BaoHanh,

                "@list_json_chitietsanpham", model.list_json_chitietsanpham != null ? MessageConvert.SerializeObject(model.list_json_chitietsanpham) : null);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
              
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
      
        public bool Update(SanPhamModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_update",
                "@MaSanPham", model.MaSanPham,
                "@MaDanhMuc", model.MaDanhMuc,
                "@TenSanPham", model.TenSanPham,
                "@AnhDaiDien", model.AnhDaiDien,
                "@Gia", model.Gia,
                "@NhaSanXuat", model.NhaSanXuat,
                  "@BaoHanh", model.BaoHanh,
                "@list_json_chitietsanpham", model.list_json_chitietsanpham != null ? MessageConvert.SerializeObject(model.list_json_chitietsanpham) : null);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<ThongKeKhachModel> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thong_ke_khach",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_khach", ten_khach,
                    "@fr_NgayTao", fr_NgayTao,
                    "@to_NgayTao", to_NgayTao
                     );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<ThongKeKhachModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPhamModel> GetDanhSachSanPham()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetDanhSachSanPham");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);

                List<SanPhamModel> sanPhamList = dt.ConvertTo<SanPhamModel>().ToList();
                return sanPhamList.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ChiTietSanPhamModel> GetDanhSachChiTietSanPham()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetDanhSachChiTietSanPham");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);

                List<ChiTietSanPhamModel> CTDanhMucList = dt.ConvertTo<ChiTietSanPhamModel>().ToList();
                return CTDanhMucList.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
