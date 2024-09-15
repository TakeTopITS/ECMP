using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 安全检查记录
    /// </summary>
    public class HSESafeInspectionRecordDAL
    {
        private EntityControl control;

        public HSESafeInspectionRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSESafeInspectionRecord(HSESafeInspectionRecord hSESafeInspectionRecord)
        {
            control.AddEntity(hSESafeInspectionRecord);
        }

        public void UpdateHSESafeInspectionRecord(HSESafeInspectionRecord hSESafeInspectionRecord, string Code)
        {
            control.UpdateEntity(hSESafeInspectionRecord, Code);
        }

        public void DeleteHSESafeInspectionRecord(HSESafeInspectionRecord hSESafeInspectionRecord)
        {
            control.DeleteEntity(hSESafeInspectionRecord);
        }

        public IList GetAllHSESafeInspectionRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}