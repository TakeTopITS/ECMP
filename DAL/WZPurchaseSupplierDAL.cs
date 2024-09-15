using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseSupplierDAL
    {
        private EntityControl control;

        public WZPurchaseSupplierDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseSupplier(WZPurchaseSupplier wZPurchaseSupplier)
        {
            control.AddEntity(wZPurchaseSupplier);
        }

        public void UpdateWZPurchaseSupplier(WZPurchaseSupplier wZPurchaseSupplier, int ID)
        {
            control.UpdateEntity(wZPurchaseSupplier, ID);
        }

        public void DeleteWZPurchaseSupplier(WZPurchaseSupplier wZPurchaseSupplier)
        {
            control.DeleteEntity(wZPurchaseSupplier);
        }

        public IList GetAllWZPurchaseSuppliers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}