using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 评标记录
    /// </summary>
    public class BMAssessBidRecordBLL
    {
        public void AddBMAssessBidRecord(BMAssessBidRecord bMAssessBidRecord)
        {
            BMAssessBidRecordDAL dal = new BMAssessBidRecordDAL();
            dal.AddBMAssessBidRecord(bMAssessBidRecord);
        }

        public void UpdateBMAssessBidRecord(BMAssessBidRecord bMAssessBidRecord, int ID)
        {
            BMAssessBidRecordDAL dal = new BMAssessBidRecordDAL();
            dal.UpdateBMAssessBidRecord(bMAssessBidRecord, ID);
        }

        public void DeleteBMAssessBidRecord(BMAssessBidRecord bMAssessBidRecord)
        {
            BMAssessBidRecordDAL dal = new BMAssessBidRecordDAL();
            dal.DeleteBMAssessBidRecord(bMAssessBidRecord);
        }

        public IList GetAllBMAssessBidRecords(string strHQL)
        {
            BMAssessBidRecordDAL dal = new BMAssessBidRecordDAL();
            return dal.GetAllBMAssessBidRecords(strHQL);
        }
    }
}