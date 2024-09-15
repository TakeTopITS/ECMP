using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectWorkMoneyDAL
    {
        private EntityControl control;

        public RCJProjectWorkMoneyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectWorkMoney(RCJProjectWorkMoney pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectWorkMoney(RCJProjectWorkMoney pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectWorkMoney(RCJProjectWorkMoney pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectWorkMoney(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}