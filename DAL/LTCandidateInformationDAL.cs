using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class LTCandidateInformationDAL
    {
        private EntityControl control;

        public LTCandidateInformationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddLTCandidateInformation(LTCandidateInformation ltCandidateInformation)
        {
            control.AddEntity(ltCandidateInformation);
        }

        public void UpdateLTCandidateInformation(LTCandidateInformation ltCandidateInformation, int ID)
        {
            control.UpdateEntity(ltCandidateInformation, ID);
        }

        public void DeleteLTCandidateInformation(LTCandidateInformation ltCandidateInformation)
        {
            control.DeleteEntity(ltCandidateInformation);
        }

        public IList GetAllLTCandidateInformations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}