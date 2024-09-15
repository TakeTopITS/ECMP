using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsCheckOutNoticeOrderDAL
    {
        private EntityControl control;

        public GoodsCheckOutNoticeOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsCheckOutNoticeOrder(GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder)
        {
            control.AddEntity(goodsCheckOutNoticeOrder);
        }

        public void UpdateGoodsCheckOutNoticeOrder(GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder, int COOID)
        {
            control.UpdateEntity(goodsCheckOutNoticeOrder, COOID);
        }

        public void DeleteGoodsCheckOutNoticeOrder(GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder)
        {
            control.DeleteEntity(goodsCheckOutNoticeOrder);
        }

        public IList GetAllGoodsCheckOutNoticeOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}