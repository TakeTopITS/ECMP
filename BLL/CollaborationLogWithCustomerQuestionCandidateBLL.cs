using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CollaborationLogWithCustomerQuestionCandidateBLL
    {
        public void AddCollaborationLogWithCustomerQuestionCandidate(CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate)
        {
            CollaborationLogWithCustomerQuestionCandidateDAL dal = new CollaborationLogWithCustomerQuestionCandidateDAL();
            dal.AddCollaborationLogWithCustomerQuestionCandidate(collaborationLogWithCustomerQuestionCandidate);
        }

        public void UpdateCollaborationLogWithCustomerQuestionCandidate(CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate, int LogID)
        {
            CollaborationLogWithCustomerQuestionCandidateDAL dal = new CollaborationLogWithCustomerQuestionCandidateDAL();
            dal.UpdateCollaborationLogWithCustomerQuestionCandidate(collaborationLogWithCustomerQuestionCandidate, LogID);
        }

        public void DeleteCollaborationLogWithCustomerQuestionCandidate(CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate)
        {
            CollaborationLogWithCustomerQuestionCandidateDAL dal = new CollaborationLogWithCustomerQuestionCandidateDAL();
            dal.DeleteCollaborationLogWithCustomerQuestionCandidate(collaborationLogWithCustomerQuestionCandidate);
        }

        public IList GetAllCollaborationLogWithCustomerQuestionCandidates(string strHQL)
        {
            CollaborationLogWithCustomerQuestionCandidateDAL dal = new CollaborationLogWithCustomerQuestionCandidateDAL();
            return dal.GetAllCollaborationLogWithCustomerQuestionCandidates(strHQL);
        }
    }
}