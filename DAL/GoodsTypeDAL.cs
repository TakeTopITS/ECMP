using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsTypeDAL
    {
        private EntityControl control;

        public GoodsTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsType(GoodsType goodsType)
        {
            control.AddEntity(goodsType);
        }

        public void UpdateGoodsType(GoodsType goodsType, string Type)
        {
            control.UpdateEntity(goodsType, Type);
        }

        public void DeleteGoodsType(GoodsType goodsType)
        {
            control.DeleteEntity(goodsType);
        }

        public IList GetAllGoodsTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}