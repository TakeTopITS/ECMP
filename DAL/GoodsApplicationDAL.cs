using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsApplicationDAL
    {
        private EntityControl control;

        public GoodsApplicationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsApplication(GoodsApplication goodsApplication)
        {
            control.AddEntity(goodsApplication);
        }

        public void UpdateGoodsApplication(GoodsApplication goodsApplication, int AAID)
        {
            control.UpdateEntity(goodsApplication, AAID);
        }

        public void DeleteGoodsApplication(GoodsApplication goodsApplication)
        {
            control.DeleteEntity(goodsApplication);
        }

        public IList GetAllGoodsApplications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}