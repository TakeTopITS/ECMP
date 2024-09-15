using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SiteModuleContentDAL
    {
        private EntityControl control;

        public SiteModuleContentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSiteModuleContent(SiteModuleContent siteModuleContent)
        {
            control.AddEntity(siteModuleContent);
        }

        public void UpdateSiteModuleContent(SiteModuleContent siteModuleContent, int ID)
        {
            control.UpdateEntity(siteModuleContent, ID);
        }

        public void DeleteSiteModuleContent(SiteModuleContent siteModuleContent)
        {
            control.DeleteEntity(siteModuleContent);
        }

        public IList GetAllSiteModuleContents(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}