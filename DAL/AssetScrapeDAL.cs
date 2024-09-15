using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetScrapeDAL
    {
        private EntityControl control;

        public AssetScrapeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetScrape(AssetScrape assetScrape)
        {
            control.AddEntity(assetScrape);
        }

        public void UpdateAssetScrape(AssetScrape assetScrape, int ID)
        {
            control.UpdateEntity(assetScrape, ID);
        }

        public void DeleteAssetScrape(AssetScrape assetScrape)
        {
            control.DeleteEntity(assetScrape);
        }

        public IList GetAllAssetScrapes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}