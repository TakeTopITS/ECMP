using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerQuestionTypeBLL
    {
        public void AddCustomerQuestionType(CustomerQuestionType customerQuestionType)
        {
            CustomerQuestionTypeDAL dal = new CustomerQuestionTypeDAL();
            dal.AddCustomerQuestionType(customerQuestionType);
        }

        public void UpdateCustomerQuestionType(CustomerQuestionType customerQuestionType, string Type)
        {
            CustomerQuestionTypeDAL dal = new CustomerQuestionTypeDAL();
            dal.UpdateCustomerQuestionType(customerQuestionType, Type);
        }

        public void DeleteCustomerQuestionType(CustomerQuestionType customerQuestionType)
        {
            CustomerQuestionTypeDAL dal = new CustomerQuestionTypeDAL();
            dal.DeleteCustomerQuestionType(customerQuestionType);
        }

        public IList GetAllCustomerQuestionTypes(string strHQL)
        {
            CustomerQuestionTypeDAL dal = new CustomerQuestionTypeDAL();
            return dal.GetAllCustomerQuestionTypes(strHQL);
        }
    }
}