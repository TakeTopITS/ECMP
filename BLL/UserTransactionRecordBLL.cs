using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserTransactionRecordBLL
    {
        public void AddUserTransactionRecord(UserTransactionRecord userTransactionRecord)
        {
            UserTransactionRecordDAL dal = new UserTransactionRecordDAL();
            dal.AddUserTransactionRecord(userTransactionRecord);
        }

        public void UpdateUserTransactionRecord(UserTransactionRecord userTransactionRecord, int ID)
        {
            UserTransactionRecordDAL dal = new UserTransactionRecordDAL();
            dal.UpdateUserTransactionRecord(userTransactionRecord, ID);
        }

        public void DeleteUserTransactionRecord(UserTransactionRecord userTransactionRecord)
        {
            UserTransactionRecordDAL dal = new UserTransactionRecordDAL();
            dal.DeleteUserTransactionRecord(userTransactionRecord);
        }

        public IList GetAllUserTransactionRecords(string strHQL)
        {
            UserTransactionRecordDAL dal = new UserTransactionRecordDAL();
            return dal.GetAllUserTransactionRecords(strHQL);
        }
    }
}