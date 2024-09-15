using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerQuestionCustomerStageBLL
    {
        public void AddCustomerQuestionCustomerStage(CustomerQuestionCustomerStage customerQuestionCustomerStage)
        {
            CustomerQuestionCustomerStageDAL dal = new CustomerQuestionCustomerStageDAL();
            dal.AddCustomerQuestionCustomerStage(customerQuestionCustomerStage);
        }

        public void UpdateCustomerQuestionCustomerStage(CustomerQuestionCustomerStage customerQuestionCustomerStage, string Stage)
        {
            CustomerQuestionCustomerStageDAL dal = new CustomerQuestionCustomerStageDAL();
            dal.UpdateCustomerQuestionCustomerStage(customerQuestionCustomerStage, Stage);
        }

        public void DeleteCustomerQuestionCustomerStage(CustomerQuestionCustomerStage customerQuestionCustomerStage)
        {
            CustomerQuestionCustomerStageDAL dal = new CustomerQuestionCustomerStageDAL();
            dal.DeleteCustomerQuestionCustomerStage(customerQuestionCustomerStage);
        }

        public IList GetAllCustomerQuestionCustomerStages(string strHQL)
        {
            CustomerQuestionCustomerStageDAL dal = new CustomerQuestionCustomerStageDAL();
            return dal.GetAllCustomerQuestionCustomerStages(strHQL);
        }
    }
}