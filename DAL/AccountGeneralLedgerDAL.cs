using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AccountGeneralLedgerDAL
    {
        private EntityControl control;

        public AccountGeneralLedgerDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAccountGeneralLedger(AccountGeneralLedger accountGeneralLedger)
        {
            control.AddEntity(accountGeneralLedger);
        }

        public void UpdateAccountGeneralLedger(AccountGeneralLedger accountGeneralLedger, int ID)
        {
            control.UpdateEntity(accountGeneralLedger, ID);
        }

        public void DeleteAccountGeneralLedger(AccountGeneralLedger accountGeneralLedger)
        {
            control.DeleteEntity(accountGeneralLedger);
        }

        public IList GetAllAccountGeneralLedgers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}