using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WebSiteDAL
    {
        private EntityControl control;

        public WebSiteDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWebSite(WebSite webSite)
        {
            control.AddEntity(webSite);
        }

        public void UpdateWebSite(WebSite webSite, int ID)
        {
            control.UpdateEntity(webSite, ID);
        }

        public void DeleteWebSite(WebSite webSite)
        {
            control.DeleteEntity(webSite);
        }

        public IList GetAllWebSites(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}