using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsShipmentOrderBLL
    {
        public void AddGoodsShipmentOrder(GoodsShipmentOrder goodsShipmentOrder)
        {
            GoodsShipmentOrderDAL dal = new GoodsShipmentOrderDAL();
            dal.AddGoodsShipmentOrder(goodsShipmentOrder);
        }

        public void UpdateGoodsShipmentOrder(GoodsShipmentOrder goodsShipmentOrder, int ShipmentNO)
        {
            GoodsShipmentOrderDAL dal = new GoodsShipmentOrderDAL();
            dal.UpdateGoodsShipmentOrder(goodsShipmentOrder, ShipmentNO);
        }

        public void DeleteGoodsShipmentOrder(GoodsShipmentOrder goodsShipmentOrder)
        {
            GoodsShipmentOrderDAL dal = new GoodsShipmentOrderDAL();
            dal.DeleteGoodsShipmentOrder(goodsShipmentOrder);
        }

        public IList GetAllGoodsShipmentOrders(string strHQL)
        {
            GoodsShipmentOrderDAL dal = new GoodsShipmentOrderDAL();
            return dal.GetAllGoodsShipmentOrders(strHQL);
        }
    }
}