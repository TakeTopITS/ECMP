using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractPayableRecordDAL
    {
        private EntityControl control;

        public ConstractPayableRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractPayableRecord(ConstractPayableRecord constractPayableRecord)
        {
            control.AddEntity(constractPayableRecord);
        }

        public void UpdateConstractPayableRecord(ConstractPayableRecord constractPayableRecord, int ID)
        {
            control.UpdateEntity(constractPayableRecord, ID);
        }

        public void DeleteConstractPayableRecord(ConstractPayableRecord constractPayableRecord)
        {
            control.DeleteEntity(constractPayableRecord);
        }

        public IList GetAllConstractPayableRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}