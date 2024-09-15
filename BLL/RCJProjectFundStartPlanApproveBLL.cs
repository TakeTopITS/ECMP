using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectFundStartPlanApproveApproveBLL
    {
        public void AddRCJProjectFundStartPlanApprove(RCJProjectFundStartPlanApprove fsp)
        {
            RCJProjectFundStartPlanApproveDAL dal = new RCJProjectFundStartPlanApproveDAL();
            dal.AddRCJProjectFundStartPlanApprove(fsp);
        }

        public void UpdateRCJProjectFundStartPlanApprove(RCJProjectFundStartPlanApprove fsp, int ID)
        {
            RCJProjectFundStartPlanApproveDAL dal = new RCJProjectFundStartPlanApproveDAL();
            dal.UpdateRCJProjectFundStartPlanApprove(fsp, ID);
        }

        public void DeleteRCJProjectFundStartPlanApprove(RCJProjectFundStartPlanApprove fsp)
        {
            RCJProjectFundStartPlanApproveDAL dal = new RCJProjectFundStartPlanApproveDAL();
            dal.DeleteRCJProjectFundStartPlanApprove(fsp);
        }

        public IList GetAllRCJProjectFundStartPlanApprove(string strHQL)
        {
            RCJProjectFundStartPlanApproveDAL dal = new RCJProjectFundStartPlanApproveDAL();
            return dal.GetAllRCJProjectFundStartPlanApprove(strHQL);
        }
    }
}