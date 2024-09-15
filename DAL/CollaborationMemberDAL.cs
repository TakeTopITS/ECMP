using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CollaborationMemberDAL
    {
        private EntityControl control;

        public CollaborationMemberDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCollaborationMember(CollaborationMember collaborationMember)
        {
            control.AddEntity(collaborationMember);
        }

        public void UpdateCollaborationMember(CollaborationMember collaborationMember, int MemID)
        {
            control.UpdateEntity(collaborationMember, MemID);
        }

        public void DeleteCollaborationMember(CollaborationMember collaborationMember)
        {
            control.DeleteEntity(collaborationMember);
        }

        public IList GetAllCollaborationMembers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}