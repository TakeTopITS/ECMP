using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CollaborationMemberBLL
    {
        public void AddCollaborationMember(CollaborationMember collaborationMember)
        {
            CollaborationMemberDAL dal = new CollaborationMemberDAL();
            dal.AddCollaborationMember(collaborationMember);
        }

        public void UpdateCollaborationMember(CollaborationMember collaborationMember, int MemID)
        {
            CollaborationMemberDAL dal = new CollaborationMemberDAL();
            dal.UpdateCollaborationMember(collaborationMember, MemID);
        }

        public void DeleteCollaborationMember(CollaborationMember collaborationMember)
        {
            CollaborationMemberDAL dal = new CollaborationMemberDAL();
            dal.DeleteCollaborationMember(collaborationMember);
        }

        public IList GetAllCollaborationMembers(string strHQL)
        {
            CollaborationMemberDAL dal = new CollaborationMemberDAL();
            return dal.GetAllCollaborationMembers(strHQL);
        }
    }
}