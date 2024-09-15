using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BMAnnInvitRelatedProjectDAL
    {
        private EntityControl control;

        public BMAnnInvitRelatedProjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMAnnInvitRelatedProject(BMAnnInvitRelatedProject bMAnnInvitRelatedProject)
        {
            control.AddEntity(bMAnnInvitRelatedProject);
        }

        public void UpdateBMAnnInvitRelatedProject(BMAnnInvitRelatedProject bMAnnInvitRelatedProject, int ID)
        {
            control.UpdateEntity(bMAnnInvitRelatedProject, ID);
        }

        public void DeleteBMAnnInvitRelatedProject(BMAnnInvitRelatedProject bMAnnInvitRelatedProject)
        {
            control.DeleteEntity(bMAnnInvitRelatedProject);
        }

        public IList GetAllBMAnnInvitRelatedProjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}