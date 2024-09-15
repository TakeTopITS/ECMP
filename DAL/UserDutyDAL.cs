using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserDutyDAL
    {
        private EntityControl control;

        public UserDutyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserDuty(UserDuty userDuty)
        {
            control.AddEntity(userDuty);
        }

        public void UpdateUserDuty(UserDuty userDuty, string Duty)
        {
            control.UpdateEntity(userDuty, Duty);
        }

        public void DeleteUserDuty(UserDuty userDuty)
        {
            control.DeleteEntity(userDuty);
        }

        public IList GetAllUserDutys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}