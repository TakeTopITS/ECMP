using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsUserRecordDAL
    {
        private EntityControl control;

        public GoodsUserRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsUserRecord(GoodsUserRecord goodsPurRecord)
        {
            control.AddEntity(goodsPurRecord);
        }

        public void UpdateGoodsUserRecord(GoodsUserRecord goodsPurRecord, int ID)
        {
            control.UpdateEntity(goodsPurRecord, ID);
        }

        public void DeleteGoodsUserRecord(GoodsUserRecord goodsPurRecord)
        {
            control.DeleteEntity(goodsPurRecord);
        }

        public IList GetAllGoodsUserRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}