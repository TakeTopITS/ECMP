using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectIncomeAndExpenseBLL
    {
        public void AddProjectIncomeAndExpense(ProjectIncomeAndExpense projectIncomeAndExpense)
        {
            ProjectIncomeAndExpenseDAL dal = new ProjectIncomeAndExpenseDAL();
            dal.AddProjectIncomeAndExpense(projectIncomeAndExpense);
        }

        public void UpdateProjectIncomeAndExpense(ProjectIncomeAndExpense projectIncomeAndExpense, string UserCode)
        {
            ProjectIncomeAndExpenseDAL dal = new ProjectIncomeAndExpenseDAL();
            dal.UpdateProjectIncomeAndExpense(projectIncomeAndExpense, UserCode);
        }

        public void DeleteProjectIncomeAndExpense(ProjectIncomeAndExpense projectIncomeAndExpense)
        {
            ProjectIncomeAndExpenseDAL dal = new ProjectIncomeAndExpenseDAL();
            dal.DeleteProjectIncomeAndExpense(projectIncomeAndExpense);
        }

        public IList GetAllProjectIncomeAndExpenses(string strHQL)
        {
            ProjectIncomeAndExpenseDAL dal = new ProjectIncomeAndExpenseDAL();
            return dal.GetAllProjectIncomeAndExpenses(strHQL);
        }
    }
}