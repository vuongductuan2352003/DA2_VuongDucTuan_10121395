using BusinessLogicLayer;
using DataAccessLayer;
using DataModel;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class DatHangBusiness: IDatHangBusiness
    {
        private IDatHangRepository _res;
        public DatHangBusiness(IDatHangRepository res)
        {
            _res = res;
        }
        public bool Create(DatHangModel model)
        {
            return _res.Create(model);
        }
    }
}
