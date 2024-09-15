using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberClassDAL
    {
        private EntityControl control;

        public ProjectMemberClassDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberClass(ProjectMemberClass projectMemberClass)
        {
            control.AddEntity(projectMemberClass);
        }

        public void UpdateProjectMemberClass(ProjectMemberClass projectMemberClass, int ID)
        {
            control.UpdateEntity(projectMemberClass, ID);
        }

        public void DeleteProjectMemberClass(ProjectMemberClass projectMemberClass)
        {
            control.DeleteEntity(projectMemberClass);
        }

        public IList GetAllProjectMemberClasss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}