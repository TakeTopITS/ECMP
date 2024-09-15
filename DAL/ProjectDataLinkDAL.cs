using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectDataLinkDAL
    {
        private EntityControl control;

        public ProjectDataLinkDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectDataLink(ProjectDataLink projectDataLink)
        {
            control.AddEntity(projectDataLink);
        }

        public void UpdateProjectDataLink(ProjectDataLink projectDataLink, string Code)
        {
            control.UpdateEntity(projectDataLink, Code);
        }

        public void DeleteProjectDataLink(ProjectDataLink projectDataLink)
        {
            control.DeleteEntity(projectDataLink);
        }

        public IList GetAllProjectDataLinks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}