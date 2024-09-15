using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetCheckInOrderBLL
    {
        public void AddAssetCheckInOrder(AssetCheckInOrder assetCheckInOrder)
        {
            AssetCheckInOrderDAL dal = new AssetCheckInOrderDAL();
            dal.AddAssetCheckInOrder(assetCheckInOrder);
        }

        public void UpdateAssetCheckInOrder(AssetCheckInOrder assetCheckInOrder, int CheckInID)
        {
            AssetCheckInOrderDAL dal = new AssetCheckInOrderDAL();
            dal.UpdateAssetCheckInOrder(assetCheckInOrder, CheckInID);
        }

        public void DeleteAssetCheckInOrder(AssetCheckInOrder assetCheckInOrder)
        {
            AssetCheckInOrderDAL dal = new AssetCheckInOrderDAL();
            dal.DeleteAssetCheckInOrder(assetCheckInOrder);
        }

        public IList GetAllAssetCheckInOrders(string strHQL)
        {
            AssetCheckInOrderDAL dal = new AssetCheckInOrderDAL();
            return dal.GetAllAssetCheckInOrders(strHQL);
        }
    }
}