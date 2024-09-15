using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseBLL
    {
        public void AddWZPurchase(WZPurchase wZPurchase)
        {
            WZPurchaseDAL dal = new WZPurchaseDAL();
            dal.AddWZPurchase(wZPurchase);
        }

        public void UpdateWZPurchase(WZPurchase wZPurchase, string PurchaseCode)
        {
            WZPurchaseDAL dal = new WZPurchaseDAL();
            dal.UpdateWZPurchase(wZPurchase, PurchaseCode);
        }

        public void DeleteWZPurchase(WZPurchase wZPurchase)
        {
            WZPurchaseDAL dal = new WZPurchaseDAL();
            dal.DeleteWZPurchase(wZPurchase);
        }

        public IList GetAllWZPurchases(string strHQL)
        {
            WZPurchaseDAL dal = new WZPurchaseDAL();
            return dal.GetAllWZPurchases(strHQL);
        }
    }
}