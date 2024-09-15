using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetScrapeBLL
    {
        public void AddAssetScrape(AssetScrape assetScrape)
        {
            AssetScrapeDAL dal = new AssetScrapeDAL();
            dal.AddAssetScrape(assetScrape);
        }

        public void UpdateAssetScrape(AssetScrape assetScrape, int ID)
        {
            AssetScrapeDAL dal = new AssetScrapeDAL();
            dal.UpdateAssetScrape(assetScrape, ID);
        }

        public void DeleteAssetScrape(AssetScrape assetScrape)
        {
            AssetScrapeDAL dal = new AssetScrapeDAL();
            dal.DeleteAssetScrape(assetScrape);
        }

        public IList GetAllAssetScrapes(string strHQL)
        {
            AssetScrapeDAL dal = new AssetScrapeDAL();
            return dal.GetAllAssetScrapes(strHQL);
        }
    }
}