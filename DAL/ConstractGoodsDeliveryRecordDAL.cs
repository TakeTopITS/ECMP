using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractGoodsDeliveryRecordDAL
    {
        private EntityControl control;

        public ConstractGoodsDeliveryRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractGoodsDeliveryRecord(ConstractGoodsDeliveryRecord constractGoodsDeliveryRecord)
        {
            control.AddEntity(constractGoodsDeliveryRecord);
        }

        public void UpdateConstractGoodsDeliveryRecord(ConstractGoodsDeliveryRecord constractGoodsDeliveryRecord, int ID)
        {
            control.UpdateEntity(constractGoodsDeliveryRecord, ID);
        }

        public void DeleteConstractGoodsDeliveryRecord(ConstractGoodsDeliveryRecord constractGoodsDeliveryRecord)
        {
            control.DeleteEntity(constractGoodsDeliveryRecord);
        }

        public IList GetAllConstractGoodsDeliveryRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}