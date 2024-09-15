using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanStatusBLL
    {
        public void AddPlanStatus(PlanStatus planStatus)
        {
            PlanStatusDAL dal = new PlanStatusDAL();
            dal.AddPlanStatus(planStatus);
        }

        public void UpdatePlanStatus(PlanStatus planStatus, string Status)
        {
            PlanStatusDAL dal = new PlanStatusDAL();
            dal.UpdatePlanStatus(planStatus, Status);
        }

        public void DeletePlanStatus(PlanStatus planStatus)
        {
            PlanStatusDAL dal = new PlanStatusDAL();
            dal.DeletePlanStatus(planStatus);
        }

        public IList GetAllPlanStatuss(string strHQL)
        {
            PlanStatusDAL dal = new PlanStatusDAL();
            return dal.GetAllPlanStatuss(strHQL);
        }
    }
}