using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CollaborationLogWithCustomerQuestionCandidateDAL
    {
        private EntityControl control;

        public CollaborationLogWithCustomerQuestionCandidateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCollaborationLogWithCustomerQuestionCandidate(CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate)
        {
            control.AddEntity(collaborationLogWithCustomerQuestionCandidate);
        }

        public void UpdateCollaborationLogWithCustomerQuestionCandidate(CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate, int LogID)
        {
            control.UpdateEntity(collaborationLogWithCustomerQuestionCandidate, LogID);
        }

        public void DeleteCollaborationLogWithCustomerQuestionCandidate(CollaborationLogWithCustomerQuestionCandidate collaborationLogWithCustomerQuestionCandidate)
        {
            control.DeleteEntity(collaborationLogWithCustomerQuestionCandidate);
        }

        public IList GetAllCollaborationLogWithCustomerQuestionCandidates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}