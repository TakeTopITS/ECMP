using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WebSiteBLL
    {
        public void AddWebSite(WebSite webSite)
        {
            WebSiteDAL dal = new WebSiteDAL();
            dal.AddWebSite(webSite);
        }

        public void UpdateWebSite(WebSite webSite, int ID)
        {
            WebSiteDAL dal = new WebSiteDAL();
            dal.UpdateWebSite(webSite, ID);
        }

        public void DeleteWebSite(WebSite webSite)
        {
            WebSiteDAL dal = new WebSiteDAL();
            dal.DeleteWebSite(webSite);
        }

        public IList GetAllWebSites(string strHQL)
        {
            WebSiteDAL dal = new WebSiteDAL();
            return dal.GetAllWebSites(strHQL);
        }
    }
}