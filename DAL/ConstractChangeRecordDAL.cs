using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractChangeRecordDAL
    {
        private EntityControl control;

        public ConstractChangeRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractChangeRecord(ConstractChangeRecord constractChangeRecord)
        {
            control.AddEntity(constractChangeRecord);
        }

        public void UpdateConstractChangeRecord(ConstractChangeRecord constractChangeRecord, int ID)
        {
            control.UpdateEntity(constractChangeRecord, ID);
        }

        public void DeleteConstractChangeRecord(ConstractChangeRecord constractChangeRecord)
        {
            control.DeleteEntity(constractChangeRecord);
        }

        public IList GetAllConstractChangeRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}