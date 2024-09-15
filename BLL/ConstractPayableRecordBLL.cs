using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractPayableRecordBLL
    {
        public void AddConstractPayableRecord(ConstractPayableRecord constractPayableRecord)
        {
            ConstractPayableRecordDAL dal = new ConstractPayableRecordDAL();
            dal.AddConstractPayableRecord(constractPayableRecord);
        }

        public void UpdateConstractPayableRecord(ConstractPayableRecord constractPayableRecord, int ID)
        {
            ConstractPayableRecordDAL dal = new ConstractPayableRecordDAL();
            dal.UpdateConstractPayableRecord(constractPayableRecord, ID);
        }

        public void DeleteConstractPayableRecord(ConstractPayableRecord constractPayableRecord)
        {
            ConstractPayableRecordDAL dal = new ConstractPayableRecordDAL();
            dal.DeleteConstractPayableRecord(constractPayableRecord);
        }

        public IList GetAllConstractPayableRecords(string strHQL)
        {
            ConstractPayableRecordDAL dal = new ConstractPayableRecordDAL();
            return dal.GetAllConstractPayableRecords(strHQL);
        }
    }
}