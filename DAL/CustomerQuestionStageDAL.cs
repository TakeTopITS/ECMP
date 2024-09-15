using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerQuestionStageDAL
    {
        private EntityControl control;

        public CustomerQuestionStageDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerQuestionStage(CustomerQuestionStage customerQuestionStage)
        {
            control.AddEntity(customerQuestionStage);
        }

        public void UpdateCustomerQuestionStage(CustomerQuestionStage customerQuestionStage, string Stage)
        {
            control.UpdateEntity(customerQuestionStage, Stage);
        }

        public void DeleteCustomerQuestionStage(CustomerQuestionStage customerQuestionStage)
        {
            control.DeleteEntity(customerQuestionStage);
        }

        public IList GetAllCustomerQuestionStages(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}