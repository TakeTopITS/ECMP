using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectSummaryPerformanceBLL
    {
        public void AddRCJProjectSummaryPerformance(RCJProjectSummaryPerformance psp)
        {
            RCJProjectSummaryPerformanceDAL dal = new RCJProjectSummaryPerformanceDAL();
            dal.AddRCJProjectSummaryPerformance(psp);
        }

        public void UpdateRCJProjectSummaryPerformance(RCJProjectSummaryPerformance psp, int ID)
        {
            RCJProjectSummaryPerformanceDAL dal = new RCJProjectSummaryPerformanceDAL();
            dal.UpdateRCJProjectSummaryPerformance(psp, ID);
        }

        public void DeleteRCJProjectSummaryPerformance(RCJProjectSummaryPerformance psp)
        {
            RCJProjectSummaryPerformanceDAL dal = new RCJProjectSummaryPerformanceDAL();
            dal.DeleteRCJProjectSummaryPerformance(psp);
        }

        public IList GetAllRCJProjectSummaryPerformances(string strHQL)
        {
            RCJProjectSummaryPerformanceDAL dal = new RCJProjectSummaryPerformanceDAL();
            return dal.GetAllRCJProjectSummaryPerformances(strHQL);
        }
    }
}