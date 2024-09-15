using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CollaborationLogBLL
    {
        public void AddCollaborationLog(CollaborationLog collaborationLog)
        {
            CollaborationLogDAL dal = new CollaborationLogDAL();
            dal.AddCollaborationLog(collaborationLog);
        }

        public void UpdateCollaborationLog(CollaborationLog collaborationLog, int LogID)
        {
            CollaborationLogDAL dal = new CollaborationLogDAL();
            dal.UpdateCollaborationLog(collaborationLog, LogID);
        }

        public void DeleteCollaborationLog(CollaborationLog collaborationLog)
        {
            CollaborationLogDAL dal = new CollaborationLogDAL();
            dal.DeleteCollaborationLog(collaborationLog);
        }

        public IList GetAllCollaborationLogs(string strHQL)
        {
            CollaborationLogDAL dal = new CollaborationLogDAL();
            return dal.GetAllCollaborationLogs(strHQL);
        }
    }
}