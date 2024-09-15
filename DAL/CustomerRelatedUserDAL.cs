using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerRelatedUserDAL
    {
        private EntityControl control;

        public CustomerRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerRelatedUser(CustomerRelatedUser customerRelatedUser)
        {
            control.AddEntity(customerRelatedUser);
        }

        public void UpdateCustomerRelatedUser(CustomerRelatedUser customerRelatedUser, int ID)
        {
            control.UpdateEntity(customerRelatedUser, ID);
        }

        public void DeleteCustomerRelatedUser(CustomerRelatedUser customerRelatedUser)
        {
            control.DeleteEntity(customerRelatedUser);
        }

        public IList GetAllCustomerRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}