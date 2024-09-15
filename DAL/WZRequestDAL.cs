using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZRequestDAL
    {
        private EntityControl control;

        public WZRequestDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZRequest(WZRequest wZRequest)
        {
            control.AddEntity(wZRequest);
        }

        public void UpdateWZRequest(WZRequest wZRequest, string strRequestCode)
        {
            control.UpdateEntity(wZRequest, strRequestCode);
        }

        public void DeleteWZRequest(WZRequest wZRequest)
        {
            control.DeleteEntity(wZRequest);
        }

        public IList GetAllAccounts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}