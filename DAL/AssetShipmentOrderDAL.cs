using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetShipmentOrderDAL
    {
        private EntityControl control;

        public AssetShipmentOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetShipmentOrder(AssetShipmentOrder assetShipmentOrder)
        {
            control.AddEntity(assetShipmentOrder);
        }

        public void UpdateAssetShipmentOrder(AssetShipmentOrder assetShipmentOrder, int ShipmentNO)
        {
            control.UpdateEntity(assetShipmentOrder, ShipmentNO);
        }

        public void DeleteAssetShipmentOrder(AssetShipmentOrder assetShipmentOrder)
        {
            control.DeleteEntity(assetShipmentOrder);
        }

        public IList GetAllAssetShipmentOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}