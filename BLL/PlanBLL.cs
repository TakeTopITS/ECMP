using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanBLL
    {
        public void AddPlan(Plan plan)
        {
            PlanDAL dal = new PlanDAL();
            dal.AddPlan(plan);
        }

        public void UpdatePlan(Plan plan, int PlanID)
        {
            PlanDAL dal = new PlanDAL();
            dal.UpdatePlan(plan, PlanID);
        }

        public void DeletePlan(Plan plan)
        {
            PlanDAL dal = new PlanDAL();
            dal.DeletePlan(plan);
        }

        public IList GetAllPlans(string strHQL)
        {
            PlanDAL dal = new PlanDAL();
            return dal.GetAllPlans(strHQL);
        }
    }
}