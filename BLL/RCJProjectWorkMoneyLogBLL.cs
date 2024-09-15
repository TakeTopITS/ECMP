using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectWorkMoneyLogBLL
    {
        public void AddRCJProjectWorkMoneyLog(RCJProjectWorkMoneyLog pwd)
        {
            RCJProjectWorkMoneyLogDAL dal = new RCJProjectWorkMoneyLogDAL();
            dal.AddRCJProjectWorkMoneyLog(pwd);
        }

        public void UpdateRCJProjectWorkMoneyLog(RCJProjectWorkMoneyLog pwd, int ID)
        {
            RCJProjectWorkMoneyLogDAL dal = new RCJProjectWorkMoneyLogDAL();
            dal.UpdateRCJProjectWorkMoneyLog(pwd, ID);
        }

        public void DeleteRCJProjectWorkMoneyLog(RCJProjectWorkMoneyLog pwd)
        {
            RCJProjectWorkMoneyLogDAL dal = new RCJProjectWorkMoneyLogDAL();
            dal.DeleteRCJProjectWorkMoneyLog(pwd);
        }

        public IList GetAllRCJProjectWorkMoneyLog(string strHQL)
        {
            RCJProjectWorkMoneyLogDAL dal = new RCJProjectWorkMoneyLogDAL();
            return dal.GetAllRCJProjectWorkMoneyLog(strHQL);
        }
    }
}