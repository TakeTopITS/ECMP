using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberDAL
    {
        private EntityControl control;

        public ProjectMemberDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMember(ProjectMember projectMember)
        {
            control.AddEntity(projectMember);
        }

        public void UpdateProjectMember(ProjectMember projectMember, string UserCode)
        {
            control.UpdateEntity(projectMember, UserCode);
        }

        public void DeleteProjectMember(ProjectMember projectMember)
        {
            control.DeleteEntity(projectMember);
        }

        public IList GetAllProjectMembers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}