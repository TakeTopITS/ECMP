using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectAdjustPriceDAL
    {
        private EntityControl control;

        public RCJProjectAdjustPriceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectAdjustPrice(RCJProjectAdjustPrice pap)
        {
            control.AddEntity(pap);
        }

        public void UpdateRCJProjectAdjustPrice(RCJProjectAdjustPrice pap, int ID)
        {
            control.UpdateEntity(pap, ID);
        }

        public void DeleteRCJProjectAdjustPrice(RCJProjectAdjustPrice pap)
        {
            control.DeleteEntity(pap);
        }

        public IList GetAllRCJProjectAdjustPrice(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}