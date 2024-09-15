using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PlanRelatedLeaderBLL
    {
        public void AddPlanRelatedLeader(PlanRelatedLeader planRelatedLeader)
        {
            PlanRelatedLeaderDAL dal = new PlanRelatedLeaderDAL();
            dal.AddPlanRelatedLeader(planRelatedLeader);
        }

        public void UpdatePlanRelatedLeader(PlanRelatedLeader planRelatedLeader, int ID)
        {
            PlanRelatedLeaderDAL dal = new PlanRelatedLeaderDAL();
            dal.UpdatePlanRelatedLeader(planRelatedLeader, ID);
        }

        public void DeletePlanRelatedLeader(PlanRelatedLeader planRelatedLeader)
        {
            PlanRelatedLeaderDAL dal = new PlanRelatedLeaderDAL();
            dal.DeletePlanRelatedLeader(planRelatedLeader);
        }

        public IList GetAllPlanRelatedLeaders(string strHQL)
        {
            PlanRelatedLeaderDAL dal = new PlanRelatedLeaderDAL();
            return dal.GetAllPlanRelatedLeaders(strHQL);
        }
    }
}