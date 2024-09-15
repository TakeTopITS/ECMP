using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedWZCheckUserBLL
    {
        public void AddDepartRelatedWZCheckUser(DepartRelatedWZCheckUser departRelatedWZCheckUser)
        {
            DepartRelatedWZCheckUserDAL dal = new DepartRelatedWZCheckUserDAL();
            dal.AddDepartRelatedWZCheckUser(departRelatedWZCheckUser);
        }

        public void UpdateDepartRelatedWZCheckUser(DepartRelatedWZCheckUser departRelatedWZCheckUser, int ID)
        {
            DepartRelatedWZCheckUserDAL dal = new DepartRelatedWZCheckUserDAL();
            dal.UpdateDepartRelatedWZCheckUser(departRelatedWZCheckUser, ID);
        }

        public void DeleteDepartRelatedWZCheckUser(DepartRelatedWZCheckUser departRelatedWZCheckUser)
        {
            DepartRelatedWZCheckUserDAL dal = new DepartRelatedWZCheckUserDAL();
            dal.DeleteDepartRelatedWZCheckUser(departRelatedWZCheckUser);
        }

        public IList GetAllDepartRelatedWZCheckUsers(string strHQL)
        {
            DepartRelatedWZCheckUserDAL dal = new DepartRelatedWZCheckUserDAL();
            return dal.GetAllDepartRelatedWZCheckUsers(strHQL);
        }
    }
}