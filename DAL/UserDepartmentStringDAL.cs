using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserDepartmentStringDAL
    {
        private EntityControl control;

        public UserDepartmentStringDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserDepartmentString(UserDepartmentString userDepartmentString)
        {
            control.AddEntity(userDepartmentString);
        }

        public void UpdateUserDepartmentString(UserDepartmentString userDepartmentString, string UserCode)
        {
            control.UpdateEntity(userDepartmentString, UserCode);
        }

        public void DeleteUserDepartmentString(UserDepartmentString userDepartmentString)
        {
            control.DeleteEntity(userDepartmentString);
        }

        public IList GetAllUserDepartmentStrings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}