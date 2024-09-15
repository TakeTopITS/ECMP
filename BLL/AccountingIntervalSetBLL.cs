using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AccountingIntervalSetBLL
    {
        public void AddAccountingIntervalSet(AccountingIntervalSet accountingIntervalSet)
        {
            AccountingIntervalSetDAL dal = new AccountingIntervalSetDAL();
            dal.AddAccountingIntervalSet(accountingIntervalSet);
        }

        public void UpdateAccountingIntervalSet(AccountingIntervalSet accountingIntervalSet, int ID)
        {
            AccountingIntervalSetDAL dal = new AccountingIntervalSetDAL();
            dal.UpdateAccountingIntervalSet(accountingIntervalSet, ID);
        }

        public void DeleteAccountingIntervalSet(AccountingIntervalSet accountingIntervalSet)
        {
            AccountingIntervalSetDAL dal = new AccountingIntervalSetDAL();
            dal.DeleteAccountingIntervalSet(accountingIntervalSet);
        }

        public IList GetAllAccountingIntervalSets(string strHQL)
        {
            AccountingIntervalSetDAL dal = new AccountingIntervalSetDAL();
            return dal.GetAllAccountingIntervalSets(strHQL);
        }
    }
}