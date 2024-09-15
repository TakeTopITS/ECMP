using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerRelatedQuestionDAL
    {
        private EntityControl control;

        public CustomerRelatedQuestionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerRelatedQuestion(CustomerRelatedQuestion customerRelatedQuestion)
        {
            control.AddEntity(customerRelatedQuestion);
        }

        public void UpdateCustomerRelatedQuestion(CustomerRelatedQuestion customerRelatedQuestion, int ID)
        {
            control.UpdateEntity(customerRelatedQuestion, ID);
        }

        public void DeleteCustomerRelatedQuestion(CustomerRelatedQuestion customerRelatedQuestion)
        {
            control.DeleteEntity(customerRelatedQuestion);
        }

        public IList GetAllCustomerRelatedQuestions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}