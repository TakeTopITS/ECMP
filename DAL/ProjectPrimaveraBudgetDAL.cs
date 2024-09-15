using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectPrimaveraBudgetDAL
    {
        private EntityControl control;

        public ProjectPrimaveraBudgetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectPrimaveraBudget(ProjectPrimaveraBudget projectPrimaveraBudget)
        {
            control.AddEntity(projectPrimaveraBudget);
        }

        public void UpdateProjectPrimaveraBudget(ProjectPrimaveraBudget projectPrimaveraBudget, int ID)
        {
            control.UpdateEntity(projectPrimaveraBudget, ID);
        }

        public void DeleteProjectPrimaveraBudget(ProjectPrimaveraBudget projectPrimaveraBudget)
        {
            control.DeleteEntity(projectPrimaveraBudget);
        }

        public IList GetAllProjectPrimaveraBudgets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}