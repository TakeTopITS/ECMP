using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AccountDAL
    {
        private EntityControl control;

        public AccountDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAccount(Account account)
        {
            control.AddEntity(account);
        }

        public void UpdateAccount(Account account, int ID)
        {
            control.UpdateEntity(account, ID);
        }

        public void DeleteAccount(Account account)
        {
            control.DeleteEntity(account);
        }

        public IList GetAllAccounts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}