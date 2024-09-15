using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerQuestionTypeDAL
    {
        private EntityControl control;

        public CustomerQuestionTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerQuestionType(CustomerQuestionType customerQuestionType)
        {
            control.AddEntity(customerQuestionType);
        }

        public void UpdateCustomerQuestionType(CustomerQuestionType customerQuestionType, string Type)
        {
            control.UpdateEntity(customerQuestionType, Type);
        }

        public void DeleteCustomerQuestionType(CustomerQuestionType customerQuestionType)
        {
            control.DeleteEntity(customerQuestionType);
        }

        public IList GetAllCustomerQuestionTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}