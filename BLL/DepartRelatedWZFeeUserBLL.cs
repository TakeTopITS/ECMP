using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedWZFeeUserBLL
    {
        public void AddDepartRelatedWZFeeUser(DepartRelatedWZFeeUser departRelatedWZFeeUser)
        {
            DepartRelatedWZFeeUserDAL dal = new DepartRelatedWZFeeUserDAL();
            dal.AddDepartRelatedWZFeeUser(departRelatedWZFeeUser);
        }

        public void UpdateDepartRelatedWZFeeUser(DepartRelatedWZFeeUser departRelatedWZFeeUser, int ID)
        {
            DepartRelatedWZFeeUserDAL dal = new DepartRelatedWZFeeUserDAL();
            dal.UpdateDepartRelatedWZFeeUser(departRelatedWZFeeUser, ID);
        }

        public void DeleteDepartRelatedWZFeeUser(DepartRelatedWZFeeUser departRelatedWZFeeUser)
        {
            DepartRelatedWZFeeUserDAL dal = new DepartRelatedWZFeeUserDAL();
            dal.DeleteDepartRelatedWZFeeUser(departRelatedWZFeeUser);
        }

        public IList GetAllDepartRelatedWZFeeUsers(string strHQL)
        {
            DepartRelatedWZFeeUserDAL dal = new DepartRelatedWZFeeUserDAL();
            return dal.GetAllDepartRelatedWZFeeUsers(strHQL);
        }
    }
}