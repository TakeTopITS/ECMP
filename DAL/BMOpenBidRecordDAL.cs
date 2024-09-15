using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 开标记录
    /// </summary>
    public class BMOpenBidRecordDAL
    {
        private EntityControl control;

        public BMOpenBidRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMOpenBidRecord(BMOpenBidRecord bMOpenBidRecord)
        {
            control.AddEntity(bMOpenBidRecord);
        }

        public void UpdateBMOpenBidRecord(BMOpenBidRecord bMOpenBidRecord, int ID)
        {
            control.UpdateEntity(bMOpenBidRecord, ID);
        }

        public void DeleteBMOpenBidRecord(BMOpenBidRecord bMOpenBidRecord)
        {
            control.DeleteEntity(bMOpenBidRecord);
        }

        public IList GetAllBMOpenBidRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}