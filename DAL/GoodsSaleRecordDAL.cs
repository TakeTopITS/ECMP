using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsSaleRecordDAL
    {
        private EntityControl control;

        public GoodsSaleRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsSaleRecord(GoodsSaleRecord goodsSaleRecord)
        {
            control.AddEntity(goodsSaleRecord);
        }

        public void UpdateGoodsSaleRecord(GoodsSaleRecord goodsSaleRecord, int ID)
        {
            control.UpdateEntity(goodsSaleRecord, ID);
        }

        public void DeleteGoodsSaleRecord(GoodsSaleRecord goodsSaleRecord)
        {
            control.DeleteEntity(goodsSaleRecord);
        }

        public IList GetAllGoodsSaleRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}