using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 安全检查记录
    /// </summary>
    public class HSESafeInspectionRecordBLL
    {
        public void AddHSESafeInspectionRecord(HSESafeInspectionRecord hSESafeInspectionRecord)
        {
            HSESafeInspectionRecordDAL dal = new HSESafeInspectionRecordDAL();
            dal.AddHSESafeInspectionRecord(hSESafeInspectionRecord);
        }

        public void UpdateHSESafeInspectionRecord(HSESafeInspectionRecord hSESafeInspectionRecord, string Code)
        {
            HSESafeInspectionRecordDAL dal = new HSESafeInspectionRecordDAL();
            dal.UpdateHSESafeInspectionRecord(hSESafeInspectionRecord, Code);
        }

        public void DeleteHSESafeInspectionRecord(HSESafeInspectionRecord hSESafeInspectionRecord)
        {
            HSESafeInspectionRecordDAL dal = new HSESafeInspectionRecordDAL();
            dal.DeleteHSESafeInspectionRecord(hSESafeInspectionRecord);
        }

        public IList GetAllHSESafeInspectionRecords(string strHQL)
        {
            HSESafeInspectionRecordDAL dal = new HSESafeInspectionRecordDAL();
            return dal.GetAllHSESafeInspectionRecords(strHQL);
        }
    }
}