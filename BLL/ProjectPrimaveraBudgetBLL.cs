using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectPrimaveraBudgetBLL
    {
        public void AddProjectPrimaveraBudget(ProjectPrimaveraBudget projectPrimaveraBudget)
        {
            ProjectPrimaveraBudgetDAL dal = new ProjectPrimaveraBudgetDAL();
            dal.AddProjectPrimaveraBudget(projectPrimaveraBudget);
        }

        public void UpdateProjectPrimaveraBudget(ProjectPrimaveraBudget projectPrimaveraBudget, int ID)
        {
            ProjectPrimaveraBudgetDAL dal = new ProjectPrimaveraBudgetDAL();
            dal.UpdateProjectPrimaveraBudget(projectPrimaveraBudget, ID);
        }

        public void DeleteProjectPrimaveraBudget(ProjectPrimaveraBudget projectPrimaveraBudget)
        {
            ProjectPrimaveraBudgetDAL dal = new ProjectPrimaveraBudgetDAL();
            dal.DeleteProjectPrimaveraBudget(projectPrimaveraBudget);
        }

        public IList GetAllProjectPrimaveraBudgets(string strHQL)
        {
            ProjectPrimaveraBudgetDAL dal = new ProjectPrimaveraBudgetDAL();
            return dal.GetAllProjectPrimaveraBudgets(strHQL);
        }
    }
}