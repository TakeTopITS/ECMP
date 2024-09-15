using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsMTRecordDAL
    {
        private EntityControl control;

        public GoodsMTRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsMTRecord(GoodsMTRecord goodsMTRecord)
        {
            control.AddEntity(goodsMTRecord);
        }

        public void UpdateGoodsMTRecord(GoodsMTRecord goodsMTRecord, int ID)
        {
            control.UpdateEntity(goodsMTRecord, ID);
        }

        public void DeleteGoodsMTRecord(GoodsMTRecord goodsMTRecord)
        {
            control.DeleteEntity(goodsMTRecord);
        }

        public IList GetAllGoodsMTRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}