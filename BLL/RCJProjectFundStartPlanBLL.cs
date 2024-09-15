using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectFundStartPlanBLL
    {
        public void AddRCJProjectFundStartPlan(RCJProjectFundStartPlan fsp)
        {
            RCJProjectFundStartPlanDAL dal = new RCJProjectFundStartPlanDAL();
            dal.AddRCJProjectFundStartPlan(fsp);
        }

        public void UpdateRCJProjectFundStartPlan(RCJProjectFundStartPlan fsp, int ID)
        {
            RCJProjectFundStartPlanDAL dal = new RCJProjectFundStartPlanDAL();
            dal.UpdateRCJProjectFundStartPlan(fsp, ID);
        }

        public void DeleteRCJProjectFundStartPlan(RCJProjectFundStartPlan fsp)
        {
            RCJProjectFundStartPlanDAL dal = new RCJProjectFundStartPlanDAL();
            dal.DeleteRCJProjectFundStartPlan(fsp);
        }

        public IList GetAllRCJProjectFundStartPlan(string strHQL)
        {
            RCJProjectFundStartPlanDAL dal = new RCJProjectFundStartPlanDAL();
            return dal.GetAllRCJProjectFundStartPlan(strHQL);
        }
    }
}