using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectWorkConfirmLogDAL
    {
        private EntityControl control;

        public RCJProjectWorkConfirmLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectWorkConfirmLog(RCJProjectWorkConfirmLog pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectWorkConfirmLog(RCJProjectWorkConfirmLog pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectWorkConfirmLog(RCJProjectWorkConfirmLog pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectWorkConfirmLog(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}