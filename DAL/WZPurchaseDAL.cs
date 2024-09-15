using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseDAL
    {
        private EntityControl control;

        public WZPurchaseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchase(WZPurchase wZPurchase)
        {
            control.AddEntity(wZPurchase);
        }

        public void UpdateWZPurchase(WZPurchase wZPurchase, string PurchaseCode)
        {
            control.UpdateEntity(wZPurchase, PurchaseCode);
        }

        public void DeleteWZPurchase(WZPurchase wZPurchase)
        {
            control.DeleteEntity(wZPurchase);
        }

        public IList GetAllWZPurchases(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}