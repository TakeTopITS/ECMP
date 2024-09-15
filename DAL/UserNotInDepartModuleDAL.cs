using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserNotInDepartModuleDAL
    {
        private EntityControl control;

        public UserNotInDepartModuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserNotInDepartModule(UserNotInDepartModule userNotInDepartModule)
        {
            control.AddEntity(userNotInDepartModule);
        }

        public void UpdateUserNotInDepartModule(UserNotInDepartModule userNotInDepartModule, int ID)
        {
            control.UpdateEntity(userNotInDepartModule, ID);
        }

        public void DeleteUserNotInDepartModule(UserNotInDepartModule userNotInDepartModule)
        {
            control.DeleteEntity(userNotInDepartModule);
        }

        public IList GetAllUserNotInDepartModules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}