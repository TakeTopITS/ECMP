using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerOperationRecordBLL
    {
        public void AddCustomerOperationRecord(CustomerOperationRecord customerOperationRecord)
        {
            CustomerOperationRecordDAL dal = new CustomerOperationRecordDAL();
            dal.AddCustomerOperationRecord(customerOperationRecord);
        }

        public void UpdateCustomerOperationRecord(CustomerOperationRecord customerOperationRecord, int ID)
        {
            CustomerOperationRecordDAL dal = new CustomerOperationRecordDAL();
            dal.UpdateCustomerOperationRecord(customerOperationRecord, ID);
        }

        public void DeleteCustomerOperationRecord(CustomerOperationRecord customerOperationRecord)
        {
            CustomerOperationRecordDAL dal = new CustomerOperationRecordDAL();
            dal.DeleteCustomerOperationRecord(customerOperationRecord);
        }

        public IList GetAllCustomerOperationRecords(string strHQL)
        {
            CustomerOperationRecordDAL dal = new CustomerOperationRecordDAL();
            return dal.GetAllCustomerOperationRecords(strHQL);
        }
    }
}