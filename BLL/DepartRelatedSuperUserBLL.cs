using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedSuperUserBLL
    {
        public void AddDepartRelatedSuperUser(DepartRelatedSuperUser departRelatedSuperUser)
        {
            DepartRelatedSuperUserDAL dal = new DepartRelatedSuperUserDAL();
            dal.AddDepartRelatedSuperUser(departRelatedSuperUser);
        }

        public void UpdateDepartRelatedSuperUser(DepartRelatedSuperUser departRelatedSuperUser, int ID)
        {
            DepartRelatedSuperUserDAL dal = new DepartRelatedSuperUserDAL();
            dal.UpdateDepartRelatedSuperUser(departRelatedSuperUser, ID);
        }

        public void DeleteDepartRelatedSuperUser(DepartRelatedSuperUser departRelatedSuperUser)
        {
            DepartRelatedSuperUserDAL dal = new DepartRelatedSuperUserDAL();
            dal.DeleteDepartRelatedSuperUser(departRelatedSuperUser);
        }

        public IList GetAllDepartRelatedSuperUsers(string strHQL)
        {
            DepartRelatedSuperUserDAL dal = new DepartRelatedSuperUserDAL();
            return dal.GetAllDepartRelatedSuperUsers(strHQL);
        }
    }
}