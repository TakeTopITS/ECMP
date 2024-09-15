using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectWorkDetailsBLL
    {
        public void AddRCJProjectWorkDetails(RCJProjectWorkDetails pwd)
        {
            RCJProjectWorkDetailsDAL dal = new RCJProjectWorkDetailsDAL();
            dal.AddRCJProjectWorkDetails(pwd);
        }

        public void UpdateRCJProjectWorkDetails(RCJProjectWorkDetails pwd, int ID)
        {
            RCJProjectWorkDetailsDAL dal = new RCJProjectWorkDetailsDAL();
            dal.UpdateRCJProjectWorkDetails(pwd, ID);
        }

        public void DeleteRCJProjectWorkDetails(RCJProjectWorkDetails pwd)
        {
            RCJProjectWorkDetailsDAL dal = new RCJProjectWorkDetailsDAL();
            dal.DeleteRCJProjectWorkDetails(pwd);
        }

        public IList GetAllRCJProjectWorkDetails(string strHQL)
        {
            RCJProjectWorkDetailsDAL dal = new RCJProjectWorkDetailsDAL();
            return dal.GetAllRCJProjectWorkDetails(strHQL);
        }
    }
}