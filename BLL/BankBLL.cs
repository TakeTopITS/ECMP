using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class BankBLL
    {
        public void AddBank(Bank bank)
        {
            BankDAL dal = new BankDAL();
            dal.AddBank(bank);
        }

        public void UpdateBank(Bank bank, string BankName)
        {
            BankDAL dal = new BankDAL();
            dal.UpdateBank(bank, BankName);
        }

        public void DeleteBank(Bank bank)
        {
            BankDAL dal = new BankDAL();
            dal.DeleteBank(bank);
        }

        public IList GetAllBanks(string strHQL)
        {
            BankDAL dal = new BankDAL();
            return dal.GetAllBanks(strHQL);
        }
    }
}