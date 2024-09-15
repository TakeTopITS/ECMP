using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SystemActiveUserDAL
    {
        private EntityControl control;

        public SystemActiveUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSystemActiveUser(SystemActiveUser systemActiveUser)
        {
            control.AddEntity(systemActiveUser);
        }

        public void UpdateSystemActiveUser(SystemActiveUser systemActiveUser, string UserCode)
        {
            control.UpdateEntity(systemActiveUser, UserCode);
        }

        public void DeleteSystemActiveUser(SystemActiveUser systemActiveUser)
        {
            control.DeleteEntity(systemActiveUser);
        }

        public IList GetAllSystemActiveUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}