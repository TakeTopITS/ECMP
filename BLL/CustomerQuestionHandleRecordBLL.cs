using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerQuestionHandleRecordBLL
    {
        public void AddCustomerQuestionHandleRecord(CustomerQuestionHandleRecord customerQuestionHandleRecord)
        {
            CustomerQuestionHandleRecordDAL dal = new CustomerQuestionHandleRecordDAL();
            dal.AddCustomerQuestionHandleRecord(customerQuestionHandleRecord);
        }

        public void UpdateCustomerQuestionHandleRecord(CustomerQuestionHandleRecord customerQuestionHandleRecord, int ID)
        {
            CustomerQuestionHandleRecordDAL dal = new CustomerQuestionHandleRecordDAL();
            dal.UpdateCustomerQuestionHandleRecord(customerQuestionHandleRecord, ID);
        }

        public void DeleteCustomerQuestionHandleRecord(CustomerQuestionHandleRecord customerQuestionHandleRecord)
        {
            CustomerQuestionHandleRecordDAL dal = new CustomerQuestionHandleRecordDAL();
            dal.DeleteCustomerQuestionHandleRecord(customerQuestionHandleRecord);
        }

        public IList GetAllCustomerQuestionHandleRecords(string strHQL)
        {
            CustomerQuestionHandleRecordDAL dal = new CustomerQuestionHandleRecordDAL();
            return dal.GetAllCustomerQuestionHandleRecords(strHQL);
        }
    }
}