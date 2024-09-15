using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractReceivablesRecordDAL
    {
        private EntityControl control;

        public ConstractReceivablesRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractReceivablesRecord(ConstractReceivablesRecord constractReceivablesRecord)
        {
            control.AddEntity(constractReceivablesRecord);
        }

        public void UpdateConstractReceivablesRecord(ConstractReceivablesRecord constractReceivablesRecord, int ID)
        {
            control.UpdateEntity(constractReceivablesRecord, ID);
        }

        public void DeleteConstractReceivablesRecord(ConstractReceivablesRecord constractReceivablesRecord)
        {
            control.DeleteEntity(constractReceivablesRecord);
        }

        public IList GetAllConstractReceivablesRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}