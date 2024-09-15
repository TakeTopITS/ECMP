using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectCostPerformanceBenchmarDAL
    {
        private EntityControl control;

        public RCJProjectCostPerformanceBenchmarDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectCostPerformanceBenchmar(RCJProjectCostPerformanceBenchmar cpb)
        {
            control.AddEntity(cpb);
        }

        public void UpdateProjectCostPerformanceBenchmar(RCJProjectCostPerformanceBenchmar cpb, int ID)
        {
            control.UpdateEntity(cpb, ID);
        }

        public void DeleteProjectCostPerformanceBenchmar(RCJProjectCostPerformanceBenchmar cpb)
        {
            control.DeleteEntity(cpb);
        }

        public IList GetAllProjectCostPerformanceBenchmars(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}