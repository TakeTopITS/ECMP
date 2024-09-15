using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetTypeBLL
    {
        public void AddAssetType(AssetType assetType)
        {
            AssetTypeDAL dal = new AssetTypeDAL();
            dal.AddAssetType(assetType);
        }

        public void UpdateAssetType(AssetType assetType, string Type)
        {
            AssetTypeDAL dal = new AssetTypeDAL();
            dal.UpdateAssetType(assetType, Type);
        }

        public void DeleteAssetType(AssetType assetType)
        {
            AssetTypeDAL dal = new AssetTypeDAL();
            dal.DeleteAssetType(assetType);
        }

        public IList GetAllAssetTypes(string strHQL)
        {
            AssetTypeDAL dal = new AssetTypeDAL();
            return dal.GetAllAssetTypes(strHQL);
        }
    }
}