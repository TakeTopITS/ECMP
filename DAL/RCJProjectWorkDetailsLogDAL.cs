using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectWorkDetailsLogDAL
    {
        private EntityControl control;

        public RCJProjectWorkDetailsLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectWorkDetailsLog(RCJProjectWorkDetailsLog pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectWorkDetailsLog(RCJProjectWorkDetailsLog pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectWorkDetailsLog(RCJProjectWorkDetailsLog pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectWorkDetailsLog(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}