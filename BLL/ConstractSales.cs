using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractSalesBLL
    {
        public void AddConstractSales(ConstractSales constractSales)
        {
            ConstractSalesDAL dal = new ConstractSalesDAL();
            dal.AddConstractSales(constractSales);
        }

        public void UpdateConstractSales(ConstractSales constractSales, int ID)
        {
            ConstractSalesDAL dal = new ConstractSalesDAL();
            dal.UpdateConstractSales(constractSales, ID);
        }

        public void DeleteConstractSales(ConstractSales constractSales)
        {
            ConstractSalesDAL dal = new ConstractSalesDAL();
            dal.DeleteConstractSales(constractSales);
        }

        public IList GetAllConstractSaless(string strHQL)
        {
            ConstractSalesDAL dal = new ConstractSalesDAL();
            return dal.GetAllConstractSaless(strHQL);
        }
    }
}