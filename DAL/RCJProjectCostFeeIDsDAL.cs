using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectCostFeeIDsDAL
    {
        private EntityControl control;

        public RCJProjectCostFeeIDsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectCostFeeIDs(RCJProjectCostFeeIDs pcf)
        {
            control.AddEntity(pcf);
        }

        public void UpdateRCJProjectCostFeeIDs(RCJProjectCostFeeIDs pcf, int ID)
        {
            control.UpdateEntity(pcf, ID);
        }

        public void DeleteRCJProjectCostFeeIDs(RCJProjectCostFeeIDs pcf)
        {
            control.DeleteEntity(pcf);
        }

        public IList GetAllRCJProjectCostFeeIDs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}