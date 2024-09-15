using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartUserInforRelatedUserBLL
    {
        public void AddDepartUserInforRelatedUser(DepartUserInforRelatedUser departUserInforRelatedUser)
        {
            DepartUserInforRelatedUserDAL dal = new DepartUserInforRelatedUserDAL();
            dal.AddDepartUserInforRelatedUser(departUserInforRelatedUser);
        }

        public void UpdateDepartUserInforRelatedUser(DepartUserInforRelatedUser departUserInforRelatedUser, int ID)
        {
            DepartUserInforRelatedUserDAL dal = new DepartUserInforRelatedUserDAL();
            dal.UpdateDepartUserInforRelatedUser(departUserInforRelatedUser, ID);
        }

        public void DeleteDepartUserInforRelatedUser(DepartUserInforRelatedUser departUserInforRelatedUser)
        {
            DepartUserInforRelatedUserDAL dal = new DepartUserInforRelatedUserDAL();
            dal.DeleteDepartUserInforRelatedUser(departUserInforRelatedUser);
        }

        public IList GetAllDepartUserInforRelatedUsers(string strHQL)
        {
            DepartUserInforRelatedUserDAL dal = new DepartUserInforRelatedUserDAL();
            return dal.GetAllDepartUserInforRelatedUsers(strHQL);
        }
    }
}