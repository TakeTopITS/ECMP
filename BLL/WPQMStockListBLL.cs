using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 备料清单
    /// </summary>
    public class WPQMStockListBLL
    {
        public void AddWPQMStockList(WPQMStockList wPQMStockList)
        {
            WPQMStockListDAL dal = new WPQMStockListDAL();
            dal.AddWPQMStockList(wPQMStockList);
        }

        public void UpdateWPQMStockList(WPQMStockList wPQMStockList, int ID)
        {
            WPQMStockListDAL dal = new WPQMStockListDAL();
            dal.UpdateWPQMStockList(wPQMStockList, ID);
        }

        public void DeleteWPQMStockList(WPQMStockList wPQMStockList)
        {
            WPQMStockListDAL dal = new WPQMStockListDAL();
            dal.DeleteWPQMStockList(wPQMStockList);
        }

        public IList GetAllWPQMStockLists(string strHQL)
        {
            WPQMStockListDAL dal = new WPQMStockListDAL();
            return dal.GetAllWPQMStockLists(strHQL);
        }
    }
}