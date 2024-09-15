using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectMonthCostFeeBLL
    {
        public void AddRCJProjectMonthCostFee(RCJProjectMonthCostFee fsd)
        {
            RCJProjectMonthCostFeeDAL dal = new RCJProjectMonthCostFeeDAL();
            dal.AddRCJProjectMonthCostFee(fsd);
        }

        public void UpdateRCJProjectMonthCostFee(RCJProjectMonthCostFee fsd, int ID)
        {
            RCJProjectMonthCostFeeDAL dal = new RCJProjectMonthCostFeeDAL();
            dal.UpdateRCJProjectMonthCostFee(fsd, ID);
        }

        public void DeleteRCJProjectMonthCostFee(RCJProjectMonthCostFee fsd)
        {
            RCJProjectMonthCostFeeDAL dal = new RCJProjectMonthCostFeeDAL();
            dal.DeleteRCJProjectMonthCostFee(fsd);
        }

        public IList GetAllRCJProjectMonthCostFee(string strHQL)
        {
            RCJProjectMonthCostFeeDAL dal = new RCJProjectMonthCostFeeDAL();
            return dal.GetAllRCJProjectMonthCostFee(strHQL);
        }
    }
}