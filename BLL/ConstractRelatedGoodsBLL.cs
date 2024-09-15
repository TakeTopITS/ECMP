using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedGoodsBLL
    {
        public void AddConstractRelatedGoods(ConstractRelatedGoods constractRelatedGoods)
        {
            ConstractRelatedGoodsDAL dal = new ConstractRelatedGoodsDAL();
            dal.AddConstractRelatedGoods(constractRelatedGoods);
        }

        public void UpdateConstractRelatedGoods(ConstractRelatedGoods constractRelatedGoods, int ID)
        {
            ConstractRelatedGoodsDAL dal = new ConstractRelatedGoodsDAL();
            dal.UpdateConstractRelatedGoods(constractRelatedGoods, ID);
        }

        public void DeleteConstractRelatedGoods(ConstractRelatedGoods constractRelatedGoods)
        {
            ConstractRelatedGoodsDAL dal = new ConstractRelatedGoodsDAL();
            dal.DeleteConstractRelatedGoods(constractRelatedGoods);
        }

        public IList GetAllConstractRelatedGoodss(string strHQL)
        {
            ConstractRelatedGoodsDAL dal = new ConstractRelatedGoodsDAL();
            return dal.GetAllConstractRelatedGoodss(strHQL);
        }
    }
}