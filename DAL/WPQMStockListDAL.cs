using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 备料清单
    /// </summary>
    public class WPQMStockListDAL
    {
        private EntityControl control;

        public WPQMStockListDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMStockList(WPQMStockList wPQMStockList)
        {
            control.AddEntity(wPQMStockList);
        }

        public void UpdateWPQMStockList(WPQMStockList wPQMStockList, int ID)
        {
            control.UpdateEntity(wPQMStockList, ID);
        }

        public void DeleteWPQMStockList(WPQMStockList wPQMStockList)
        {
            control.DeleteEntity(wPQMStockList);
        }

        public IList GetAllWPQMStockLists(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}