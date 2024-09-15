using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseDocumentDAL
    {
        private EntityControl control;

        public WZPurchaseDocumentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseDocument(WZPurchaseDocument wZPurchaseDocument)
        {
            control.AddEntity(wZPurchaseDocument);
        }

        public void UpdateWZPurchaseDocument(WZPurchaseDocument wZPurchaseDocument, int ID)
        {
            control.UpdateEntity(wZPurchaseDocument, ID);
        }

        public void DeleteWZPurchaseDocument(WZPurchaseDocument wZPurchaseDocument)
        {
            control.DeleteEntity(wZPurchaseDocument);
        }

        public IList GetAllWZPurchaseDocuments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}