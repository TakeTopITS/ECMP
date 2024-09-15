using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsReturnDetailDAL
    {
        private EntityControl control;

        public GoodsReturnDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsReturnDetail(GoodsReturnDetail goodsReturnDetail)
        {
            control.AddEntity(goodsReturnDetail);
        }

        public void UpdateGoodsReturnDetail(GoodsReturnDetail goodsReturnDetail, int ID)
        {
            control.UpdateEntity(goodsReturnDetail, ID);
        }

        public void DeleteGoodsReturnDetail(GoodsReturnDetail goodsReturnDetail)
        {
            control.DeleteEntity(goodsReturnDetail);
        }

        public IList GetAllGoodsReturnDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}