using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class KPITemplateForDepartPositionDAL
    {
        private EntityControl control;

        public KPITemplateForDepartPositionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddKPITemplateForDepartPosition(KPITemplateForDepartPosition kpiTemplateForDepartPosition)
        {
            control.AddEntity(kpiTemplateForDepartPosition);
        }

        public void UpdateKPITemplateForDepartPosition(KPITemplateForDepartPosition kpiTemplateForDepartPosition, int ID)
        {
            control.UpdateEntity(kpiTemplateForDepartPosition, ID);
        }

        public void DeleteKPITemplateForDepartPosition(KPITemplateForDepartPosition kpiTemplateForDepartPosition)
        {
            control.DeleteEntity(kpiTemplateForDepartPosition);
        }

        public IList GetAllKPITemplateForDepartPositions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}