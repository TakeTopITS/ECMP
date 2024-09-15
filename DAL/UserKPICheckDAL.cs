using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserKPICheckDAL
    {
        private EntityControl control;

        public UserKPICheckDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserKPICheck(UserKPICheck userKPICheck)
        {
            control.AddEntity(userKPICheck);
        }

        public void UpdateUserKPICheck(UserKPICheck userKPICheck, int KPICheckID)
        {
            control.UpdateEntity(userKPICheck, KPICheckID);
        }

        public void DeleteUserKPICheck(UserKPICheck userKPICheck)
        {
            control.DeleteEntity(userKPICheck);
        }

        public IList GetAllUserKPIChecks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}