using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsApplicationDetailBLL
    {
        public void AddGoodsApplicationDetail(GoodsApplicationDetail goodsApplicationDetail)
        {
            GoodsApplicationDetailDAL dal = new GoodsApplicationDetailDAL();
            dal.AddGoodsApplicationDetail(goodsApplicationDetail);
        }

        public void UpdateGoodsApplicationDetail(GoodsApplicationDetail goodsApplicationDetail, int ID)
        {
            GoodsApplicationDetailDAL dal = new GoodsApplicationDetailDAL();
            dal.UpdateGoodsApplicationDetail(goodsApplicationDetail, ID);
        }

        public void DeleteGoodsApplicationDetail(GoodsApplicationDetail goodsApplicationDetail)
        {
            GoodsApplicationDetailDAL dal = new GoodsApplicationDetailDAL();
            dal.DeleteGoodsApplicationDetail(goodsApplicationDetail);
        }

        public IList GetAllGoodsApplicationDetails(string strHQL)
        {
            GoodsApplicationDetailDAL dal = new GoodsApplicationDetailDAL();
            return dal.GetAllGoodsApplicationDetails(strHQL);
        }
    }
}