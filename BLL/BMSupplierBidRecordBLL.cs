using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 供应商投标历史记录
    /// </summary>
    public class BMSupplierBidRecordBLL
    {
        public void AddBMSupplierBidRecord(BMSupplierBidRecord bMSupplierBidRecord)
        {
            BMSupplierBidRecordDAL dal = new BMSupplierBidRecordDAL();
            dal.AddBMSupplierBidRecord(bMSupplierBidRecord);
        }

        public void UpdateBMSupplierBidRecord(BMSupplierBidRecord bMSupplierBidRecord, int ID)
        {
            BMSupplierBidRecordDAL dal = new BMSupplierBidRecordDAL();
            dal.UpdateBMSupplierBidRecord(bMSupplierBidRecord, ID);
        }

        public void DeleteBMSupplierBidRecord(BMSupplierBidRecord bMSupplierBidRecord)
        {
            BMSupplierBidRecordDAL dal = new BMSupplierBidRecordDAL();
            dal.DeleteBMSupplierBidRecord(bMSupplierBidRecord);
        }

        public IList GetAllBMSupplierBidRecords(string strHQL)
        {
            BMSupplierBidRecordDAL dal = new BMSupplierBidRecordDAL();
            return dal.GetAllBMSupplierBidRecords(strHQL);
        }
    }
}