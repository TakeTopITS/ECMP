using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RCJProjectSetupDAL
    {
        private EntityControl control;

        public RCJProjectSetupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRCJProjectSetup(RCJProjectSetup pwd)
        {
            control.AddEntity(pwd);
        }

        public void UpdateRCJProjectSetup(RCJProjectSetup pwd, int ID)
        {
            control.UpdateEntity(pwd, ID);
        }

        public void DeleteRCJProjectSetup(RCJProjectSetup pwd)
        {
            control.DeleteEntity(pwd);
        }

        public IList GetAllRCJProjectSetup(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}