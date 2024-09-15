using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    internal class RCJProjectCostFeesBLL
    {
        public void AddRCJProjectCostFees(RCJProjectCostFees pcf)
        {
            RCJProjectCostFeesDAL dal = new RCJProjectCostFeesDAL();
            dal.AddRCJProjectCostFees(pcf);
        }

        public void UpdateRCJProjectCostFees(RCJProjectCostFees pcf, int ID)
        {
            RCJProjectCostFeesDAL dal = new RCJProjectCostFeesDAL();
            dal.UpdateRCJProjectCostFees(pcf, ID);
        }

        public void DeleteRCJProjectCostFees(RCJProjectCostFees pcf)
        {
            RCJProjectCostFeesDAL dal = new RCJProjectCostFeesDAL();
            dal.DeleteRCJProjectCostFees(pcf);
        }

        public IList GetAllRCJProjectCostFees(string strHQL)
        {
            RCJProjectCostFeesDAL dal = new RCJProjectCostFeesDAL();
            return dal.GetAllRCJProjectCostFees(strHQL);
        }
    }
}