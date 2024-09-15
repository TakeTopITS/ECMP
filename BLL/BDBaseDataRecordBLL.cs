using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 预算数据更改前历史记录
    /// </summary>
    public class BDBaseDataRecordBLL
    {
        public void AddBDBaseDataRecord(BDBaseDataRecord bDBaseDataRecord)
        {
            BDBaseDataRecordDAL dal = new BDBaseDataRecordDAL();
            dal.AddBDBaseDataRecord(bDBaseDataRecord);
        }

        public void UpdateBDBaseDataRecord(BDBaseDataRecord bDBaseDataRecord, int ID)
        {
            BDBaseDataRecordDAL dal = new BDBaseDataRecordDAL();
            dal.UpdateBDBaseDataRecord(bDBaseDataRecord, ID);
        }

        public void DeleteBDBaseDataRecord(BDBaseDataRecord bDBaseDataRecord)
        {
            BDBaseDataRecordDAL dal = new BDBaseDataRecordDAL();
            dal.DeleteBDBaseDataRecord(bDBaseDataRecord);
        }

        public IList GetAllBDBaseDataRecords(string strHQL)
        {
            BDBaseDataRecordDAL dal = new BDBaseDataRecordDAL();
            return dal.GetAllBDBaseDataRecords(strHQL);
        }
    }
}