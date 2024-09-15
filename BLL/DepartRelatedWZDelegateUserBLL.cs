using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedWZDelegateUserBLL
    {
        public void AddDepartRelatedWZDelegateUser(DepartRelatedWZDelegateUser departRelatedWZDelegateUser)
        {
            DepartRelatedWZDelegateUserDAL dal = new DepartRelatedWZDelegateUserDAL();
            dal.AddDepartRelatedWZDelegateUser(departRelatedWZDelegateUser);
        }

        public void UpdateDepartRelatedWZDelegateUser(DepartRelatedWZDelegateUser departRelatedWZDelegateUser, int ID)
        {
            DepartRelatedWZDelegateUserDAL dal = new DepartRelatedWZDelegateUserDAL();
            dal.UpdateDepartRelatedWZDelegateUser(departRelatedWZDelegateUser, ID);
        }

        public void DeleteDepartRelatedWZFeeUser(DepartRelatedWZDelegateUser departRelatedWZDelegateUser)
        {
            DepartRelatedWZDelegateUserDAL dal = new DepartRelatedWZDelegateUserDAL();
            dal.DeleteDepartRelatedWZDelegateUser(departRelatedWZDelegateUser);
        }

        public IList GetAllDepartRelatedWZDelegateUsers(string strHQL)
        {
            DepartRelatedWZDelegateUserDAL dal = new DepartRelatedWZDelegateUserDAL();
            return dal.GetAllDepartRelatedWZDelegateUsers(strHQL);
        }
    }
}