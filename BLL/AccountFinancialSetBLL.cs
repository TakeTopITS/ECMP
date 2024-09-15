using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AccountFinancialSetBLL
    {
        public void AddAccountFinancialSet(AccountFinancialSet accountFinancialSet)
        {
            AccountFinancialSetDAL dal = new AccountFinancialSetDAL();
            dal.AddAccountFinancialSet(accountFinancialSet);
        }

        public void UpdateAccountFinancialSet(AccountFinancialSet accountFinancialSet, int ID)
        {
            AccountFinancialSetDAL dal = new AccountFinancialSetDAL();
            dal.UpdateAccountFinancialSet(accountFinancialSet, ID);
        }

        public void DeleteAccountFinancialSet(AccountFinancialSet accountFinancialSet)
        {
            AccountFinancialSetDAL dal = new AccountFinancialSetDAL();
            dal.DeleteAccountFinancialSet(accountFinancialSet);
        }

        public IList GetAllAccountFinancialSets(string strHQL)
        {
            AccountFinancialSetDAL dal = new AccountFinancialSetDAL();
            return dal.GetAllAccountFinancialSets(strHQL);
        }
    }
}