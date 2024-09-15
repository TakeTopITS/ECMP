using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractChangeRecordBLL
    {
        public void AddConstractChangeRecord(ConstractChangeRecord constractChangeRecord)
        {
            ConstractChangeRecordDAL dal = new ConstractChangeRecordDAL();
            dal.AddConstractChangeRecord(constractChangeRecord);
        }

        public void UpdateConstractChangeRecord(ConstractChangeRecord constractChangeRecord, int ID)
        {
            ConstractChangeRecordDAL dal = new ConstractChangeRecordDAL();
            dal.UpdateConstractChangeRecord(constractChangeRecord, ID);
        }

        public void DeleteConstractChangeRecord(ConstractChangeRecord constractChangeRecord)
        {
            ConstractChangeRecordDAL dal = new ConstractChangeRecordDAL();
            dal.DeleteConstractChangeRecord(constractChangeRecord);
        }

        public IList GetAllConstractChangeRecords(string strHQL)
        {
            ConstractChangeRecordDAL dal = new ConstractChangeRecordDAL();
            return dal.GetAllConstractChangeRecords(strHQL);
        }
    }
}