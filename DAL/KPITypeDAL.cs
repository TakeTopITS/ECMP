using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class KPITypeDAL
    {
        private EntityControl control;

        public KPITypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddKPIType(KPIType kpiType)
        {
            control.AddEntity(kpiType);
        }

        public void UpdateKPIType(KPIType kpiType, string Type)
        {
            control.UpdateEntity(kpiType, Type);
        }

        public void DeleteKPIType(KPIType kpiType)
        {
            control.DeleteEntity(kpiType);
        }

        public IList GetAllKPITypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}