using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 预算数据更改前历史记录
    /// </summary>
    public class BDBaseDataRecordDAL
    {
        private EntityControl control;

        public BDBaseDataRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBDBaseDataRecord(BDBaseDataRecord bDBaseDataRecord)
        {
            control.AddEntity(bDBaseDataRecord);
        }

        public void UpdateBDBaseDataRecord(BDBaseDataRecord bDBaseDataRecord, int ID)
        {
            control.UpdateEntity(bDBaseDataRecord, ID);
        }

        public void DeleteBDBaseDataRecord(BDBaseDataRecord bDBaseDataRecord)
        {
            control.DeleteEntity(bDBaseDataRecord);
        }

        public IList GetAllBDBaseDataRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}