using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ItemMainPlanDAL
    {
        private EntityControl control;

        public ItemMainPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddItemMainPlan(ItemMainPlan itemMainPlan)
        {
            control.AddEntity(itemMainPlan);
        }

        public void UpdateItemMainPlan(ItemMainPlan itemMainPlan, int PlanVerID)
        {
            control.UpdateEntity(itemMainPlan, PlanVerID);
        }

        public void DeleteItemMainPlan(ItemMainPlan itemMainPlan)
        {
            control.DeleteEntity(itemMainPlan);
        }

        public IList GetAllItemMainPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}