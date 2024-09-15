using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseOfferRecordBLL
    {
        public void AddWZPurchaseOfferRecord(WZPurchaseOfferRecord wZPurchaseOfferRecord)
        {
            WZPurchaseOfferRecordDAL dal = new WZPurchaseOfferRecordDAL();
            dal.AddWZPurchaseOfferRecord(wZPurchaseOfferRecord);
        }

        public void UpdateWZPurchaseOfferRecord(WZPurchaseOfferRecord wZPurchaseOfferRecord, int ID)
        {
            WZPurchaseOfferRecordDAL dal = new WZPurchaseOfferRecordDAL();
            dal.UpdateWZPurchaseOfferRecord(wZPurchaseOfferRecord, ID);
        }

        public void DeleteWZPurchaseOfferRecord(WZPurchaseOfferRecord wZPurchaseOfferRecord)
        {
            WZPurchaseOfferRecordDAL dal = new WZPurchaseOfferRecordDAL();
            dal.DeleteWZPurchaseOfferRecord(wZPurchaseOfferRecord);
        }

        public IList GetAllWZPurchaseOfferRecords(string strHQL)
        {
            WZPurchaseOfferRecordDAL dal = new WZPurchaseOfferRecordDAL();
            return dal.GetAllWZPurchaseOfferRecords(strHQL);
        }
    }
}