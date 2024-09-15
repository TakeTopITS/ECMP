using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetPurchaseOrderBLL
    {
        public void AddAssetPurchaseOrder(AssetPurchaseOrder assetAssetPurchaseOrder)
        {
            AssetPurchaseOrderDAL dal = new AssetPurchaseOrderDAL();
            dal.AddAssetPurchaseOrder(assetAssetPurchaseOrder);
        }

        public void UpdateAssetPurchaseOrder(AssetPurchaseOrder assetAssetPurchaseOrder, int POID)
        {
            AssetPurchaseOrderDAL dal = new AssetPurchaseOrderDAL();
            dal.UpdateAssetPurchaseOrder(assetAssetPurchaseOrder, POID);
        }

        public void DeleteAssetPurchaseOrder(AssetPurchaseOrder assetAssetPurchaseOrder)
        {
            AssetPurchaseOrderDAL dal = new AssetPurchaseOrderDAL();
            dal.DeleteAssetPurchaseOrder(assetAssetPurchaseOrder);
        }

        public IList GetAllAssetPurchaseOrders(string strHQL)
        {
            AssetPurchaseOrderDAL dal = new AssetPurchaseOrderDAL();
            return dal.GetAllAssetPurchaseOrders(strHQL);
        }
    }
}