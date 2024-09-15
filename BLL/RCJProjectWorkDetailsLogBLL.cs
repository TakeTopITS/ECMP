using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectWorkDetailsLogBLL
    {
        public void AddRCJProjectWorkDetailsLog(RCJProjectWorkDetailsLog pwd)
        {
            RCJProjectWorkDetailsLogDAL dal = new RCJProjectWorkDetailsLogDAL();
            dal.AddRCJProjectWorkDetailsLog(pwd);
        }

        public void UpdateRCJProjectWorkDetailsLog(RCJProjectWorkDetailsLog pwd, int ID)
        {
            RCJProjectWorkDetailsLogDAL dal = new RCJProjectWorkDetailsLogDAL();
            dal.UpdateRCJProjectWorkDetailsLog(pwd, ID);
        }

        public void DeleteRCJProjectWorkDetailsLog(RCJProjectWorkDetailsLog pwd)
        {
            RCJProjectWorkDetailsLogDAL dal = new RCJProjectWorkDetailsLogDAL();
            dal.DeleteRCJProjectWorkDetailsLog(pwd);
        }

        public IList GetAllRCJProjectWorkDetailsLog(string strHQL)
        {
            RCJProjectWorkDetailsLogDAL dal = new RCJProjectWorkDetailsLogDAL();
            return dal.GetAllRCJProjectWorkDetailsLog(strHQL);
        }
    }
}