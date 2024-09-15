using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWMakeCostDAL
    {
        private EntityControl control;

        public DWMakeCostDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWMakeCost(DWMakeCost dWMakeCost)
        {
            control.AddEntity(dWMakeCost);
        }

        public void UpdateDWMakeCost(DWMakeCost dWMakeCost, int ID)
        {
            control.UpdateEntity(dWMakeCost, ID);
        }

        public void DeleteDWMakeCost(DWMakeCost dWMakeCost)
        {
            control.DeleteEntity(dWMakeCost);
        }

        public IList GetAllDWMakeCosts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}