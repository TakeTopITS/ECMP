using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsCheckOutNoticeOrderDetailDAL
    {
        private EntityControl control;

        public GoodsCheckOutNoticeOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsCheckOutNoticeOrderDetail(GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrder)
        {
            control.AddEntity(goodsCheckOutNoticeOrder);
        }

        public void UpdateGoodsCheckOutNoticeOrderDetail(GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrder, int ID)
        {
            control.UpdateEntity(goodsCheckOutNoticeOrder, ID);
        }

        public void DeleteGoodsCheckOutNoticeOrderDetail(GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrder)
        {
            control.DeleteEntity(goodsCheckOutNoticeOrder);
        }

        public IList GetAllGoodsCheckOutNoticeOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}