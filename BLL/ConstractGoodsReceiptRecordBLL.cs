using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractGoodsReceiptRecordBLL
    {
        public void AddConstractGoodsReceiptRecord(ConstractGoodsReceiptRecord constractGoodsReceiptRecord)
        {
            ConstractGoodsReceiptRecordDAL dal = new ConstractGoodsReceiptRecordDAL();
            dal.AddConstractGoodsReceiptRecord(constractGoodsReceiptRecord);
        }

        public void UpdateConstractGoodsReceiptRecord(ConstractGoodsReceiptRecord constractGoodsReceiptRecord, int ID)
        {
            ConstractGoodsReceiptRecordDAL dal = new ConstractGoodsReceiptRecordDAL();
            dal.UpdateConstractGoodsReceiptRecord(constractGoodsReceiptRecord, ID);
        }

        public void DeleteConstractGoodsReceiptRecord(ConstractGoodsReceiptRecord constractGoodsReceiptRecord)
        {
            ConstractGoodsReceiptRecordDAL dal = new ConstractGoodsReceiptRecordDAL();
            dal.DeleteConstractGoodsReceiptRecord(constractGoodsReceiptRecord);
        }

        public IList GetAllConstractGoodsReceiptRecords(string strHQL)
        {
            ConstractGoodsReceiptRecordDAL dal = new ConstractGoodsReceiptRecordDAL();
            return dal.GetAllConstractGoodsReceiptRecords(strHQL);
        }
    }
}