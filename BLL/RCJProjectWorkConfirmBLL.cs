using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RCJProjectWorkConfirmBLL
    {
        public void AddRCJProjectWorkConfirm(RCJProjectWorkConfirm pwd)
        {
            RCJProjectWorkConfirmDAL dal = new RCJProjectWorkConfirmDAL();
            dal.AddRCJProjectWorkConfirm(pwd);
        }

        public void UpdateRCJProjectWorkConfirm(RCJProjectWorkConfirm pwd, int ID)
        {
            RCJProjectWorkConfirmDAL dal = new RCJProjectWorkConfirmDAL();
            dal.UpdateRCJProjectWorkConfirm(pwd, ID);
        }

        public void DeleteRCJProjectWorkConfirm(RCJProjectWorkConfirm pwd)
        {
            RCJProjectWorkConfirmDAL dal = new RCJProjectWorkConfirmDAL();
            dal.DeleteRCJProjectWorkConfirm(pwd);
        }

        public IList GetAllRCJProjectWorkConfirm(string strHQL)
        {
            RCJProjectWorkConfirmDAL dal = new RCJProjectWorkConfirmDAL();
            return dal.GetAllRCJProjectWorkConfirm(strHQL);
        }
    }
}