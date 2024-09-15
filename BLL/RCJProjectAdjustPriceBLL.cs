using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectAdjustPriceBLL
    {
        public void AddRCJProjectAdjustPrice(RCJProjectAdjustPrice pap)
        {
            RCJProjectAdjustPriceDAL dal = new RCJProjectAdjustPriceDAL();
            dal.AddRCJProjectAdjustPrice(pap);
        }

        public void UpdateRCJProjectAdjustPrice(RCJProjectAdjustPrice pap, int ID)
        {
            RCJProjectAdjustPriceDAL dal = new RCJProjectAdjustPriceDAL();
            dal.UpdateRCJProjectAdjustPrice(pap, ID);
        }

        public void DeleteRCJProjectAdjustPrice(RCJProjectAdjustPrice pap)
        {
            RCJProjectAdjustPriceDAL dal = new RCJProjectAdjustPriceDAL();
            dal.DeleteRCJProjectAdjustPrice(pap);
        }

        public IList GetAllRCJProjectAdjustPrice(string strHQL)
        {
            RCJProjectAdjustPriceDAL dal = new RCJProjectAdjustPriceDAL();
            return dal.GetAllRCJProjectAdjustPrice(strHQL);
        }
    }
}