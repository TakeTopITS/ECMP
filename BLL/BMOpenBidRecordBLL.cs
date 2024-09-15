using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 开标记录
    /// </summary>
    public class BMOpenBidRecordBLL
    {
        public void AddBMOpenBidRecord(BMOpenBidRecord bMOpenBidRecord)
        {
            BMOpenBidRecordDAL dal = new BMOpenBidRecordDAL();
            dal.AddBMOpenBidRecord(bMOpenBidRecord);
        }

        public void UpdateBMOpenBidRecord(BMOpenBidRecord bMOpenBidRecord, int ID)
        {
            BMOpenBidRecordDAL dal = new BMOpenBidRecordDAL();
            dal.UpdateBMOpenBidRecord(bMOpenBidRecord, ID);
        }

        public void DeleteBMOpenBidRecord(BMOpenBidRecord bMOpenBidRecord)
        {
            BMOpenBidRecordDAL dal = new BMOpenBidRecordDAL();
            dal.DeleteBMOpenBidRecord(bMOpenBidRecord);
        }

        public IList GetAllBMOpenBidRecords(string strHQL)
        {
            BMOpenBidRecordDAL dal = new BMOpenBidRecordDAL();
            return dal.GetAllBMOpenBidRecords(strHQL);
        }
    }
}