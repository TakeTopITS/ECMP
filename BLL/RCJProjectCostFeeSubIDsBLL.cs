using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectCostFeeSubIDsBLL
    {
        public void AddRCJProjectCostFeeSubIDs(RCJProjectCostFeeSubIDs fsd)
        {
            RCJProjectCostFeeSubIDsDAL dal = new RCJProjectCostFeeSubIDsDAL();
            dal.AddRCJProjectCostFeeSubIDs(fsd);
        }

        public void UpdateRCJProjectCostFeeSubIDs(RCJProjectCostFeeSubIDs fsd, int ID)
        {
            RCJProjectCostFeeSubIDsDAL dal = new RCJProjectCostFeeSubIDsDAL();
            dal.UpdateRCJProjectCostFeeSubIDs(fsd, ID);
        }

        public void DeleteRCJProjectCostFeeSubIDs(RCJProjectCostFeeSubIDs fsd)
        {
            RCJProjectCostFeeSubIDsDAL dal = new RCJProjectCostFeeSubIDsDAL();
            dal.DeleteRCJProjectCostFeeSubIDs(fsd);
        }

        public IList GetAllRCJProjectCostFeeSubIDs(string strHQL)
        {
            RCJProjectCostFeeSubIDsDAL dal = new RCJProjectCostFeeSubIDsDAL();
            return dal.GetAllRCJProjectCostFeeSubIDs(strHQL);
        }
    }
}