using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectWorkConfirmDAL
    {
        private EntityControl control;

        public RCJProjectWorkConfirmDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectWorkConfirm(RCJProjectWorkConfirm pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectWorkConfirm(RCJProjectWorkConfirm pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectWorkConfirm(RCJProjectWorkConfirm pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectWorkConfirm(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}