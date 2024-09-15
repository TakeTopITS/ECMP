using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectWorkMoneyBLL
    {
        public void AddRCJProjectWorkMoney(RCJProjectWorkMoney pwd)
        {
            RCJProjectWorkMoneyDAL dal = new RCJProjectWorkMoneyDAL();
            dal.AddRCJProjectWorkMoney(pwd);
        }

        public void UpdateRCJProjectWorkMoney(RCJProjectWorkMoney pwd, int ID)
        {
            RCJProjectWorkMoneyDAL dal = new RCJProjectWorkMoneyDAL();
            dal.UpdateRCJProjectWorkMoney(pwd, ID);
        }

        public void DeleteRCJProjectWorkMoney(RCJProjectWorkMoney pwd)
        {
            RCJProjectWorkMoneyDAL dal = new RCJProjectWorkMoneyDAL();
            dal.DeleteRCJProjectWorkMoney(pwd);
        }

        public IList GetAllRCJProjectWorkMoney(string strHQL)
        {
            RCJProjectWorkMoneyDAL dal = new RCJProjectWorkMoneyDAL();
            return dal.GetAllRCJProjectWorkMoney(strHQL);
        }
    }
}