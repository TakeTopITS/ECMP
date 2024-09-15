using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDHotHandlerDAL
    {
        private EntityControl control;

        public GDHotHandlerDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDHotHandler(GDHotHandler gDHotHandler)
        {
            control.AddEntity(gDHotHandler);
        }

        public void UpdateGDHotHandler(GDHotHandler gDHotHandler, int ID)
        {
            control.UpdateEntity(gDHotHandler, ID);
        }

        public void DeleteGDHotHandler(GDHotHandler gDHotHandler)
        {
            control.DeleteEntity(gDHotHandler);
        }

        public IList GetAllGDHotHandlers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}