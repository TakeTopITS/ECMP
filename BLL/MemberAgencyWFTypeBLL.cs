using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MemberAgencyWFTypeBLL
    {
        public void AddMemberAgencyWFType(MemberAgencyWFType memberAgencyWFType)
        {
            MemberAgencyWFTypeDAL dal = new MemberAgencyWFTypeDAL();
            dal.AddMemberAgencyWFType(memberAgencyWFType);
        }

        public void UpdateMemberAgencyWFType(MemberAgencyWFType memberAgencyWFType, int ID)
        {
            MemberAgencyWFTypeDAL dal = new MemberAgencyWFTypeDAL();
            dal.UpdateMemberAgencyWFType(memberAgencyWFType, ID);
        }

        public void DeleteMemberAgencyWFType(MemberAgencyWFType memberAgencyWFType)
        {
            MemberAgencyWFTypeDAL dal = new MemberAgencyWFTypeDAL();
            dal.DeleteMemberAgencyWFType(memberAgencyWFType);
        }

        public IList GetAllMemberAgencyWFTypes(string strHQL)
        {
            MemberAgencyWFTypeDAL dal = new MemberAgencyWFTypeDAL();
            return dal.GetAllMemberAgencyWFTypes(strHQL);
        }
    }
}