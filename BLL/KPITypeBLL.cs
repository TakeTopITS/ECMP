using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class KPITypeBLL
    {
        public void AddKPIType(KPIType kpiType)
        {
            KPITypeDAL dal = new KPITypeDAL();
            dal.AddKPIType(kpiType);
        }

        public void UpdateKPIType(KPIType kpiType, string Type)
        {
            KPITypeDAL dal = new KPITypeDAL();
            dal.UpdateKPIType(kpiType, Type);
        }

        public void DeleteKPIType(KPIType kpiType)
        {
            KPITypeDAL dal = new KPITypeDAL();
            dal.DeleteKPIType(kpiType);
        }

        public IList GetAllKPITypes(string strHQL)
        {
            KPITypeDAL dal = new KPITypeDAL();
            return dal.GetAllKPITypes(strHQL);
        }
    }
}