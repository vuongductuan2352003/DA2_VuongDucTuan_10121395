using DataModel;

namespace DataAccessLayer
{
    public class DanhMucRepository:IDanhMucRepository
    {
        private IDatabaseHelper _dbHelper;
        public DanhMucRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public List<DanhMucModel> GetDanhSachDanhMuc()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetDanhSachDanhMuc");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);

                List<DanhMucModel> danhMucList = dt.ConvertTo<DanhMucModel>().ToList();
                return danhMucList.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ChiTietDanhMucModel> GetDanhSachChiTietDanhMuc()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetDanhSachChiTietDanhMuc");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);

                List<ChiTietDanhMucModel> CTDanhMucList = dt.ConvertTo<ChiTietDanhMucModel>().ToList();
                return CTDanhMucList.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
