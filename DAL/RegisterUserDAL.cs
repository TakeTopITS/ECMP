using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RegisterUserDAL
    {
        private EntityControl control;

        public RegisterUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRegisterUser(RegisterUser registerUser)
        {
            control.AddEntity(registerUser);
        }

        public void UpdateRegisterUser(RegisterUser registerUser, int ID)
        {
            control.UpdateEntity(registerUser, ID);
        }

        public void DeleteRegisterUser(RegisterUser registerUser)
        {
            control.DeleteEntity(registerUser);
        }

        public IList GetAllRegisterUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}