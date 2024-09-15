using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ExpenseClaimDetailBLL
    {
        public void AddExpenseClaimDetail(ExpenseClaimDetail expenseClaimDetail)
        {
            ExpenseClaimDetailDAL dal = new ExpenseClaimDetailDAL();
            dal.AddExpenseClaimDetail(expenseClaimDetail);
        }

        public void UpdateExpenseClaimDetail(ExpenseClaimDetail expenseClaimDetail, int ID)
        {
            ExpenseClaimDetailDAL dal = new ExpenseClaimDetailDAL();
            dal.UpdateExpenseClaimDetail(expenseClaimDetail, ID);
        }

        public void DeleteExpenseClaimDetail(ExpenseClaimDetail expenseClaimDetail)
        {
            ExpenseClaimDetailDAL dal = new ExpenseClaimDetailDAL();
            dal.DeleteExpenseClaimDetail(expenseClaimDetail);
        }

        public IList GetAllExpenseClaimDetails(string strHQL)
        {
            ExpenseClaimDetailDAL dal = new ExpenseClaimDetailDAL();
            return dal.GetAllExpenseClaimDetails(strHQL);
        }
    }
}