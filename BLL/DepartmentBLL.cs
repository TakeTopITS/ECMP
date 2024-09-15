using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartmentBLL
    {
        public void AddDepartment(Department department)
        {
            DepartmentDAL dal = new DepartmentDAL();
            dal.AddDepartment(department);
        }

        public void UpdateDepartment(Department department, string DepartCode)
        {
            DepartmentDAL dal = new DepartmentDAL();
            dal.UpdateDepartment(department, DepartCode);
        }

        public void DeleteDepartment(Department department)
        {
            DepartmentDAL dal = new DepartmentDAL();
            dal.DeleteDepartment(department);
        }

        public IList GetAllDepartments(string strHQL)
        {
            DepartmentDAL dal = new DepartmentDAL();
            return dal.GetAllDepartments(strHQL);
        }
    }
}