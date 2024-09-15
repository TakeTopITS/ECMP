using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsApplicationDetailDAL
    {
        private EntityControl control;

        public GoodsApplicationDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsApplicationDetail(GoodsApplicationDetail goodsApplicationDetail)
        {
            control.AddEntity(goodsApplicationDetail);
        }

        public void UpdateGoodsApplicationDetail(GoodsApplicationDetail goodsApplicationDetail, int ID)
        {
            control.UpdateEntity(goodsApplicationDetail, ID);
        }

        public void DeleteGoodsApplicationDetail(GoodsApplicationDetail goodsApplicationDetail)
        {
            control.DeleteEntity(goodsApplicationDetail);
        }

        public IList GetAllGoodsApplicationDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}