using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 供应商投标历史记录
    /// </summary>
    public class BMSupplierBidRecordDAL
    {
        private EntityControl control;

        public BMSupplierBidRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierBidRecord(BMSupplierBidRecord bMSupplierBidRecord)
        {
            control.AddEntity(bMSupplierBidRecord);
        }

        public void UpdateBMSupplierBidRecord(BMSupplierBidRecord bMSupplierBidRecord, int ID)
        {
            control.UpdateEntity(bMSupplierBidRecord, ID);
        }

        public void DeleteBMSupplierBidRecord(BMSupplierBidRecord bMSupplierBidRecord)
        {
            control.DeleteEntity(bMSupplierBidRecord);
        }

        public IList GetAllBMSupplierBidRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}