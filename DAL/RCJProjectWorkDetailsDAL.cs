using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectWorkDetailsDAL
    {
        private EntityControl control;

        public RCJProjectWorkDetailsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectWorkDetails(RCJProjectWorkDetails pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectWorkDetails(RCJProjectWorkDetails pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectWorkDetails(RCJProjectWorkDetails pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectWorkDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}