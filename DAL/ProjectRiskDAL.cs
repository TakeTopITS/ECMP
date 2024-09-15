using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectRiskDAL
    {
        private EntityControl control;

        public ProjectRiskDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectRisk(ProjectRisk projectRisk)
        {
            control.AddEntity(projectRisk);
        }

        public void UpdateProjectRisk(ProjectRisk projectRisk, int ID)
        {
            control.UpdateEntity(projectRisk, ID);
        }

        public void DeleteProjectRisk(ProjectRisk projectRisk)
        {
            control.DeleteEntity(projectRisk);
        }

        public IList GetAllProjectRisks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}