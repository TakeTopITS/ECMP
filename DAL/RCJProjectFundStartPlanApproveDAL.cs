using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectFundStartPlanApproveDAL
    {
        private EntityControl control;

        public RCJProjectFundStartPlanApproveDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectFundStartPlanApprove(RCJProjectFundStartPlanApprove fsp)
        {
            control.AddEntity(fsp);
        }

        public void UpdateRCJProjectFundStartPlanApprove(RCJProjectFundStartPlanApprove fsp, int ID)
        {
            control.UpdateEntity(fsp, ID);
        }

        public void DeleteRCJProjectFundStartPlanApprove(RCJProjectFundStartPlanApprove fsp)
        {
            control.DeleteEntity(fsp);
        }

        public IList GetAllRCJProjectFundStartPlanApprove(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}