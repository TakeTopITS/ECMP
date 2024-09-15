using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsScrapeBLL
    {
        public void AddGoodsScrape(GoodsScrape goodsScrape)
        {
            GoodsScrapeDAL dal = new GoodsScrapeDAL();
            dal.AddGoodsScrape(goodsScrape);
        }

        public void UpdateGoodsScrape(GoodsScrape goodsScrape, int ID)
        {
            GoodsScrapeDAL dal = new GoodsScrapeDAL();
            dal.UpdateGoodsScrape(goodsScrape, ID);
        }

        public void DeleteGoodsScrape(GoodsScrape goodsScrape)
        {
            GoodsScrapeDAL dal = new GoodsScrapeDAL();
            dal.DeleteGoodsScrape(goodsScrape);
        }

        public IList GetAllGoodsScrapes(string strHQL)
        {
            GoodsScrapeDAL dal = new GoodsScrapeDAL();
            return dal.GetAllGoodsScrapes(strHQL);
        }
    }
}