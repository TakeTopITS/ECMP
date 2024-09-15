using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MemberLevelBLL
    {
        public void AddMemberLevel(MemberLevel memberLevel)
        {
            MemberLevelDAL dal = new MemberLevelDAL();
            dal.AddMemberLevel(memberLevel);
        }

        public void UpdateMemberLevel(MemberLevel memberLevel, int ID)
        {
            MemberLevelDAL dal = new MemberLevelDAL();
            dal.UpdateMemberLevel(memberLevel, ID);
        }

        public void DeleteMemberLevel(MemberLevel memberLevel)
        {
            MemberLevelDAL dal = new MemberLevelDAL();
            dal.DeleteMemberLevel(memberLevel);
        }

        public IList GetAllMemberLevels(string strHQL)
        {
            MemberLevelDAL dal = new MemberLevelDAL();
            return dal.GetAllMemberLevels(strHQL);
        }
    }
}