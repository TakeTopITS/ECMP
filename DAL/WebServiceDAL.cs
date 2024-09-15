using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WebServiceDAL
    {
        private EntityControl control;

        public WebServiceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWebService(WebService webService)
        {
            control.AddEntity(webService);
        }

        public void UpdateWebService(WebService webService, int ID)
        {
            control.UpdateEntity(webService, ID);
        }

        public void DeleteWebService(WebService webService)
        {
            control.DeleteEntity(webService);
        }

        public IList GetAllWebServices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}