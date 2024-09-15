using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerDAL
    {
        private EntityControl control;

        public CustomerDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomer(Customer customer)
        {
            control.AddEntity(customer);
        }

        public void UpdateCustomer(Customer customer, string CustomerCode)
        {
            control.UpdateEntity(customer, CustomerCode);
        }

        public void DeleteCustomer(Customer customer)
        {
            control.DeleteEntity(customer);
        }

        public IList GetAllCustomers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}