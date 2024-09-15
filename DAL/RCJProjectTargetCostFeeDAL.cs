using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectTargetCostFeeDAL
    {
        private EntityControl control;

        public RCJProjectTargetCostFeeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectTargetCostFee(RCJProjectTargetCostFee tcf)
        {
            control.AddEntity(tcf);
        }

        public void UpdateRCJProjectTargetCostFee(RCJProjectTargetCostFee tcf, int ID)
        {
            control.UpdateEntity(tcf, ID);
        }

        public void DeleteRCJProjectTargetCostFee(RCJProjectTargetCostFee tcf)
        {
            control.DeleteEntity(tcf);
        }

        public IList GetAllRCJProjectTargetCostFee(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}