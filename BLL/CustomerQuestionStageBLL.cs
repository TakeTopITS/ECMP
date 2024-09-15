using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerQuestionStageBLL
    {
        public void AddCustomerQuestionStage(CustomerQuestionStage customerQuestionStage)
        {
            CustomerQuestionStageDAL dal = new CustomerQuestionStageDAL();
            dal.AddCustomerQuestionStage(customerQuestionStage);
        }

        public void UpdateCustomerQuestionStage(CustomerQuestionStage customerQuestionStage, string Stage)
        {
            CustomerQuestionStageDAL dal = new CustomerQuestionStageDAL();
            dal.UpdateCustomerQuestionStage(customerQuestionStage, Stage);
        }

        public void DeleteCustomerQuestionStage(CustomerQuestionStage customerQuestionStage)
        {
            CustomerQuestionStageDAL dal = new CustomerQuestionStageDAL();
            dal.DeleteCustomerQuestionStage(customerQuestionStage);
        }

        public IList GetAllCustomerQuestionStages(string strHQL)
        {
            CustomerQuestionStageDAL dal = new CustomerQuestionStageDAL();
            return dal.GetAllCustomerQuestionStages(strHQL);
        }
    }
}