using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectAdjustPriceLogDAL
    {
        private EntityControl control;

        public RCJProjectAdjustPriceLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectAdjustPriceLog(RCJProjectAdjustPriceLog cpb)
        {
            control.AddEntity(cpb);
        }

        public void UpdateRCJProjectAdjustPriceLog(RCJProjectAdjustPriceLog cpb, int ID)
        {
            control.UpdateEntity(cpb, ID);
        }

        public void DeleteRCJProjectAdjustPriceLog(RCJProjectAdjustPriceLog cpb)
        {
            control.DeleteEntity(cpb);
        }

        public IList GetAllRCJProjectAdjustPriceLog(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}