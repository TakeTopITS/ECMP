using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetCheckInOrderDetailBLL
    {
        public void AddAssetCheckInOrderDetail(AssetCheckInOrderDetail assetCheckInOrderDetail)
        {
            AssetCheckInOrderDetailDAL dal = new AssetCheckInOrderDetailDAL();
            dal.AddAssetCheckInOrderDetail(assetCheckInOrderDetail);
        }

        public void UpdateAssetCheckInOrderDetail(AssetCheckInOrderDetail assetCheckInOrderDetail, int ID)
        {
            AssetCheckInOrderDetailDAL dal = new AssetCheckInOrderDetailDAL();
            dal.UpdateAssetCheckInOrderDetail(assetCheckInOrderDetail, ID);
        }

        public void DeleteAssetCheckInOrderDetail(AssetCheckInOrderDetail assetCheckInOrderDetail)
        {
            AssetCheckInOrderDetailDAL dal = new AssetCheckInOrderDetailDAL();
            dal.DeleteAssetCheckInOrderDetail(assetCheckInOrderDetail);
        }

        public IList GetAllAssetCheckInOrderDetails(string strHQL)
        {
            AssetCheckInOrderDetailDAL dal = new AssetCheckInOrderDetailDAL();
            return dal.GetAllAssetCheckInOrderDetails(strHQL);
        }
    }
}