using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsMTRecordBLL
    {
        public void AddGoodsMTRecord(GoodsMTRecord goodsMTRecord)
        {
            GoodsMTRecordDAL dal = new GoodsMTRecordDAL();
            dal.AddGoodsMTRecord(goodsMTRecord);
        }

        public void UpdateGoodsMTRecord(GoodsMTRecord goodsMTRecord, int ID)
        {
            GoodsMTRecordDAL dal = new GoodsMTRecordDAL();
            dal.UpdateGoodsMTRecord(goodsMTRecord, ID);
        }

        public void DeleteGoodsMTRecord(GoodsMTRecord goodsMTRecord)
        {
            GoodsMTRecordDAL dal = new GoodsMTRecordDAL();
            dal.DeleteGoodsMTRecord(goodsMTRecord);
        }

        public IList GetAllGoodsMTRecords(string strHQL)
        {
            GoodsMTRecordDAL dal = new GoodsMTRecordDAL();
            return dal.GetAllGoodsMTRecords(strHQL);
        }
    }
}