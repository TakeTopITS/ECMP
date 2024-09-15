using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AccountFinancialSetDAL
    {
        private EntityControl control;

        public AccountFinancialSetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAccountFinancialSet(AccountFinancialSet accountFinancialSet)
        {
            control.AddEntity(accountFinancialSet);
        }

        public void UpdateAccountFinancialSet(AccountFinancialSet accountFinancialSet, int ID)
        {
            control.UpdateEntity(accountFinancialSet, ID);
        }

        public void DeleteAccountFinancialSet(AccountFinancialSet accountFinancialSet)
        {
            control.DeleteEntity(accountFinancialSet);
        }

        public IList GetAllAccountFinancialSets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}