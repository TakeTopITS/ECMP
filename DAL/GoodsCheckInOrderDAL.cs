using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsCheckInOrderDAL
    {
        private EntityControl control;

        public GoodsCheckInOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsCheckInOrder(GoodsCheckInOrder goodsCheckInOrderCheckInOrder)
        {
            control.AddEntity(goodsCheckInOrderCheckInOrder);
        }

        public void UpdateGoodsCheckInOrder(GoodsCheckInOrder goodsCheckInOrderCheckInOrder, int CheckInID)
        {
            control.UpdateEntity(goodsCheckInOrderCheckInOrder, CheckInID);
        }

        public void DeleteGoodsCheckInOrder(GoodsCheckInOrder goodsCheckInOrderCheckInOrder)
        {
            control.DeleteEntity(goodsCheckInOrderCheckInOrder);
        }

        public IList GetAllGoodsCheckInOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}