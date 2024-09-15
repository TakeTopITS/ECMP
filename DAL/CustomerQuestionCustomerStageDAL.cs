using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerQuestionCustomerStageDAL
    {
        private EntityControl control;

        public CustomerQuestionCustomerStageDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerQuestionCustomerStage(CustomerQuestionCustomerStage customerQuestionCustomerStage)
        {
            control.AddEntity(customerQuestionCustomerStage);
        }

        public void UpdateCustomerQuestionCustomerStage(CustomerQuestionCustomerStage customerQuestionCustomerStage, string Stage)
        {
            control.UpdateEntity(customerQuestionCustomerStage, Stage);
        }

        public void DeleteCustomerQuestionCustomerStage(CustomerQuestionCustomerStage customerQuestionCustomerStage)
        {
            control.DeleteEntity(customerQuestionCustomerStage);
        }

        public IList GetAllCustomerQuestionCustomerStages(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}