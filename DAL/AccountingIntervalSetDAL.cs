using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AccountingIntervalSetDAL
    {
        private EntityControl control;

        public AccountingIntervalSetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAccountingIntervalSet(AccountingIntervalSet accountingIntervalSet)
        {
            control.AddEntity(accountingIntervalSet);
        }

        public void UpdateAccountingIntervalSet(AccountingIntervalSet accountingIntervalSet, int ID)
        {
            control.UpdateEntity(accountingIntervalSet, ID);
        }

        public void DeleteAccountingIntervalSet(AccountingIntervalSet accountingIntervalSet)
        {
            control.DeleteEntity(accountingIntervalSet);
        }

        public IList GetAllAccountingIntervalSets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}