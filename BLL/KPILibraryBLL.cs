using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class KPILibraryBLL
    {
        public void AddKPILibrary(KPILibrary kpiLibrary)
        {
            KPILibraryDAL dal = new KPILibraryDAL();
            dal.AddKPILibrary(kpiLibrary);
        }

        public void UpdateKPILibrary(KPILibrary kpiLibrary, int ID)
        {
            KPILibraryDAL dal = new KPILibraryDAL();
            dal.UpdateKPILibrary(kpiLibrary, ID);
        }

        public void DeleteKPILibrary(KPILibrary kpiLibrary)
        {
            KPILibraryDAL dal = new KPILibraryDAL();
            dal.DeleteKPILibrary(kpiLibrary);
        }

        public IList GetAllKPILibrarys(string strHQL)
        {
            KPILibraryDAL dal = new KPILibraryDAL();
            return dal.GetAllKPILibrarys(strHQL);
        }
    }
}