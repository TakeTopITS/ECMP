using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectItemBomVersionDAL
    {
        private EntityControl control;

        public ProjectItemBomVersionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectItemBomVersion(ProjectItemBomVersion projectItemBomVersion)
        {
            control.AddEntity(projectItemBomVersion);
        }

        public void UpdateProjectItemBomVersion(ProjectItemBomVersion projectItemBomVersion, int ID)
        {
            control.UpdateEntity(projectItemBomVersion, ID);
        }

        public void DeleteProjectItemBomVersion(ProjectItemBomVersion projectItemBomVersion)
        {
            control.DeleteEntity(projectItemBomVersion);
        }

        public IList GetAllProjectItemBomVersions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}