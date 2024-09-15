using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProStatusChangeDAL
    {
        private EntityControl control;

        public ProStatusChangeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProStatusChange(ProStatusChange proStatusChange)
        {
            control.AddEntity(proStatusChange);
        }

        public void UpdateProStatusChange(ProStatusChange proStatusChange, int ID)
        {
            control.UpdateEntity(proStatusChange, ID);
        }

        public void DeleteProStatusChange(ProStatusChange proStatusChange)
        {
            control.DeleteEntity(proStatusChange);
        }

        public IList GetAllProStatusChanges(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}