using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsSupplyOrderDetailDAL
    {
        private EntityControl control;

        public GoodsSupplyOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsSupplyOrderDetail(GoodsSupplyOrderDetail goodsSupplyOrderDetail)
        {
            control.AddEntity(goodsSupplyOrderDetail);
        }

        public void UpdateGoodsSupplyOrderDetail(GoodsSupplyOrderDetail goodsSupplyOrderDetail, int ID)
        {
            control.UpdateEntity(goodsSupplyOrderDetail, ID);
        }

        public void DeleteGoodsSupplyOrderDetail(GoodsSupplyOrderDetail goodsSupplyOrderDetail)
        {
            control.DeleteEntity(goodsSupplyOrderDetail);
        }

        public IList GetAllGoodsSupplyOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}