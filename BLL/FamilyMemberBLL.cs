using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class FamilyMemberBLL
    {
        public void AddFamilyMember(FamilyMember familyMember)
        {
            FamilyMemberDAL dal = new FamilyMemberDAL();
            dal.AddFamilyMember(familyMember);
        }

        public void UpdateFamilyMember(FamilyMember familyMember, int ID)
        {
            FamilyMemberDAL dal = new FamilyMemberDAL();
            dal.UpdateFamilyMember(familyMember, ID);
        }

        public void DeleteFamilyMember(FamilyMember familyMember)
        {
            FamilyMemberDAL dal = new FamilyMemberDAL();
            dal.DeleteFamilyMember(familyMember);
        }

        public IList GetAllFamilyMembers(string strHQL)
        {
            FamilyMemberDAL dal = new FamilyMemberDAL();
            return dal.GetAllFamilyMembers(strHQL);
        }
    }
}