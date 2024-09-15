using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPickingPlanDAL
    {
        private EntityControl control;

        public WZPickingPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPickingPlan(WZPickingPlan wZPickingPlan)
        {
            control.AddEntity(wZPickingPlan);
        }

        public void UpdateWZPickingPlan(WZPickingPlan wZPickingPlan, string strPlanCode)
        {
            control.UpdateEntity(wZPickingPlan, strPlanCode);
        }

        public void DeleteWZPickingPlan(WZPickingPlan wZPickingPlan)
        {
            control.DeleteEntity(wZPickingPlan);
        }

        public IList GetAllWZPickingPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}