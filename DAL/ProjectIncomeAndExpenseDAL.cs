using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectIncomeAndExpenseDAL
    {
        private EntityControl control;

        public ProjectIncomeAndExpenseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectIncomeAndExpense(ProjectIncomeAndExpense projectIncomeAndExpense)
        {
            control.AddEntity(projectIncomeAndExpense);
        }

        public void UpdateProjectIncomeAndExpense(ProjectIncomeAndExpense projectIncomeAndExpense, string UserCode)
        {
            control.UpdateEntity(projectIncomeAndExpense, UserCode);
        }

        public void DeleteProjectIncomeAndExpense(ProjectIncomeAndExpense projectIncomeAndExpense)
        {
            control.DeleteEntity(projectIncomeAndExpense);
        }

        public IList GetAllProjectIncomeAndExpenses(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}