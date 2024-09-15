using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WareHouseDAL
    {
        private EntityControl control;

        public WareHouseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWareHouse(WareHouse wareHouse)
        {
            control.AddEntity(wareHouse);
        }

        public void UpdateWareHouse(WareHouse wareHouse, string WHName)
        {
            control.UpdateEntity(wareHouse, WHName);
        }

        public void DeleteWareHouse(WareHouse wareHouse)
        {
            control.DeleteEntity(wareHouse);
        }

        public IList GetAllWareHouses(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}