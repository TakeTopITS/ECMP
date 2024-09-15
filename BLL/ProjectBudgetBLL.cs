using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectBudgetBLL
    {
        public void AddProjectBudget(ProjectBudget projectBudget)
        {
            ProjectBudgetDAL dal = new ProjectBudgetDAL();
            dal.AddProjectBudget(projectBudget);
        }

        public void UpdateProjectBudget(ProjectBudget projectBudget, int ID)
        {
            ProjectBudgetDAL dal = new ProjectBudgetDAL();
            dal.UpdateProjectBudget(projectBudget, ID);
        }

        public void DeleteProjectBudget(ProjectBudget projectBudget)
        {
            ProjectBudgetDAL dal = new ProjectBudgetDAL();
            dal.DeleteProjectBudget(projectBudget);
        }

        public IList GetAllProjectBudgets(string strHQL)
        {
            ProjectBudgetDAL dal = new ProjectBudgetDAL();
            return dal.GetAllProjectBudgets(strHQL);
        }
    }
}