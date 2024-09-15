using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedAssetPurchaseOrderDAL
    {
        private EntityControl control;

        public ConstractRelatedAssetPurchaseOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedAssetPurchaseOrder(ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder)
        {
            control.AddEntity(constractRelatedAssetPurchaseOrder);
        }

        public void UpdateConstractRelatedAssetPurchaseOrder(ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder, int ID)
        {
            control.UpdateEntity(constractRelatedAssetPurchaseOrder, ID);
        }

        public void DeleteConstractRelatedAssetPurchaseOrder(ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder)
        {
            control.DeleteEntity(constractRelatedAssetPurchaseOrder);
        }

        public IList GetAllConstractRelatedAssetPurchaseOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}