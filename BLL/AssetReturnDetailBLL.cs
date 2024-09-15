using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetReturnDetailBLL
    {
        public void AddAssetReturnDetail(AssetReturnDetail assetReturnDetail)
        {
            AssetReturnDetailDAL dal = new AssetReturnDetailDAL();
            dal.AddAssetReturnDetail(assetReturnDetail);
        }

        public void UpdateAssetReturnDetail(AssetReturnDetail assetReturnDetail, int ID)
        {
            AssetReturnDetailDAL dal = new AssetReturnDetailDAL();
            dal.UpdateAssetReturnDetail(assetReturnDetail, ID);
        }

        public void DeleteAssetReturnDetail(AssetReturnDetail assetReturnDetail)
        {
            AssetReturnDetailDAL dal = new AssetReturnDetailDAL();
            dal.DeleteAssetReturnDetail(assetReturnDetail);
        }

        public IList GetAllAssetReturnDetails(string strHQL)
        {
            AssetReturnDetailDAL dal = new AssetReturnDetailDAL();
            return dal.GetAllAssetReturnDetails(strHQL);
        }
    }
}