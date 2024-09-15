using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CustomerQuestionRelatedCandidateDAL
    {
        private EntityControl control;

        public CustomerQuestionRelatedCandidateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCustomerQuestionRelatedCandidate(CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate)
        {
            control.AddEntity(customerQuestionRelatedCandidate);
        }

        public void UpdateCustomerQuestionRelatedCandidate(CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate, int ID)
        {
            control.UpdateEntity(customerQuestionRelatedCandidate, ID);
        }

        public void DeleteCustomerQuestionRelatedCandidate(CustomerQuestionRelatedCandidate customerQuestionRelatedCandidate)
        {
            control.DeleteEntity(customerQuestionRelatedCandidate);
        }

        public IList GetAllCustomerQuestionRelatedCandidates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}