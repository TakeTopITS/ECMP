using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsAdjustRecordDAL
    {
        private EntityControl control;

        public GoodsAdjustRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsAdjustRecord(GoodsAdjustRecord goodsAdjustRecord)
        {
            control.AddEntity(goodsAdjustRecord);
        }

        public void UpdateGoodsAdjustRecord(GoodsAdjustRecord goodsAdjustRecord, int ID)
        {
            control.UpdateEntity(goodsAdjustRecord, ID);
        }

        public void DeleteGoodsAdjustRecord(GoodsAdjustRecord goodsAdjustRecord)
        {
            control.DeleteEntity(goodsAdjustRecord);
        }

        public IList GetAllGoodsAdjustRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}