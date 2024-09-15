using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserDepartmentStringBLL
    {
        public void AddUserDepartmentString(UserDepartmentString userDepartmentString)
        {
            UserDepartmentStringDAL dal = new UserDepartmentStringDAL();
            dal.AddUserDepartmentString(userDepartmentString);
        }

        public void UpdateUserDepartmentString(UserDepartmentString userDepartmentString, string UserCode)
        {
            UserDepartmentStringDAL dal = new UserDepartmentStringDAL();
            dal.UpdateUserDepartmentString(userDepartmentString, UserCode);
        }

        public void DeleteUserDepartmentString(UserDepartmentString userDepartmentString)
        {
            UserDepartmentStringDAL dal = new UserDepartmentStringDAL();
            dal.DeleteUserDepartmentString(userDepartmentString);
        }

        public IList GetAllUserDepartmentStrings(string strHQL)
        {
            UserDepartmentStringDAL dal = new UserDepartmentStringDAL();
            return dal.GetAllUserDepartmentStrings(strHQL);
        }
    }
}