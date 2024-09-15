using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectStatusDAL
    {
        private EntityControl control;

        public ProjectStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectStatus(ProjectStatus projectStatus)
        {
            control.AddEntity(projectStatus);
        }

        public void UpdateProjectStatus(ProjectStatus projectStatus, int ID)
        {
            control.UpdateEntity(projectStatus, ID);
        }

        public void DeleteProjectStatus(ProjectStatus projectStatus)
        {
            control.DeleteEntity(projectStatus);
        }

        public IList GetAllProjectStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}