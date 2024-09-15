using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectCostPerformanceListDAL
    {
        private EntityControl control;

        public RCJProjectCostPerformanceListDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectCostPerformanceList(RCJProjectCostPerformanceList cpb)
        {
            control.AddEntity(cpb);
        }

        public void UpdateRCJProjectCostPerformanceList(RCJProjectCostPerformanceList cpb, int ID)
        {
            control.UpdateEntity(cpb, ID);
        }

        public void DeleteRCJProjectCostPerformanceList(RCJProjectCostPerformanceList cpb)
        {
            control.DeleteEntity(cpb);
        }

        public IList GetAllRCJProjectCostPerformanceLists(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}