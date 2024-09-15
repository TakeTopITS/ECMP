using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ExpenseClaimDetailDAL
    {
        private EntityControl control;

        public ExpenseClaimDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddExpenseClaimDetail(ExpenseClaimDetail expenseClaimDetail)
        {
            control.AddEntity(expenseClaimDetail);
        }

        public void UpdateExpenseClaimDetail(ExpenseClaimDetail expenseClaimDetail, int ID)
        {
            control.UpdateEntity(expenseClaimDetail, ID);
        }

        public void DeleteExpenseClaimDetail(ExpenseClaimDetail expenseClaimDetail)
        {
            control.DeleteEntity(expenseClaimDetail);
        }

        public IList GetAllExpenseClaimDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}