using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedGoodsDAL
    {
        private EntityControl control;

        public ConstractRelatedGoodsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedGoods(ConstractRelatedGoods constractRelatedGoods)
        {
            control.AddEntity(constractRelatedGoods);
        }

        public void UpdateConstractRelatedGoods(ConstractRelatedGoods constractRelatedGoods, int ID)
        {
            control.UpdateEntity(constractRelatedGoods, ID);
        }

        public void DeleteConstractRelatedGoods(ConstractRelatedGoods constractRelatedGoods)
        {
            control.DeleteEntity(constractRelatedGoods);
        }

        public IList GetAllConstractRelatedGoodss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}