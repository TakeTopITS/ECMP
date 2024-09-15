using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerRelatedUserBLL
    {
        public void AddCustomerRelatedUser(CustomerRelatedUser customerRelatedUser)
        {
            CustomerRelatedUserDAL dal = new CustomerRelatedUserDAL();
            dal.AddCustomerRelatedUser(customerRelatedUser);
        }

        public void UpdateCustomerRelatedUser(CustomerRelatedUser customerRelatedUser, int ID)
        {
            CustomerRelatedUserDAL dal = new CustomerRelatedUserDAL();
            dal.UpdateCustomerRelatedUser(customerRelatedUser, ID);
        }

        public void DeleteCustomerRelatedUser(CustomerRelatedUser customerRelatedUser)
        {
            CustomerRelatedUserDAL dal = new CustomerRelatedUserDAL();
            dal.DeleteCustomerRelatedUser(customerRelatedUser);
        }

        public IList GetAllCustomerRelatedUsers(string strHQL)
        {
            CustomerRelatedUserDAL dal = new CustomerRelatedUserDAL();
            return dal.GetAllCustomerRelatedUsers(strHQL);
        }
    }
}