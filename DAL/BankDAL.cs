using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BankDAL
    {
        private EntityControl control;

        public BankDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBank(Bank bank)
        {
            control.AddEntity(bank);
        }

        public void UpdateBank(Bank bank, string BankName)
        {
            control.UpdateEntity(bank, BankName);
        }

        public void DeleteBank(Bank bank)
        {
            control.DeleteEntity(bank);
        }

        public IList GetAllBanks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}