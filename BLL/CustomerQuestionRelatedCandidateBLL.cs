using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CustomerQuestionRelatedCandidateBLL
    {
        public void AddCustomerQuestionRelatedCandidate(CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate)
        {
            CustomerQuestionRelatedCandidateDAL dal = new CustomerQuestionRelatedCandidateDAL();
            dal.AddCustomerQuestionRelatedCandidate(customerQuestionRelatedCandidate);
        }

        public void UpdateCustomerQuestionRelatedCandidate(CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate, int ID)
        {
            CustomerQuestionRelatedCandidateDAL dal = new CustomerQuestionRelatedCandidateDAL();
            dal.UpdateCustomerQuestionRelatedCandidate(customerQuestionRelatedCandidate, ID);
        }

        public void DeleteCustomerQuestionRelatedCandidate(CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate)
        {
            CustomerQuestionRelatedCandidateDAL dal = new CustomerQuestionRelatedCandidateDAL();
            dal.DeleteCustomerQuestionRelatedCandidate(customerQuestionRelatedCandidate);
        }

        public IList GetAllCustomerQuestionRelatedCandidates(string strHQL)
        {
            CustomerQuestionRelatedCandidateDAL dal = new CustomerQuestionRelatedCandidateDAL();
            return dal.GetAllCustomerQuestionRelatedCandidates(strHQL);
        }
    }
}