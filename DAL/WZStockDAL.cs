using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZStockDAL
    {
        private EntityControl control;

        public WZStockDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZStock(WZStock wZStock)
        {
            control.AddEntity(wZStock);
        }

        public void UpdateWZStock(WZStock wZStock, int ID)
        {
            control.UpdateEntity(wZStock, ID);
        }

        public void DeleteWZStock(WZStock wZStock)
        {
            control.DeleteEntity(wZStock);
        }

        public IList GetAllWZStocks(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}