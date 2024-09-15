using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DefectAssignRecordBLL
    {
        public void AddDefectAssignRecord(DefectAssignRecord defectAssignRecord)
        {
            DefectAssignRecordDAL dal = new DefectAssignRecordDAL();
            dal.AddDefectAssignRecord(defectAssignRecord);
        }

        public void UpdateDefectAssignRecord(DefectAssignRecord defectAssignRecord, int ID)
        {
            DefectAssignRecordDAL dal = new DefectAssignRecordDAL();
            dal.UpdateDefectAssignRecord(defectAssignRecord, ID);
        }

        public void DeleteDefectAssignRecord(DefectAssignRecord defectAssignRecord)
        {
            DefectAssignRecordDAL dal = new DefectAssignRecordDAL();
            dal.DeleteDefectAssignRecord(defectAssignRecord);
        }

        public IList GetAllDefectAssignRecords(string strHQL)
        {
            DefectAssignRecordDAL dal = new DefectAssignRecordDAL();
            return dal.GetAllDefectAssignRecords(strHQL);
        }
    }
}