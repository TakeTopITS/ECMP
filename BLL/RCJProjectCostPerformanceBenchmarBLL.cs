using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectCostPerformanceBenchmarBLL
    {
        public void AddProjectCostPerformanceBenchmar(RCJProjectCostPerformanceBenchmar cpb)
        {
            RCJProjectCostPerformanceBenchmarDAL dal = new RCJProjectCostPerformanceBenchmarDAL();
            dal.AddProjectCostPerformanceBenchmar(cpb);
        }

        public void UpdateProjectCostPerformanceBenchmar(RCJProjectCostPerformanceBenchmar cpb, int ID)
        {
            RCJProjectCostPerformanceBenchmarDAL dal = new RCJProjectCostPerformanceBenchmarDAL();
            dal.UpdateProjectCostPerformanceBenchmar(cpb, ID);
        }

        public void DeleteProjectCostPerformanceBenchmar(RCJProjectCostPerformanceBenchmar cpb)
        {
            RCJProjectCostPerformanceBenchmarDAL dal = new RCJProjectCostPerformanceBenchmarDAL();
            dal.DeleteProjectCostPerformanceBenchmar(cpb);
        }

        public IList GetAllProjectCostPerformanceBenchmar(string strHQL)
        {
            RCJProjectCostPerformanceBenchmarDAL dal = new RCJProjectCostPerformanceBenchmarDAL();
            return dal.GetAllProjectCostPerformanceBenchmars(strHQL);
        }
    }
}