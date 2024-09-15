using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ExpenseClaimDAL
    {
        private EntityControl control;

        public ExpenseClaimDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddExpenseClaim(ExpenseClaim expenseClaim)
        {
            control.AddEntity(expenseClaim);
        }

        public void UpdateExpenseClaim(ExpenseClaim expenseClaim, int ECID)
        {
            control.UpdateEntity(expenseClaim, ECID);
        }

        public void DeleteExpenseClaim(ExpenseClaim expenseClaim)
        {
            control.DeleteEntity(expenseClaim);
        }

        public IList GetAllExpenseClaims(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}