using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WLStatusDAL
    {
        private EntityControl control;

        public WLStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWLStatus(WLStatus wlStatus)
        {
            control.AddEntity(wlStatus);
        }

        public void UpdateWLStatus(WLStatus wlStatus, string Status)
        {
            control.UpdateEntity(wlStatus, Status);
        }

        public void DeleteWLStatus(WLStatus wlStatus)
        {
            control.DeleteEntity(wlStatus);
        }

        public IList GetAllWLStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}