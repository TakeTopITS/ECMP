using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsCheckInOrderDetailDAL
    {
        private EntityControl control;

        public GoodsCheckInOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsCheckInOrderDetail(GoodsCheckInOrderDetail goodsCheckInOrderDetail)
        {
            control.AddEntity(goodsCheckInOrderDetail);
        }

        public void UpdateGoodsCheckInOrderDetail(GoodsCheckInOrderDetail goodsCheckInOrderDetail, int ID)
        {
            control.UpdateEntity(goodsCheckInOrderDetail, ID);
        }

        public void DeleteGoodsCheckInOrderDetail(GoodsCheckInOrderDetail goodsCheckInOrderDetail)
        {
            control.DeleteEntity(goodsCheckInOrderDetail);
        }

        public IList GetAllGoodsCheckInOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}