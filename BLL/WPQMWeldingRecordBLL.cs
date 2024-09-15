using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 焊接记录表
    /// </summary>
    public class WPQMWeldingRecordBLL
    {
        public void AddWPQMWeldingRecord(WPQMWeldingRecord wPQMWeldingRecord)
        {
            WPQMWeldingRecordDAL dal = new WPQMWeldingRecordDAL();
            dal.AddWPQMWeldingRecord(wPQMWeldingRecord);
        }

        public void UpdateWPQMWeldingRecord(WPQMWeldingRecord wPQMWeldingRecord, int ID)
        {
            WPQMWeldingRecordDAL dal = new WPQMWeldingRecordDAL();
            dal.UpdateWPQMWeldingRecord(wPQMWeldingRecord, ID);
        }

        public void DeleteWPQMWeldingRecord(WPQMWeldingRecord wPQMWeldingRecord)
        {
            WPQMWeldingRecordDAL dal = new WPQMWeldingRecordDAL();
            dal.DeleteWPQMWeldingRecord(wPQMWeldingRecord);
        }

        public IList GetAllWPQMWeldingRecords(string strHQL)
        {
            WPQMWeldingRecordDAL dal = new WPQMWeldingRecordDAL();
            return dal.GetAllWPQMWeldingRecords(strHQL);
        }
    }
}