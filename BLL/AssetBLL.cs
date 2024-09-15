using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetBLL
    {
        public void AddAsset(Asset asset)
        {
            AssetDAL dal = new AssetDAL();
            dal.AddAsset(asset);
        }

        public void UpdateAsset(Asset asset, int ID)
        {
            AssetDAL dal = new AssetDAL();
            dal.UpdateAsset(asset, ID);
        }

        public void DeleteAsset(Asset asset)
        {
            AssetDAL dal = new AssetDAL();
            dal.DeleteAsset(asset);
        }

        public IList GetAllAssets(string strHQL)
        {
            AssetDAL dal = new AssetDAL();
            return dal.GetAllAssets(strHQL);
        }
    }
}