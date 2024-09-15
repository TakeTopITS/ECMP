using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsProductionOrderDetailDAL
    {
        private EntityControl control;

        public GoodsProductionOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsProductionOrderDetail(GoodsProductionOrderDetail goodsProductionOrderDetail)
        {
            control.AddEntity(goodsProductionOrderDetail);
        }

        public void UpdateGoodsProductionOrderDetail(GoodsProductionOrderDetail goodsProductionOrderDetail, int ID)
        {
            control.UpdateEntity(goodsProductionOrderDetail, ID);
        }

        public void DeleteGoodsProductionOrderDetail(GoodsProductionOrderDetail goodsProductionOrderDetail)
        {
            control.DeleteEntity(goodsProductionOrderDetail);
        }

        public IList GetAllGoodsProductionOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}