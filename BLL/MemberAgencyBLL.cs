using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MemberAgencyBLL
    {
        public void AddMemberAgency(MemberAgency memberAgency)
        {
            MemberAgencyDAL dal = new MemberAgencyDAL();
            dal.AddMemberAgency(memberAgency);
        }

        public void UpdateMemberAgency(MemberAgency memberAgency, int ID)
        {
            MemberAgencyDAL dal = new MemberAgencyDAL();
            dal.UpdateMemberAgency(memberAgency, ID);
        }

        public void DeleteMemberAgency(MemberAgency memberAgency)
        {
            MemberAgencyDAL dal = new MemberAgencyDAL();
            dal.DeleteMemberAgency(memberAgency);
        }

        public IList GetAllMemberAgencys(string strHQL)
        {
            MemberAgencyDAL dal = new MemberAgencyDAL();
            return dal.GetAllMemberAgencys(strHQL);
        }
    }
}