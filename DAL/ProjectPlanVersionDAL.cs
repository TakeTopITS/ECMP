using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectPlanVersionDAL
    {
        private EntityControl control;

        public ProjectPlanVersionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectPlanVersion(ProjectPlanVersion projectPlanVersion)
        {
            control.AddEntity(projectPlanVersion);
        }

        public void UpdateProjectPlanVersion(ProjectPlanVersion projectPlanVersion, int ID)
        {
            control.UpdateEntity(projectPlanVersion, ID);
        }

        public void DeleteProjectPlanVersion(ProjectPlanVersion projectPlanVersion)
        {
            control.DeleteEntity(projectPlanVersion);
        }

        public IList GetAllProjectPlanVersions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}