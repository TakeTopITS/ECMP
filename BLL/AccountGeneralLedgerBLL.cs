using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AccountGeneralLedgerBLL
    {
        public void AddAccountGeneralLedger(AccountGeneralLedger accountGeneralLedger)
        {
            AccountGeneralLedgerDAL dal = new AccountGeneralLedgerDAL();
            dal.AddAccountGeneralLedger(accountGeneralLedger);
        }

        public void UpdateAccountGeneralLedger(AccountGeneralLedger accountGeneralLedger, int ID)
        {
            AccountGeneralLedgerDAL dal = new AccountGeneralLedgerDAL();
            dal.UpdateAccountGeneralLedger(accountGeneralLedger, ID);
        }

        public void DeleteAccountGeneralLedger(AccountGeneralLedger accountGeneralLedger)
        {
            AccountGeneralLedgerDAL dal = new AccountGeneralLedgerDAL();
            dal.DeleteAccountGeneralLedger(accountGeneralLedger);
        }

        public IList GetAllAccountGeneralLedgers(string strHQL)
        {
            AccountGeneralLedgerDAL dal = new AccountGeneralLedgerDAL();
            return dal.GetAllAccountGeneralLedgers(strHQL);
        }
    }
}