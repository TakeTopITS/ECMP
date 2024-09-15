using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsApplicationBLL
    {
        public void AddGoodsApplication(GoodsApplication goodsApplication)
        {
            GoodsApplicationDAL dal = new GoodsApplicationDAL();
            dal.AddGoodsApplication(goodsApplication);
        }

        public void UpdateGoodsApplication(GoodsApplication goodsApplication, int AAID)
        {
            GoodsApplicationDAL dal = new GoodsApplicationDAL();
            dal.UpdateGoodsApplication(goodsApplication, AAID);
        }

        public void DeleteGoodsApplication(GoodsApplication goodsApplication)
        {
            GoodsApplicationDAL dal = new GoodsApplicationDAL();
            dal.DeleteGoodsApplication(goodsApplication);
        }

        public IList GetAllGoodsApplications(string strHQL)
        {
            GoodsApplicationDAL dal = new GoodsApplicationDAL();
            return dal.GetAllGoodsApplications(strHQL);
        }
    }
}