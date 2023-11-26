using DataModel;
namespace DataAccessLayer
{
    public class DatHangRepository : IDatHangRepository
    {
        private IDatabaseHelper _dbHelper;
        public DatHangRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public bool Create(DatHangModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "PlaceOrder",
                "@NgayTao", DateTime.Now,
                "@NgayDuyet", DateTime.Now,
                "@TenKH", model.TenKH,
                 "@GioiTinh", model.GioiTinh,
                  "@DiaChi", model.DiaChi,
                    "@SDT", model.SDT,
                      "@Email", model.Email,
                        "@TongGia", model.TongGia,
                          "@MaSanPham", model.MaSanPham,
                            "@SoLuong", model.SoLuong);


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
    }
}
