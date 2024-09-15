using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanTypeDAL
    {
        private EntityControl control;

        public PlanTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanType(PlanType planType)
        {
            control.AddEntity(planType);
        }

        public void UpdatePlanType(PlanType planType, string Type)
        {
            control.UpdateEntity(planType, Type);
        }

        public void DeletePlanType(PlanType planType)
        {
            control.DeleteEntity(planType);
        }

        public IList GetAllPlanTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}