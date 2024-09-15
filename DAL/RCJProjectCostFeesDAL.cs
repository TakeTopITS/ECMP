using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectCostFeesDAL
    {
        private EntityControl control;

        public RCJProjectCostFeesDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectCostFees(RCJProjectCostFees pcf)
        {
            control.AddEntity(pcf);
        }

        public void UpdateRCJProjectCostFees(RCJProjectCostFees pcf, int ID)
        {
            control.UpdateEntity(pcf, ID);
        }

        public void DeleteRCJProjectCostFees(RCJProjectCostFees pcf)
        {
            control.DeleteEntity(pcf);
        }

        public IList GetAllRCJProjectCostFees(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}