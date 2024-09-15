using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WareHouseBLL
    {
        public void AddWareHouse(WareHouse wareHouse)
        {
            WareHouseDAL dal = new WareHouseDAL();
            dal.AddWareHouse(wareHouse);
        }

        public void UpdateWareHouse(WareHouse wareHouse, string WHName)
        {
            WareHouseDAL dal = new WareHouseDAL();
            dal.UpdateWareHouse(wareHouse, WHName);
        }

        public void DeleteWareHouse(WareHouse wareHouse)
        {
            WareHouseDAL dal = new WareHouseDAL();
            dal.DeleteWareHouse(wareHouse);
        }

        public IList GetAllWareHouses(string strHQL)
        {
            WareHouseDAL dal = new WareHouseDAL();
            return dal.GetAllWareHouses(strHQL);
        }
    }
}