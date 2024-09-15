using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseOfferRecordDAL
    {
        private EntityControl control;

        public WZPurchaseOfferRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseOfferRecord(WZPurchaseOfferRecord wZPurchaseOfferRecord)
        {
            control.AddEntity(wZPurchaseOfferRecord);
        }

        public void UpdateWZPurchaseOfferRecord(WZPurchaseOfferRecord wZPurchaseOfferRecord, int ID)
        {
            control.UpdateEntity(wZPurchaseOfferRecord, ID);
        }

        public void DeleteWZPurchaseOfferRecord(WZPurchaseOfferRecord wZPurchaseOfferRecord)
        {
            control.DeleteEntity(wZPurchaseOfferRecord);
        }

        public IList GetAllWZPurchaseOfferRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}