using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 人员、设备备案
    /// </summary>
    public class HSEPerEquipRecordBLL
    {
        public void AddHSEPerEquipRecord(HSEPerEquipRecord hSEPerEquipRecord)
        {
            HSEPerEquipRecordDAL dal = new HSEPerEquipRecordDAL();
            dal.AddHSEPerEquipRecord(hSEPerEquipRecord);
        }

        public void UpdateHSEPerEquipRecord(HSEPerEquipRecord hSEPerEquipRecord, string Code)
        {
            HSEPerEquipRecordDAL dal = new HSEPerEquipRecordDAL();
            dal.UpdateHSEPerEquipRecord(hSEPerEquipRecord, Code);
        }

        public void DeleteHSEPerEquipRecord(HSEPerEquipRecord hSEPerEquipRecord)
        {
            HSEPerEquipRecordDAL dal = new HSEPerEquipRecordDAL();
            dal.DeleteHSEPerEquipRecord(hSEPerEquipRecord);
        }

        public IList GetAllHSEPerEquipRecords(string strHQL)
        {
            HSEPerEquipRecordDAL dal = new HSEPerEquipRecordDAL();
            return dal.GetAllHSEPerEquipRecords(strHQL);
        }
    }
}