using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartmentDAL
    {
        private EntityControl control;

        public DepartmentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartment(Department department)
        {
            control.AddEntity(department);
        }

        public void UpdateDepartment(Department department, string DepartCode)
        {
            control.UpdateEntity(department, DepartCode);
        }

        public void DeleteDepartment(Department department)
        {
            control.DeleteEntity(department);
        }

        public IList GetAllDepartments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}