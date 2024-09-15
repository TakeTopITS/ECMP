using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsReturnDetailBLL
    {
        public void AddGoodsReturnDetail(GoodsReturnDetail goodsReturnDetail)
        {
            GoodsReturnDetailDAL dal = new GoodsReturnDetailDAL();
            dal.AddGoodsReturnDetail(goodsReturnDetail);
        }

        public void UpdateGoodsReturnDetail(GoodsReturnDetail goodsReturnDetail, int ID)
        {
            GoodsReturnDetailDAL dal = new GoodsReturnDetailDAL();
            dal.UpdateGoodsReturnDetail(goodsReturnDetail, ID);
        }

        public void DeleteGoodsReturnDetail(GoodsReturnDetail goodsReturnDetail)
        {
            GoodsReturnDetailDAL dal = new GoodsReturnDetailDAL();
            dal.DeleteGoodsReturnDetail(goodsReturnDetail);
        }

        public IList GetAllGoodsReturnDetails(string strHQL)
        {
            GoodsReturnDetailDAL dal = new GoodsReturnDetailDAL();
            return dal.GetAllGoodsReturnDetails(strHQL);
        }
    }
}