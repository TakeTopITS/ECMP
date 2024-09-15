using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AdminBLL
    {
        public void AddAdmin(Admin admin)
        {
            AdminDAL dal = new AdminDAL();
            dal.AddAdmin(admin);
        }

        public void UpdateAdmin(Admin admin, string UserCode)
        {
            AdminDAL dal = new AdminDAL();
            dal.UpdateAdmin(admin, UserCode);
        }

        public void DeleteAdmin(Admin admin)
        {
            AdminDAL dal = new AdminDAL();
            dal.DeleteAdmin(admin);
        }

        public IList GetAllAdmins(string strHQL)
        {
            AdminDAL dal = new AdminDAL();
            return dal.GetAllAdmins(strHQL);
        }
    }
}