using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetPurchaseOrderDAL
    {
        private EntityControl control;

        public AssetPurchaseOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetPurchaseOrder(AssetPurchaseOrder assetPurchaseOrder)
        {
            control.AddEntity(assetPurchaseOrder);
        }

        public void UpdateAssetPurchaseOrder(AssetPurchaseOrder assetPurchaseOrder, int POID)
        {
            control.UpdateEntity(assetPurchaseOrder, POID);
        }

        public void DeleteAssetPurchaseOrder(AssetPurchaseOrder assetPurchaseOrder)
        {
            control.DeleteEntity(assetPurchaseOrder);
        }

        public IList GetAllAssetPurchaseOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}