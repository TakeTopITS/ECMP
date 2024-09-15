using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 人员、设备备案
    /// </summary>
    public class HSEPerEquipRecordDAL
    {
        private EntityControl control;

        public HSEPerEquipRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEPerEquipRecord(HSEPerEquipRecord hSEPerEquipRecord)
        {
            control.AddEntity(hSEPerEquipRecord);
        }

        public void UpdateHSEPerEquipRecord(HSEPerEquipRecord hSEPerEquipRecord, string Code)
        {
            control.UpdateEntity(hSEPerEquipRecord, Code);
        }

        public void DeleteHSEPerEquipRecord(HSEPerEquipRecord hSEPerEquipRecord)
        {
            control.DeleteEntity(hSEPerEquipRecord);
        }

        public IList GetAllHSEPerEquipRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}