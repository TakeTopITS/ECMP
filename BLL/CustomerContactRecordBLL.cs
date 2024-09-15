using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerContactRecordBLL
    {
        public void AddCustomerContactRecord(CustomerContactRecord customerContactRecord)
        {
            CustomerContactRecordDAL dal = new CustomerContactRecordDAL();
            dal.AddCustomerContactRecord(customerContactRecord);
        }

        public void UpdateCustomerContactRecord(CustomerContactRecord customerContactRecord, int ID)
        {
            CustomerContactRecordDAL dal = new CustomerContactRecordDAL();
            dal.UpdateCustomerContactRecord(customerContactRecord, ID);
        }

        public void DeleteCustomerContactRecord(CustomerContactRecord customerContactRecord)
        {
            CustomerContactRecordDAL dal = new CustomerContactRecordDAL();
            dal.DeleteCustomerContactRecord(customerContactRecord);
        }

        public IList GetAllCustomerContactRecords(string strHQL)
        {
            CustomerContactRecordDAL dal = new CustomerContactRecordDAL();
            return dal.GetAllCustomerContactRecords(strHQL);
        }
    }
}