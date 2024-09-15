using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectWorkConfirmLogBLL
    {
        public void AddRCJProjectWorkConfirmLog(RCJProjectWorkConfirmLog pwd)
        {
            RCJProjectWorkConfirmLogDAL dal = new RCJProjectWorkConfirmLogDAL();
            dal.AddRCJProjectWorkConfirmLog(pwd);
        }

        public void UpdateRCJProjectWorkConfirmLog(RCJProjectWorkConfirmLog pwd, int ID)
        {
            RCJProjectWorkConfirmLogDAL dal = new RCJProjectWorkConfirmLogDAL();
            dal.UpdateRCJProjectWorkConfirmLog(pwd, ID);
        }

        public void DeleteRCJProjectWorkConfirmLog(RCJProjectWorkConfirmLog pwd)
        {
            RCJProjectWorkConfirmLogDAL dal = new RCJProjectWorkConfirmLogDAL();
            dal.DeleteRCJProjectWorkConfirmLog(pwd);
        }

        public IList GetAllRCJProjectWorkConfirmLog(string strHQL)
        {
            RCJProjectWorkConfirmLogDAL dal = new RCJProjectWorkConfirmLogDAL();
            return dal.GetAllRCJProjectWorkConfirmLog(strHQL);
        }
    }
}