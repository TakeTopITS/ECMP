using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanStatusDAL
    {
        private EntityControl control;

        public PlanStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanStatus(PlanStatus planStatus)
        {
            control.AddEntity(planStatus);
        }

        public void UpdatePlanStatus(PlanStatus planStatus, string Status)
        {
            control.UpdateEntity(planStatus, Status);
        }

        public void DeletePlanStatus(PlanStatus planStatus)
        {
            control.DeleteEntity(planStatus);
        }

        public IList GetAllPlanStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}