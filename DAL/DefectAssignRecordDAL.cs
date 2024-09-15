using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DefectAssignRecordDAL
    {
        private EntityControl control;

        public DefectAssignRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDefectAssignRecord(DefectAssignRecord defectAssignRecord)
        {
            control.AddEntity(defectAssignRecord);
        }

        public void UpdateDefectAssignRecord(DefectAssignRecord defectAssignRecord, int ID)
        {
            control.UpdateEntity(defectAssignRecord, ID);
        }

        public void DeleteDefectAssignRecord(DefectAssignRecord defectAssignRecord)
        {
            control.DeleteEntity(defectAssignRecord);
        }

        public IList GetAllDefectAssignRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}