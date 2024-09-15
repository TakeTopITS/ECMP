using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectSummaryPerformanceDAL
    {
        private EntityControl control;

        public RCJProjectSummaryPerformanceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectSummaryPerformance(RCJProjectSummaryPerformance psp)
        {
            control.AddEntity(psp);
        }

        public void UpdateRCJProjectSummaryPerformance(RCJProjectSummaryPerformance psp, int ID)
        {
            control.UpdateEntity(psp, ID);
        }

        public void DeleteRCJProjectSummaryPerformance(RCJProjectSummaryPerformance psp)
        {
            control.DeleteEntity(psp);
        }

        public IList GetAllRCJProjectSummaryPerformances(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}