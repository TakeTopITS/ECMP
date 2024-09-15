using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractReceivablesRecordBLL
    {
        public void AddConstractReceivablesRecord(ConstractReceivablesRecord constractReceivablesRecord)
        {
            ConstractReceivablesRecordDAL dal = new ConstractReceivablesRecordDAL();
            dal.AddConstractReceivablesRecord(constractReceivablesRecord);
        }

        public void UpdateConstractReceivablesRecord(ConstractReceivablesRecord constractReceivablesRecord, int ID)
        {
            ConstractReceivablesRecordDAL dal = new ConstractReceivablesRecordDAL();
            dal.UpdateConstractReceivablesRecord(constractReceivablesRecord, ID);
        }

        public void DeleteConstractReceivablesRecord(ConstractReceivablesRecord constractReceivablesRecord)
        {
            ConstractReceivablesRecordDAL dal = new ConstractReceivablesRecordDAL();
            dal.DeleteConstractReceivablesRecord(constractReceivablesRecord);
        }

        public IList GetAllConstractReceivablesRecords(string strHQL)
        {
            ConstractReceivablesRecordDAL dal = new ConstractReceivablesRecordDAL();
            return dal.GetAllConstractReceivablesRecords(strHQL);
        }
    }
}