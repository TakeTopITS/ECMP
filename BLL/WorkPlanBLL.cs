using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkPlanBLL
    {
        public void AddWorkPlan(WorkPlan workPlan)
        {
            WorkPlanDAL dal = new WorkPlanDAL();
            dal.AddWorkPlan(workPlan);
        }

        public void UpdateWorkPlan(WorkPlan workPlan, int PlanID)
        {
            WorkPlanDAL dal = new WorkPlanDAL();
            dal.UpdateWorkPlan(workPlan, PlanID);
        }

        public void DeleteWorkPlan(WorkPlan workPlan)
        {
            WorkPlanDAL dal = new WorkPlanDAL();
            dal.DeleteWorkPlan(workPlan);
        }

        public IList GetAllWorkPlans(string strHQL)
        {
            WorkPlanDAL dal = new WorkPlanDAL();
            return dal.GetAllWorkPlans(strHQL);
        }
    }
}