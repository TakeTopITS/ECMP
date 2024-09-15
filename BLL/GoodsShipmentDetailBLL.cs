using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsShipmentDetailBLL
    {
        public void AddGoodsShipmentDetail(GoodsShipmentDetail goodsShipmentDetail)
        {
            GoodsShipmentDetailDAL dal = new GoodsShipmentDetailDAL();
            dal.AddGoodsShipmentDetail(goodsShipmentDetail);
        }

        public void UpdateGoodsShipmentDetail(GoodsShipmentDetail goodsShipmentDetail, int ID)
        {
            GoodsShipmentDetailDAL dal = new GoodsShipmentDetailDAL();
            dal.UpdateGoodsShipmentDetail(goodsShipmentDetail, ID);
        }

        public void DeleteGoodsShipmentDetail(GoodsShipmentDetail goodsShipmentDetail)
        {
            GoodsShipmentDetailDAL dal = new GoodsShipmentDetailDAL();
            dal.DeleteGoodsShipmentDetail(goodsShipmentDetail);
        }

        public IList GetAllGoodsShipmentDetails(string strHQL)
        {
            GoodsShipmentDetailDAL dal = new GoodsShipmentDetailDAL();
            return dal.GetAllGoodsShipmentDetails(strHQL);
        }
    }
}