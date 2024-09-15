using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseSupplierBLL
    {
        public void AddWZPurchaseSupplier(WZPurchaseSupplier wZPurchaseSupplier)
        {
            WZPurchaseSupplierDAL dal = new WZPurchaseSupplierDAL();
            dal.AddWZPurchaseSupplier(wZPurchaseSupplier);
        }

        public void UpdateWZPurchaseSupplier(WZPurchaseSupplier wZPurchaseSupplier, int ID)
        {
            WZPurchaseSupplierDAL dal = new WZPurchaseSupplierDAL();
            dal.UpdateWZPurchaseSupplier(wZPurchaseSupplier, ID);
        }

        public void DeleteWZPurchaseSupplier(WZPurchaseSupplier wZPurchaseSupplier)
        {
            WZPurchaseSupplierDAL dal = new WZPurchaseSupplierDAL();
            dal.DeleteWZPurchaseSupplier(wZPurchaseSupplier);
        }

        public IList GetAllWZPurchaseSuppliers(string strHQL)
        {
            WZPurchaseSupplierDAL dal = new WZPurchaseSupplierDAL();
            return dal.GetAllWZPurchaseSuppliers(strHQL);
        }
    }
}