using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedAssetPurchaseOrderBLL
    {
        public void AddConstractRelatedAssetPurchaseOrder(ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder)
        {
            ConstractRelatedAssetPurchaseOrderDAL dal = new ConstractRelatedAssetPurchaseOrderDAL();
            dal.AddConstractRelatedAssetPurchaseOrder(constractRelatedAssetPurchaseOrder);
        }

        public void UpdateConstractRelatedAssetPurchaseOrder(ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder, int ID)
        {
            ConstractRelatedAssetPurchaseOrderDAL dal = new ConstractRelatedAssetPurchaseOrderDAL();
            dal.UpdateConstractRelatedAssetPurchaseOrder(constractRelatedAssetPurchaseOrder, ID);
        }

        public void DeleteConstractRelatedAssetPurchaseOrder(ConstractRelatedAssetPurchaseOrder constractRelatedAssetPurchaseOrder)
        {
            ConstractRelatedAssetPurchaseOrderDAL dal = new ConstractRelatedAssetPurchaseOrderDAL();
            dal.DeleteConstractRelatedAssetPurchaseOrder(constractRelatedAssetPurchaseOrder);
        }

        public IList GetAllConstractRelatedAssetPurchaseOrders(string strHQL)
        {
            ConstractRelatedAssetPurchaseOrderDAL dal = new ConstractRelatedAssetPurchaseOrderDAL();
            return dal.GetAllConstractRelatedAssetPurchaseOrders(strHQL);
        }
    }
}