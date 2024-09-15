using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerQuestionHandleRecordDAL
    {
        private EntityControl control;

        public CustomerQuestionHandleRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerQuestionHandleRecord(CustomerQuestionHandleRecord customerQuestionHandleRecord)
        {
            control.AddEntity(customerQuestionHandleRecord);
        }

        public void UpdateCustomerQuestionHandleRecord(CustomerQuestionHandleRecord customerQuestionHandleRecord, int ID)
        {
            control.UpdateEntity(customerQuestionHandleRecord, ID);
        }

        public void DeleteCustomerQuestionHandleRecord(CustomerQuestionHandleRecord customerQuestionHandleRecord)
        {
            control.DeleteEntity(customerQuestionHandleRecord);
        }

        public IList GetAllCustomerQuestionHandleRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}