using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseDetailDAL
    {
        private EntityControl control;

        public WZPurchaseDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseDetail(WZPurchaseDetail wZPurchaseDetail)
        {
            control.AddEntity(wZPurchaseDetail);
        }

        public void UpdateWZPurchaseDetail(WZPurchaseDetail wZPurchaseDetail, int ID)
        {
            control.UpdateEntity(wZPurchaseDetail, ID);
        }

        public void DeleteWZPurchaseDetail(WZPurchaseDetail wZPurchaseDetail)
        {
            control.DeleteEntity(wZPurchaseDetail);
        }

        public IList GetAllWZPurchaseDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}