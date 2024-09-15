using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZCompactCheckDAL
    {
        private EntityControl control;

        public WZCompactCheckDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZCompactCheck(WZCompactCheck wZCompactCheck)
        {
            control.AddEntity(wZCompactCheck);
        }

        public void UpdateWZCompactCheck(WZCompactCheck wZCompactCheck, int ID)
        {
            control.UpdateEntity(wZCompactCheck, ID);
        }

        public void DeleteWZCompactCheck(WZCompactCheck wZCompactCheck)
        {
            control.DeleteEntity(wZCompactCheck);
        }

        public IList GetAllWZCompactChecks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}