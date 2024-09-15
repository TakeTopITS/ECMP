using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 评标记录
    /// </summary>
    public class BMAssessBidRecordDAL
    {
        private EntityControl control;

        public BMAssessBidRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMAssessBidRecord(BMAssessBidRecord bMAssessBidRecord)
        {
            control.AddEntity(bMAssessBidRecord);
        }

        public void UpdateBMAssessBidRecord(BMAssessBidRecord bMAssessBidRecord, int ID)
        {
            control.UpdateEntity(bMAssessBidRecord, ID);
        }

        public void DeleteBMAssessBidRecord(BMAssessBidRecord bMAssessBidRecord)
        {
            control.DeleteEntity(bMAssessBidRecord);
        }

        public IList GetAllBMAssessBidRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}