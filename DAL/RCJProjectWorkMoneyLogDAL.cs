using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectWorkMoneyLogDAL
    {
        private EntityControl control;

        public RCJProjectWorkMoneyLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectWorkMoneyLog(RCJProjectWorkMoneyLog pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectWorkMoneyLog(RCJProjectWorkMoneyLog pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectWorkMoneyLog(RCJProjectWorkMoneyLog pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectWorkMoneyLog(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}