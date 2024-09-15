using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectAdjustPriceListDAL
    {
        private EntityControl control;

        public RCJProjectAdjustPriceListDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectAdjustPriceList(RCJProjectAdjustPriceList cpb)
        {
            control.AddEntity(cpb);
        }

        public void UpdateRCJProjectAdjustPriceList(RCJProjectAdjustPriceList cpb, int ID)
        {
            control.UpdateEntity(cpb, ID);
        }

        public void DeleteRCJProjectAdjustPriceList(RCJProjectAdjustPriceList cpb)
        {
            control.DeleteEntity(cpb);
        }

        public IList GetAllRCJProjectAdjustPriceList(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}