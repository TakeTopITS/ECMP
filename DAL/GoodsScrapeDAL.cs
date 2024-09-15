using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsScrapeDAL
    {
        private EntityControl control;

        public GoodsScrapeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsScrape(GoodsScrape goodsScrape)
        {
            control.AddEntity(goodsScrape);
        }

        public void UpdateGoodsScrape(GoodsScrape goodsScrape, int ID)
        {
            control.UpdateEntity(goodsScrape, ID);
        }

        public void DeleteGoodsScrape(GoodsScrape goodsScrape)
        {
            control.DeleteEntity(goodsScrape);
        }

        public IList GetAllGoodsScrapes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}