using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class LTCandidateInformationBLL
    {
        public void AddLTCandidateInformation(LTCandidateInformation ltCandidateInformation)
        {
            LTCandidateInformationDAL dal = new LTCandidateInformationDAL();
            dal.AddLTCandidateInformation(ltCandidateInformation);
        }

        public void UpdateLTCandidateInformation(LTCandidateInformation ltCandidateInformation, int ID)
        {
            LTCandidateInformationDAL dal = new LTCandidateInformationDAL();
            dal.UpdateLTCandidateInformation(ltCandidateInformation, ID);
        }

        public void DeleteLTCandidateInformation(LTCandidateInformation ltCandidateInformation)
        {
            LTCandidateInformationDAL dal = new LTCandidateInformationDAL();
            dal.DeleteLTCandidateInformation(ltCandidateInformation);
        }

        public IList GetAllLTCandidateInformations(string strHQL)
        {
            LTCandidateInformationDAL dal = new LTCandidateInformationDAL();
            return dal.GetAllLTCandidateInformations(strHQL);
        }
    }
}