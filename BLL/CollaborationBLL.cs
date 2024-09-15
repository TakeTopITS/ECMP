using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CollaborationBLL
    {
        public void AddCollaboration(Collaboration collaboration)
        {
            CollaborationDAL dal = new CollaborationDAL();
            dal.AddCollaboration(collaboration);
        }

        public void UpdateCollaboration(Collaboration collaboration, int CoID)
        {
            CollaborationDAL dal = new CollaborationDAL();
            dal.UpdateCollaboration(collaboration, CoID);
        }

        public void DeleteCollaboration(Collaboration collaboration)
        {
            CollaborationDAL dal = new CollaborationDAL();
            dal.DeleteCollaboration(collaboration);
        }

        public IList GetAllCollaborations(string strHQL)
        {
            CollaborationDAL dal = new CollaborationDAL();
            return dal.GetAllCollaborations(strHQL);
        }
    }
}