using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectTypeDAL
    {
        private EntityControl control;

        public ProjectTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectType(ProjectType projectType)
        {
            control.AddEntity(projectType);
        }

        public void UpdateProjectType(ProjectType projectType, string Type)
        {
            control.UpdateEntity(projectType, Type);
        }

        public void DeleteProjectType(ProjectType projectType)
        {
            control.DeleteEntity(projectType);
        }

        public IList GetAllProjectTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}