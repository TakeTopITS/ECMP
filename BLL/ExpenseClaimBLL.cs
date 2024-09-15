using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ExpenseClaimBLL
    {
        public void AddExpenseClaim(ExpenseClaim expenseClaim)
        {
            ExpenseClaimDAL dal = new ExpenseClaimDAL();
            dal.AddExpenseClaim(expenseClaim);
        }

        public void UpdateExpenseClaim(ExpenseClaim expenseClaim, int ECID)
        {
            ExpenseClaimDAL dal = new ExpenseClaimDAL();
            dal.UpdateExpenseClaim(expenseClaim, ECID);
        }

        public void DeleteExpenseClaim(ExpenseClaim expenseClaim)
        {
            ExpenseClaimDAL dal = new ExpenseClaimDAL();
            dal.DeleteExpenseClaim(expenseClaim);
        }

        public IList GetAllExpenseClaims(string strHQL)
        {
            ExpenseClaimDAL dal = new ExpenseClaimDAL();
            return dal.GetAllExpenseClaims(strHQL);
        }
    }
}