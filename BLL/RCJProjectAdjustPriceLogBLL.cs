using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectAdjustPriceLogBLL
    {
        public void AddRCJProjectAdjustPriceLog(RCJProjectAdjustPriceLog cpb)
        {
            RCJProjectAdjustPriceLogDAL dal = new RCJProjectAdjustPriceLogDAL();
            dal.AddRCJProjectAdjustPriceLog(cpb);
        }

        public void UpdateRCJProjectAdjustPriceLog(RCJProjectAdjustPriceLog cpb, int ID)
        {
            RCJProjectAdjustPriceLogDAL dal = new RCJProjectAdjustPriceLogDAL();
            dal.UpdateRCJProjectAdjustPriceLog(cpb, ID);
        }

        public void DeleteRCJProjectAdjustPriceLogDAL(RCJProjectAdjustPriceLog cpb)
        {
            RCJProjectAdjustPriceLogDAL dal = new RCJProjectAdjustPriceLogDAL();
            dal.DeleteRCJProjectAdjustPriceLog(cpb);
        }

        public IList GetAllRCJProjectAdjustPriceLog(string strHQL)
        {
            RCJProjectAdjustPriceLogDAL dal = new RCJProjectAdjustPriceLogDAL();
            return dal.GetAllRCJProjectAdjustPriceLog(strHQL);
        }
    }
}