using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CollaborationDAL
    {
        private EntityControl control;

        public CollaborationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCollaboration(Collaboration collaboration)
        {
            control.AddEntity(collaboration);
        }

        public void UpdateCollaboration(Collaboration collaboration, int CoID)
        {
            control.UpdateEntity(collaboration, CoID);
        }

        public void DeleteCollaboration(Collaboration collaboration)
        {
            control.DeleteEntity(collaboration);
        }

        public IList GetAllCollaborations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}