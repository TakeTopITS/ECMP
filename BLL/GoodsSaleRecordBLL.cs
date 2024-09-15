using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsSaleRecordBLL
    {
        public void AddGoodsSaleRecord(GoodsSaleRecord goodsSaleRecord)
        {
            GoodsSaleRecordDAL dal = new GoodsSaleRecordDAL();
            dal.AddGoodsSaleRecord(goodsSaleRecord);
        }

        public void UpdateGoodsSaleRecord(GoodsSaleRecord goodsSaleRecord, int ID)
        {
            GoodsSaleRecordDAL dal = new GoodsSaleRecordDAL();
            dal.UpdateGoodsSaleRecord(goodsSaleRecord, ID);
        }

        public void DeleteGoodsSaleRecord(GoodsSaleRecord goodsSaleRecord)
        {
            GoodsSaleRecordDAL dal = new GoodsSaleRecordDAL();
            dal.DeleteGoodsSaleRecord(goodsSaleRecord);
        }

        public IList GetAllGoodsSaleRecords(string strHQL)
        {
            GoodsSaleRecordDAL dal = new GoodsSaleRecordDAL();
            return dal.GetAllGoodsSaleRecords(strHQL);
        }
    }
}