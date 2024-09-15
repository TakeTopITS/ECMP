using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class KPILibraryDAL
    {
        private EntityControl control;

        public KPILibraryDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddKPILibrary(KPILibrary kpiLibrary)
        {
            control.AddEntity(kpiLibrary);
        }

        public void UpdateKPILibrary(KPILibrary kpiLibrary, int ID)
        {
            control.UpdateEntity(kpiLibrary, ID);
        }

        public void DeleteKPILibrary(KPILibrary kpiLibrary)
        {
            control.DeleteEntity(kpiLibrary);
        }

        public IList GetAllKPILibrarys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}