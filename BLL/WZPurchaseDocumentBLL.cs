using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseDocumentBLL
    {
        public void AddWZPurchaseDocument(WZPurchaseDocument wZPurchaseDocument)
        {
            WZPurchaseDocumentDAL dal = new WZPurchaseDocumentDAL();
            dal.AddWZPurchaseDocument(wZPurchaseDocument);
        }

        public void UpdateWZPurchaseDocument(WZPurchaseDocument wZPurchaseDocument, int ID)
        {
            WZPurchaseDocumentDAL dal = new WZPurchaseDocumentDAL();
            dal.UpdateWZPurchaseDocument(wZPurchaseDocument, ID);
        }

        public void DeleteWZPurchaseDocument(WZPurchaseDocument wZPurchaseDocument)
        {
            WZPurchaseDocumentDAL dal = new WZPurchaseDocumentDAL();
            dal.DeleteWZPurchaseDocument(wZPurchaseDocument);
        }

        public IList GetAllWZPurchaseDocuments(string strHQL)
        {
            WZPurchaseDocumentDAL dal = new WZPurchaseDocumentDAL();
            return dal.GetAllWZPurchaseDocuments(strHQL);
        }
    }
}