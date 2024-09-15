using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectFundStartPlanDAL
    {
        private EntityControl control;

        public RCJProjectFundStartPlanDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectFundStartPlan(RCJProjectFundStartPlan fsp)
        {
            control.AddEntity(fsp);
        }

        public void UpdateRCJProjectFundStartPlan(RCJProjectFundStartPlan fsp, int ID)
        {
            control.UpdateEntity(fsp, ID);
        }

        public void DeleteRCJProjectFundStartPlan(RCJProjectFundStartPlan fsp)
        {
            control.DeleteEntity(fsp);
        }

        public IList GetAllRCJProjectFundStartPlan(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}