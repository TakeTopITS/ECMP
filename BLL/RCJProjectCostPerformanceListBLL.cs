using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectCostPerformanceListBLL
    {
        public void AddRCJProjectCostPerformanceList(RCJProjectCostPerformanceList cpb)
        {
            RCJProjectCostPerformanceListDAL dal = new RCJProjectCostPerformanceListDAL();
            dal.AddRCJProjectCostPerformanceList(cpb);
        }

        public void UpdateRCJProjectCostPerformanceList(RCJProjectCostPerformanceList cpb, int ID)
        {
            RCJProjectCostPerformanceListDAL dal = new RCJProjectCostPerformanceListDAL();
            dal.UpdateRCJProjectCostPerformanceList(cpb, ID);
        }

        public void DeleteRCJProjectCostPerformanceList(RCJProjectCostPerformanceList cpb)
        {
            RCJProjectCostPerformanceListDAL dal = new RCJProjectCostPerformanceListDAL();
            dal.DeleteRCJProjectCostPerformanceList(cpb);
        }

        public IList GetAllRCJProjectCostPerformanceList(string strHQL)
        {
            RCJProjectCostPerformanceListDAL dal = new RCJProjectCostPerformanceListDAL();
            return dal.GetAllRCJProjectCostPerformanceLists(strHQL);
        }
    }
}