using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWLineTransportDAL
    {
        private EntityControl control;

        public DWLineTransportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWLineTransport(DWLineTransport dWLineTransport)
        {
            control.AddEntity(dWLineTransport);
        }

        public void UpdateDWLineTransport(DWLineTransport dWLineTransport, int ID)
        {
            control.UpdateEntity(dWLineTransport, ID);
        }

        public void DeleteDWLineTransport(DWLineTransport dWLineTransport)
        {
            control.DeleteEntity(dWLineTransport);
        }

        public IList GetAllDWLineTransports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}