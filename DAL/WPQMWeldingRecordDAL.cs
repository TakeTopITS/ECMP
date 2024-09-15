using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 焊接记录表
    /// </summary>
    public class WPQMWeldingRecordDAL
    {
        private EntityControl control;

        public WPQMWeldingRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMWeldingRecord(WPQMWeldingRecord wPQMWeldingRecord)
        {
            control.AddEntity(wPQMWeldingRecord);
        }

        public void UpdateWPQMWeldingRecord(WPQMWeldingRecord wPQMWeldingRecord, int ID)
        {
            control.UpdateEntity(wPQMWeldingRecord, ID);
        }

        public void DeleteWPQMWeldingRecord(WPQMWeldingRecord wPQMWeldingRecord)
        {
            control.DeleteEntity(wPQMWeldingRecord);
        }

        public IList GetAllWPQMWeldingRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}