using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsDAL
    {
        private EntityControl control;

        public GoodsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoods(Goods goods)
        {
            control.AddEntity(goods);
        }

        public void UpdateGoods(Goods goods, int ID)
        {
            control.UpdateEntity(goods, ID);
        }

        public void DeleteGoods(Goods goods)
        {
            control.DeleteEntity(goods);
        }

        public IList GetAllGoodss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}