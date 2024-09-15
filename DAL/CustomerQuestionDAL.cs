using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerQuestionDAL
    {
        private EntityControl control;

        public CustomerQuestionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerQuestion(CustomerQuestion customerQuestion)
        {
            control.AddEntity(customerQuestion);
        }

        public void UpdateCustomerQuestion(CustomerQuestion customerQuestion, int ID)
        {
            control.UpdateEntity(customerQuestion, ID);
        }

        public void DeleteCustomerQuestion(CustomerQuestion customerQuestion)
        {
            control.DeleteEntity(customerQuestion);
        }

        public IList GetAllCustomerQuestions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}