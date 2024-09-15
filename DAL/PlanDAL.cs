using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanDAL
    {
        private EntityControl control;

        public PlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlan(Plan plan)
        {
            control.AddEntity(plan);
        }

        public void UpdatePlan(Plan plan, int PlanID)
        {
            control.UpdateEntity(plan, PlanID);
        }

        public void DeletePlan(Plan plan)
        {
            control.DeleteEntity(plan);
        }

        public IList GetAllPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}