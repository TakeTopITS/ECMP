using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectTargetCostFeeBLL
    {
        public void AddRCJProjectTargetCostFee(RCJProjectTargetCostFee tcf)
        {
            RCJProjectTargetCostFeeDAL dal = new RCJProjectTargetCostFeeDAL();
            dal.AddRCJProjectTargetCostFee(tcf);
        }

        public void UpdateRCJProjectTargetCostFee(RCJProjectTargetCostFee tcf, int ID)
        {
            RCJProjectTargetCostFeeDAL dal = new RCJProjectTargetCostFeeDAL();
            dal.UpdateRCJProjectTargetCostFee(tcf, ID);
        }

        public void DeleteRCJProjectTargetCostFee(RCJProjectTargetCostFee tcf)
        {
            RCJProjectTargetCostFeeDAL dal = new RCJProjectTargetCostFeeDAL();
            dal.DeleteRCJProjectTargetCostFee(tcf);
        }

        public IList GetAllRCJProjectTargetCostFee(string strHQL)
        {
            RCJProjectTargetCostFeeDAL dal = new RCJProjectTargetCostFeeDAL();
            return dal.GetAllRCJProjectTargetCostFee(strHQL);
        }
    }
}