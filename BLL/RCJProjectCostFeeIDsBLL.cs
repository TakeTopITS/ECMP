using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectCostFeeIDsBLL
    {
        public void AddRCJProjectCostFeeIDs(RCJProjectCostFeeIDs fsd)
        {
            RCJProjectCostFeeIDsDAL dal = new RCJProjectCostFeeIDsDAL();
            dal.AddRCJProjectCostFeeIDs(fsd);
        }

        public void UpdateRCJProjectCostFeeIDs(RCJProjectCostFeeIDs fsd, int ID)
        {
            RCJProjectCostFeeIDsDAL dal = new RCJProjectCostFeeIDsDAL();
            dal.UpdateRCJProjectCostFeeIDs(fsd, ID);
        }

        public void DeleteRCJProjectCostFeeIDs(RCJProjectCostFeeIDs fsd)
        {
            RCJProjectCostFeeIDsDAL dal = new RCJProjectCostFeeIDsDAL();
            dal.DeleteRCJProjectCostFeeIDs(fsd);
        }

        public IList GetAllRCJProjectCostFeeIDs(string strHQL)
        {
            RCJProjectCostFeeIDsDAL dal = new RCJProjectCostFeeIDsDAL();
            return dal.GetAllRCJProjectCostFeeIDs(strHQL);
        }
    }
}