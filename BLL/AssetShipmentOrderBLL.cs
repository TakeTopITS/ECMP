using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetShipmentOrderBLL
    {
        public void AddAssetShipmentOrder(AssetShipmentOrder assetShipmentOrder)
        {
            AssetShipmentOrderDAL dal = new AssetShipmentOrderDAL();
            dal.AddAssetShipmentOrder(assetShipmentOrder);
        }

        public void UpdateAssetShipmentOrder(AssetShipmentOrder assetShipmentOrder, int ShipmentNO)
        {
            AssetShipmentOrderDAL dal = new AssetShipmentOrderDAL();
            dal.UpdateAssetShipmentOrder(assetShipmentOrder, ShipmentNO);
        }

        public void DeleteAssetShipmentOrder(AssetShipmentOrder assetShipmentOrder)
        {
            AssetShipmentOrderDAL dal = new AssetShipmentOrderDAL();
            dal.DeleteAssetShipmentOrder(assetShipmentOrder);
        }

        public IList GetAllAssetShipmentOrders(string strHQL)
        {
            AssetShipmentOrderDAL dal = new AssetShipmentOrderDAL();
            return dal.GetAllAssetShipmentOrders(strHQL);
        }
    }
}