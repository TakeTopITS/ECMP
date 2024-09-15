using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectCostFeeSubIDsDAL
    {
        private EntityControl control;

        public RCJProjectCostFeeSubIDsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectCostFeeSubIDs(RCJProjectCostFeeSubIDs pcf)
        {
            control.AddEntity(pcf);
        }

        public void UpdateRCJProjectCostFeeSubIDs(RCJProjectCostFeeSubIDs pcf, int ID)
        {
            control.UpdateEntity(pcf, ID);
        }

        public void DeleteRCJProjectCostFeeSubIDs(RCJProjectCostFeeSubIDs pcf)
        {
            control.DeleteEntity(pcf);
        }

        public IList GetAllRCJProjectCostFeeSubIDs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}