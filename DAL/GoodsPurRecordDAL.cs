using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsPurRecordDAL
    {
        private EntityControl control;

        public GoodsPurRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsPurRecord(GoodsPurRecord goodsPurRecord)
        {
            control.AddEntity(goodsPurRecord);
        }

        public void UpdateGoodsPurRecord(GoodsPurRecord goodsPurRecord, int ID)
        {
            control.UpdateEntity(goodsPurRecord, ID);
        }

        public void DeleteGoodsPurRecord(GoodsPurRecord goodsPurRecord)
        {
            control.DeleteEntity(goodsPurRecord);
        }

        public IList GetAllGoodsPurRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}