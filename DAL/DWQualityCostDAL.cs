using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWQualityCostDAL
    {
        private EntityControl control;

        public DWQualityCostDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWQualityCost(DWQualityCost dWQualityCost)
        {
            control.AddEntity(dWQualityCost);
        }

        public void UpdateDWQualityCost(DWQualityCost dWQualityCost, int ID)
        {
            control.UpdateEntity(dWQualityCost, ID);
        }

        public void DeleteDWQualityCost(DWQualityCost dWQualityCost)
        {
            control.DeleteEntity(dWQualityCost);
        }

        public IList GetAllDWQualityCosts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}