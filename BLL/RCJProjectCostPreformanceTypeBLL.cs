using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    internal class RCJProjectCostPreformanceTypeBLL
    {
        public void AddRCJProjectCostPreformanceType(RCJProjectCostPreformanceType pwd)
        {
            RCJProjectCostPreformanceTypeDAL dal = new RCJProjectCostPreformanceTypeDAL();
            dal.AddRCJProjectCostPreformanceType(pwd);
        }

        public void UpdateRCJProjectCostPreformanceType(RCJProjectCostPreformanceType pwd, int ID)
        {
            RCJProjectCostPreformanceTypeDAL dal = new RCJProjectCostPreformanceTypeDAL();
            dal.UpdateRCJProjectCostPreformanceType(pwd, ID);
        }

        public void DeleteRCJProjectCostPreformanceType(RCJProjectCostPreformanceType pwd)
        {
            RCJProjectCostPreformanceTypeDAL dal = new RCJProjectCostPreformanceTypeDAL();
            dal.DeleteRCJProjectCostPreformanceType(pwd);
        }

        public IList GetAllRCJProjectCostPreformanceType(string strHQL)
        {
            RCJProjectCostPreformanceTypeDAL dal = new RCJProjectCostPreformanceTypeDAL();
            return dal.GetAllRCJProjectCostPreformanceType(strHQL);
        }
    }
}