using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsShipmentDetailDAL
    {
        private EntityControl control;

        public GoodsShipmentDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsShipmentDetail(GoodsShipmentDetail goodsShipmentDetail)
        {
            control.AddEntity(goodsShipmentDetail);
        }

        public void UpdateGoodsShipmentDetail(GoodsShipmentDetail goodsShipmentDetail, int ID)
        {
            control.UpdateEntity(goodsShipmentDetail, ID);
        }

        public void DeleteGoodsShipmentDetail(GoodsShipmentDetail goodsShipmentDetail)
        {
            control.DeleteEntity(goodsShipmentDetail);
        }

        public IList GetAllGoodsShipmentDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}