using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectBudgetDAL
    {
        private EntityControl control;

        public ProjectBudgetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectBudget(ProjectBudget projectBudget)
        {
            control.AddEntity(projectBudget);
        }

        public void UpdateProjectBudget(ProjectBudget projectBudget, int ID)
        {
            control.UpdateEntity(projectBudget, ID);
        }

        public void DeleteProjectBudget(ProjectBudget projectBudget)
        {
            control.DeleteEntity(projectBudget);
        }

        public IList GetAllProjectBudgets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}