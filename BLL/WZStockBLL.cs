using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZStockBLL
    {
        public void AddWZStock(WZStock wZStock)
        {
            WZStockDAL dal = new WZStockDAL();
            dal.AddWZStock(wZStock);
        }

        public void UpdateWZStock(WZStock wZStock, int ID)
        {
            WZStockDAL dal = new WZStockDAL();
            dal.UpdateWZStock(wZStock, ID);
        }

        public void DeleteWZStock(WZStock wZStock)
        {
            WZStockDAL dal = new WZStockDAL();
            dal.DeleteWZStock(wZStock);
        }

        public IList GetAllWZStocks(string strHQL)
        {
            WZStockDAL dal = new WZStockDAL();
            return dal.GetAllWZStocks(strHQL);
        }
    }
}