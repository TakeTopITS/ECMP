using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserNotInDepartModuleBLL
    {
        public void AddUserNotInDepartModule(UserNotInDepartModule userNotInDepartModule)
        {
            UserNotInDepartModuleDAL dal = new UserNotInDepartModuleDAL();
            dal.AddUserNotInDepartModule(userNotInDepartModule);
        }

        public void UpdateUserNotInDepartModule(UserNotInDepartModule userNotInDepartModule, int ID)
        {
            UserNotInDepartModuleDAL dal = new UserNotInDepartModuleDAL();
            dal.UpdateUserNotInDepartModule(userNotInDepartModule, ID);
        }

        public void DeleteUserNotInDepartModule(UserNotInDepartModule userNotInDepartModule)
        {
            UserNotInDepartModuleDAL dal = new UserNotInDepartModuleDAL();
            dal.DeleteUserNotInDepartModule(userNotInDepartModule);
        }

        public IList GetAllUserNotInDepartModules(string strHQL)
        {
            UserNotInDepartModuleDAL dal = new UserNotInDepartModuleDAL();
            return dal.GetAllUserNotInDepartModules(strHQL);
        }
    }
}