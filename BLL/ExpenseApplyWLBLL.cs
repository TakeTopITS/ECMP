using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ExpenseApplyWLBLL
    {
        public void AddExpenseApplyWL(ExpenseApplyWL expenseApplyWL)
        {
            ExpenseApplyWLDAL dal = new ExpenseApplyWLDAL();
            dal.AddExpenseApplyWL(expenseApplyWL);
        }

        public void UpdateExpenseApplyWL(ExpenseApplyWL expenseApplyWL, int ID)
        {
            ExpenseApplyWLDAL dal = new ExpenseApplyWLDAL();
            dal.UpdateExpenseApplyWL(expenseApplyWL, ID);
        }

        public void DeleteExpenseApplyWL(ExpenseApplyWL expenseApplyWL)
        {
            ExpenseApplyWLDAL dal = new ExpenseApplyWLDAL();
            dal.DeleteExpenseApplyWL(expenseApplyWL);
        }

        public IList GetAllExpenseApplyWLs(string strHQL)
        {
            ExpenseApplyWLDAL dal = new ExpenseApplyWLDAL();
            return dal.GetAllExpenseApplyWLs(strHQL);
        }
    }
}