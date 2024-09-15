using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerBLL
    {
        public void AddCustomer(Customer customer)
        {
            CustomerDAL dal = new CustomerDAL();
            dal.AddCustomer(customer);
        }

        public void UpdateCustomer(Customer customer, string CustomerCode)
        {
            CustomerDAL dal = new CustomerDAL();
            dal.UpdateCustomer(customer, CustomerCode);
        }

        public void DeleteCustomer(Customer customer)
        {
            CustomerDAL dal = new CustomerDAL();
            dal.DeleteCustomer(customer);
        }

        public IList GetAllCustomers(string strHQL)
        {
            CustomerDAL dal = new CustomerDAL();
            return dal.GetAllCustomers(strHQL);
        }
    }
}