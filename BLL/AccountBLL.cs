using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AccountBLL
    {
        public void AddAccount(Account account)
        {
            AccountDAL dal = new AccountDAL();
            dal.AddAccount(account);
        }

        public void UpdateAccount(Account account, int ID)
        {
            AccountDAL dal = new AccountDAL();
            dal.UpdateAccount(account, ID);
        }

        public void DeleteAccount(Account account)
        {
            AccountDAL dal = new AccountDAL();
            dal.DeleteAccount(account);
        }

        public IList GetAllAccounts(string strHQL)
        {
            AccountDAL dal = new AccountDAL();
            return dal.GetAllAccounts(strHQL);
        }
    }
}