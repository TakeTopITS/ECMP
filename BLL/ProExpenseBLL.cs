using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProExpenseBLL
    {
        public void AddProExpense(ProExpense proExpense)
        {
            ProExpenseDAL dal = new ProExpenseDAL();
            dal.AddProExpense(proExpense);
        }

        public void UpdateProExpense(ProExpense proExpense, int ID)
        {
            ProExpenseDAL dal = new ProExpenseDAL();
            dal.UpdateProExpense(proExpense, ID);
        }

        public void DeleteProExpense(ProExpense proExpense)
        {
            ProExpenseDAL dal = new ProExpenseDAL();
            dal.DeleteProExpense(proExpense);
        }

        public IList GetAllProExpenses(string strHQL)
        {
            ProExpenseDAL dal = new ProExpenseDAL();
            return dal.GetAllProExpenses(strHQL);
        }
    }
}