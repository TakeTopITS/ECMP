using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectDAL
    {
        private EntityControl control;

        public ProjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProject(Project project)
        {
            control.AddEntity(project);
        }

        public void UpdateProject(Project project, int ProjectID)
        {
            control.UpdateEntity(project, ProjectID);
        }

        public void DeleteProject(Project project)
        {
            control.DeleteEntity(project);
        }

        public IList GetAllProjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}