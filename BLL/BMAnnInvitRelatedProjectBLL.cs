using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BMAnnInvitRelatedProjectBLL
    {
        public void AddBMAnnInvitRelatedProject(BMAnnInvitRelatedProject bMAnnInvitRelatedProject)
        {
            BMAnnInvitRelatedProjectDAL dal = new BMAnnInvitRelatedProjectDAL();
            dal.AddBMAnnInvitRelatedProject(bMAnnInvitRelatedProject);
        }

        public void UpdateBMAnnInvitRelatedProject(BMAnnInvitRelatedProject bMAnnInvitRelatedProject, int ID)
        {
            BMAnnInvitRelatedProjectDAL dal = new BMAnnInvitRelatedProjectDAL();
            dal.UpdateBMAnnInvitRelatedProject(bMAnnInvitRelatedProject, ID);
        }

        public void DeleteBMAnnInvitRelatedProject(BMAnnInvitRelatedProject bMAnnInvitRelatedProject)
        {
            BMAnnInvitRelatedProjectDAL dal = new BMAnnInvitRelatedProjectDAL();
            dal.DeleteBMAnnInvitRelatedProject(bMAnnInvitRelatedProject);
        }

        public IList GetAllBMAnnInvitRelatedProjects(string strHQL)
        {
            BMAnnInvitRelatedProjectDAL dal = new BMAnnInvitRelatedProjectDAL();
            return dal.GetAllBMAnnInvitRelatedProjects(strHQL);
        }
    }
}