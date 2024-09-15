using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetApplicationDetailBLL
    {
        public void AddAssetApplicationDetail(AssetApplicationDetail assetApplicationDetail)
        {
            AssetApplicationDetailDAL dal = new AssetApplicationDetailDAL();
            dal.AddAssetApplicationDetail(assetApplicationDetail);
        }

        public void UpdateAssetApplicationDetail(AssetApplicationDetail assetApplicationDetail, int ID)
        {
            AssetApplicationDetailDAL dal = new AssetApplicationDetailDAL();
            dal.UpdateAssetApplicationDetail(assetApplicationDetail, ID);
        }

        public void DeleteAssetApplicationDetail(AssetApplicationDetail assetApplicationDetail)
        {
            AssetApplicationDetailDAL dal = new AssetApplicationDetailDAL();
            dal.DeleteAssetApplicationDetail(assetApplicationDetail);
        }

        public IList GetAllAssetApplicationDetails(string strHQL)
        {
            AssetApplicationDetailDAL dal = new AssetApplicationDetailDAL();
            return dal.GetAllAssetApplicationDetails(strHQL);
        }
    }
}