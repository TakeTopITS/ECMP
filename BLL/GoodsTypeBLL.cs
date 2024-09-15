using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsTypeBLL
    {
        public void AddGoodsType(GoodsType goodsType)
        {
            GoodsTypeDAL dal = new GoodsTypeDAL();
            dal.AddGoodsType(goodsType);
        }

        public void UpdateGoodsType(GoodsType goodsType, string Type)
        {
            GoodsTypeDAL dal = new GoodsTypeDAL();
            dal.UpdateGoodsType(goodsType, Type);
        }

        public void DeleteGoodsType(GoodsType goodsType)
        {
            GoodsTypeDAL dal = new GoodsTypeDAL();
            dal.DeleteGoodsType(goodsType);
        }

        public IList GetAllGoodsTypes(string strHQL)
        {
            GoodsTypeDAL dal = new GoodsTypeDAL();
            return dal.GetAllGoodsTypes(strHQL);
        }
    }
}