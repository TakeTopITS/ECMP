using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerRelatedQuestionBLL
    {
        public void AddCustomerRelatedQuestion(CustomerRelatedQuestion customerRelatedQuestion)
        {
            CustomerRelatedQuestionDAL dal = new CustomerRelatedQuestionDAL();
            dal.AddCustomerRelatedQuestion(customerRelatedQuestion);
        }

        public void UpdateCustomerRelatedQuestion(CustomerRelatedQuestion customerRelatedQuestion, int ID)
        {
            CustomerRelatedQuestionDAL dal = new CustomerRelatedQuestionDAL();
            dal.UpdateCustomerRelatedQuestion(customerRelatedQuestion, ID);
        }

        public void DeleteCustomerRelatedQuestion(CustomerRelatedQuestion customerRelatedQuestion)
        {
            CustomerRelatedQuestionDAL dal = new CustomerRelatedQuestionDAL();
            dal.DeleteCustomerRelatedQuestion(customerRelatedQuestion);
        }

        public IList GetAllCustomerRelatedQuestions(string strHQL)
        {
            CustomerRelatedQuestionDAL dal = new CustomerRelatedQuestionDAL();
            return dal.GetAllCustomerRelatedQuestions(strHQL);
        }
    }
}