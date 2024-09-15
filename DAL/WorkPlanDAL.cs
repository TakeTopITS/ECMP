using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkPlanDAL
    {
        private EntityControl control;

        public WorkPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkPlan(WorkPlan workPlan)
        {
            control.AddEntity(workPlan);
        }

        public void UpdateWorkPlan(WorkPlan workPlan, int WorkID)
        {
            control.UpdateEntity(workPlan, WorkID);
        }

        public void DeleteWorkPlan(WorkPlan workPlan)
        {
            control.DeleteEntity(workPlan);
        }

        public IList GetAllWorkPlans(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}