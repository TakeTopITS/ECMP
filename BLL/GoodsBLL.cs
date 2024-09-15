using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsBLL
    {
        public void AddGoods(Goods goods)
        {
            GoodsDAL dal = new GoodsDAL();
            dal.AddGoods(goods);
        }

        public void UpdateGoods(Goods goods, int ID)
        {
            GoodsDAL dal = new GoodsDAL();
            dal.UpdateGoods(goods, ID);
        }

        public void DeleteGoods(Goods goods)
        {
            GoodsDAL dal = new GoodsDAL();
            dal.DeleteGoods(goods);
        }

        public IList GetAllGoodss(string strHQL)
        {
            GoodsDAL dal = new GoodsDAL();
            return dal.GetAllGoodss(strHQL);
        }
    }
}