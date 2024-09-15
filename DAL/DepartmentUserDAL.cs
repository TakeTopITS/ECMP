using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartmentUserDAL
    {
        private EntityControl control;

        public DepartmentUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartmentUser(DepartmentUser departmentUser)
        {
            control.AddEntity(departmentUser);
        }

        public void UpdateDepartmentUser(DepartmentUser departmentUser, int ID)
        {
            control.UpdateEntity(departmentUser, ID);
        }

        public void DeleteDepartmentUser(DepartmentUser departmentUser)
        {
            control.DeleteEntity(departmentUser);
        }

        public IList GetAllDepartmentUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}