using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserTransactionRecordDAL
    {
        private EntityControl control;

        public UserTransactionRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserTransactionRecord(UserTransactionRecord userTransactionRecord)
        {
            control.AddEntity(userTransactionRecord);
        }

        public void UpdateUserTransactionRecord(UserTransactionRecord userTransactionRecord, int ID)
        {
            control.UpdateEntity(userTransactionRecord, ID);
        }

        public void DeleteUserTransactionRecord(UserTransactionRecord userTransactionRecord)
        {
            control.DeleteEntity(userTransactionRecord);
        }

        public IList GetAllUserTransactionRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}