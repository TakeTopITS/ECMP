using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseFileBLL
    {
        public void AddWZPurchaseFile(WZPurchaseFile wZPurchaseFile)
        {
            WZPurchaseFileDAL dal = new WZPurchaseFileDAL();
            dal.AddWZPurchaseFile(wZPurchaseFile);
        }

        public void UpdateWZPurchaseFile(WZPurchaseFile wZPurchaseFile, int ID)
        {
            WZPurchaseFileDAL dal = new WZPurchaseFileDAL();
            dal.UpdateWZPurchaseFile(wZPurchaseFile, ID);
        }

        public void DeleteWZPurchaseFile(WZPurchaseFile wZPurchaseFile)
        {
            WZPurchaseFileDAL dal = new WZPurchaseFileDAL();
            dal.DeleteWZPurchaseFile(wZPurchaseFile);
        }

        public IList GetAllWZPurchaseFiles(string strHQL)
        {
            WZPurchaseFileDAL dal = new WZPurchaseFileDAL();
            return dal.GetAllWZPurchaseFiles(strHQL);
        }
    }
}