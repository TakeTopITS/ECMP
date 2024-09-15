using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RegisterUserBLL
    {
        public void AddRegisterUser(RegisterUser registerUser)
        {
            RegisterUserDAL dal = new RegisterUserDAL();
            dal.AddRegisterUser(registerUser);
        }

        public void UpdateRegisterUser(RegisterUser registerUser, int ID)
        {
            RegisterUserDAL dal = new RegisterUserDAL();
            dal.UpdateRegisterUser(registerUser, ID);
        }

        public void DeleteRegisterUser(RegisterUser registerUser)
        {
            RegisterUserDAL dal = new RegisterUserDAL();
            dal.DeleteRegisterUser(registerUser);
        }

        public IList GetAllRegisterUsers(string strHQL)
        {
            RegisterUserDAL dal = new RegisterUserDAL();
            return dal.GetAllRegisterUsers(strHQL);
        }
    }
}