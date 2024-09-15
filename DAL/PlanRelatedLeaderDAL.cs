using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PlanRelatedLeaderDAL
    {
        private EntityControl control;

        public PlanRelatedLeaderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPlanRelatedLeader(PlanRelatedLeader planRelatedLeader)
        {
            control.AddEntity(planRelatedLeader);
        }

        public void UpdatePlanRelatedLeader(PlanRelatedLeader planRelatedLeader, int ID)
        {
            control.UpdateEntity(planRelatedLeader, ID);
        }

        public void DeletePlanRelatedLeader(PlanRelatedLeader planRelatedLeader)
        {
            control.DeleteEntity(planRelatedLeader);
        }

        public IList GetAllPlanRelatedLeaders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}