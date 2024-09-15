using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectMonthCostFeeDAL
    {
        private EntityControl control;

        public RCJProjectMonthCostFeeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectMonthCostFee(RCJProjectMonthCostFee mcf)
        {
            control.AddEntity(mcf);
        }

        public void UpdateRCJProjectMonthCostFee(RCJProjectMonthCostFee mcf, int ID)
        {
            control.UpdateEntity(mcf, ID);
        }

        public void DeleteRCJProjectMonthCostFee(RCJProjectMonthCostFee mcf)
        {
            control.DeleteEntity(mcf);
        }

        public IList GetAllRCJProjectMonthCostFee(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}