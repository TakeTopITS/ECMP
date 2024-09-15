using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractGoodsReceiptRecordDAL
    {
        private EntityControl control;

        public ConstractGoodsReceiptRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractGoodsReceiptRecord(ConstractGoodsReceiptRecord constractGoodsReceiptRecord)
        {
            control.AddEntity(constractGoodsReceiptRecord);
        }

        public void UpdateConstractGoodsReceiptRecord(ConstractGoodsReceiptRecord constractGoodsReceiptRecord, int ID)
        {
            control.UpdateEntity(constractGoodsReceiptRecord, ID);
        }

        public void DeleteConstractGoodsReceiptRecord(ConstractGoodsReceiptRecord constractGoodsReceiptRecord)
        {
            control.DeleteEntity(constractGoodsReceiptRecord);
        }

        public IList GetAllConstractGoodsReceiptRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}