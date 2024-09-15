using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CollaborationLogDAL
    {
        private EntityControl control;

        public CollaborationLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCollaborationLog(CollaborationLog collaborationLog)
        {
            control.AddEntity(collaborationLog);
        }

        public void UpdateCollaborationLog(CollaborationLog collaborationLog, int LogID)
        {
            control.UpdateEntity(collaborationLog, LogID);
        }

        public void DeleteCollaborationLog(CollaborationLog collaborationLog)
        {
            control.DeleteEntity(collaborationLog);
        }

        public IList GetAllCollaborationLogs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}