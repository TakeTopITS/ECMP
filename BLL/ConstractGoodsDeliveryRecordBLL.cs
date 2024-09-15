using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractGoodsDeliveryRecordBLL
    {
        public void AddConstractGoodsDeliveryRecord(ConstractGoodsDeliveryRecord constractGoodsDeliveryRecord)
        {
            ConstractGoodsDeliveryRecordDAL dal = new ConstractGoodsDeliveryRecordDAL();
            dal.AddConstractGoodsDeliveryRecord(constractGoodsDeliveryRecord);
        }

        public void UpdateConstractGoodsDeliveryRecord(ConstractGoodsDeliveryRecord constractGoodsDeliveryRecord, int ID)
        {
            ConstractGoodsDeliveryRecordDAL dal = new ConstractGoodsDeliveryRecordDAL();
            dal.UpdateConstractGoodsDeliveryRecord(constractGoodsDeliveryRecord, ID);
        }

        public void DeleteConstractGoodsDeliveryRecord(ConstractGoodsDeliveryRecord constractGoodsDeliveryRecord)
        {
            ConstractGoodsDeliveryRecordDAL dal = new ConstractGoodsDeliveryRecordDAL();
            dal.DeleteConstractGoodsDeliveryRecord(constractGoodsDeliveryRecord);
        }

        public IList GetAllConstractGoodsDeliveryRecords(string strHQL)
        {
            ConstractGoodsDeliveryRecordDAL dal = new ConstractGoodsDeliveryRecordDAL();
            return dal.GetAllConstractGoodsDeliveryRecords(strHQL);
        }
    }
}