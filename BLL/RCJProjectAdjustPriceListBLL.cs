using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectAdjustPriceListBLL
    {
        public void AddRCJProjectAdjustPriceList(RCJProjectAdjustPriceList cpb)
        {
            RCJProjectAdjustPriceListDAL dal = new RCJProjectAdjustPriceListDAL();
            dal.AddRCJProjectAdjustPriceList(cpb);
        }

        public void UpdateRCJProjectAdjustPriceList(RCJProjectAdjustPriceList cpb, int ID)
        {
            RCJProjectAdjustPriceListDAL dal = new RCJProjectAdjustPriceListDAL();
            dal.UpdateRCJProjectAdjustPriceList(cpb, ID);
        }

        public void DeleteRCJProjectAdjustPriceListDAL(RCJProjectAdjustPriceList cpb)
        {
            RCJProjectAdjustPriceListDAL dal = new RCJProjectAdjustPriceListDAL();
            dal.DeleteRCJProjectAdjustPriceList(cpb);
        }

        public IList GetAllRCJProjectAdjustPriceList(string strHQL)
        {
            RCJProjectAdjustPriceListDAL dal = new RCJProjectAdjustPriceListDAL();
            return dal.GetAllRCJProjectAdjustPriceList(strHQL);
        }
    }
}