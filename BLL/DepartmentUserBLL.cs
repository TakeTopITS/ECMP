using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartmentUserBLL
    {
        public void AddDepartmentUser(DepartmentUser departmentUser)
        {
            DepartmentUserDAL dal = new DepartmentUserDAL();
            dal.AddDepartmentUser(departmentUser);
        }

        public void UpdateDepartmentUser(DepartmentUser departmentUser, int ID)
        {
            DepartmentUserDAL dal = new DepartmentUserDAL();
            dal.UpdateDepartmentUser(departmentUser, ID);
        }

        public void DeleteDepartmentUser(DepartmentUser departmentUser)
        {
            DepartmentUserDAL dal = new DepartmentUserDAL();
            dal.DeleteDepartmentUser(departmentUser);
        }

        public IList GetAllDepartmentUsers(string strHQL)
        {
            DepartmentUserDAL dal = new DepartmentUserDAL();
            return dal.GetAllDepartmentUsers(strHQL);
        }
    }
}