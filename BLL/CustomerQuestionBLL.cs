using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerQuestionBLL
    {
        public void AddCustomerQuestion(CustomerQuestion customerQuestion)
        {
            CustomerQuestionDAL dal = new CustomerQuestionDAL();
            dal.AddCustomerQuestion(customerQuestion);
        }

        public void UpdateCustomerQuestion(CustomerQuestion customerQuestion, int ID)
        {
            CustomerQuestionDAL dal = new CustomerQuestionDAL();
            dal.UpdateCustomerQuestion(customerQuestion, ID);
        }

        public void DeleteCustomerQuestion(CustomerQuestion customerQuestion)
        {
            CustomerQuestionDAL dal = new CustomerQuestionDAL();
            dal.DeleteCustomerQuestion(customerQuestion);
        }

        public IList GetAllCustomerQuestions(string strHQL)
        {
            CustomerQuestionDAL dal = new CustomerQuestionDAL();
            return dal.GetAllCustomerQuestions(strHQL);
        }
    }
}