using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ExpenseApplyWLDAL
    {
        private EntityControl control;

        public ExpenseApplyWLDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddExpenseApplyWL(ExpenseApplyWL expenseApplyWL)
        {
            control.AddEntity(expenseApplyWL);
        }

        public void UpdateExpenseApplyWL(ExpenseApplyWL expenseApplyWL, int ID)
        {
            control.UpdateEntity(expenseApplyWL, ID);
        }

        public void DeleteExpenseApplyWL(ExpenseApplyWL expenseApplyWL)
        {
            control.DeleteEntity(expenseApplyWL);
        }

        public IList GetAllExpenseApplyWLs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}