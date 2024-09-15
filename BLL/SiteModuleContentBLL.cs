using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SiteModuleContentBLL
    {
        public void AddSiteModuleContent(SiteModuleContent siteModuleContent)
        {
            SiteModuleContentDAL dal = new SiteModuleContentDAL();
            dal.AddSiteModuleContent(siteModuleContent);
        }

        public void UpdateSiteModuleContent(SiteModuleContent siteModuleContent, int ID)
        {
            SiteModuleContentDAL dal = new SiteModuleContentDAL();
            dal.UpdateSiteModuleContent(siteModuleContent, ID);
        }

        public void DeleteSiteModuleContent(SiteModuleContent siteModuleContent)
        {
            SiteModuleContentDAL dal = new SiteModuleContentDAL();
            dal.DeleteSiteModuleContent(siteModuleContent);
        }

        public IList GetAllSiteModuleContents(string strHQL)
        {
            SiteModuleContentDAL dal = new SiteModuleContentDAL();
            return dal.GetAllSiteModuleContents(strHQL);
        }
    }
}