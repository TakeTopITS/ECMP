using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseDetailBLL
    {
        public void AddWZPurchaseDetail(WZPurchaseDetail wZPurchaseDetail)
        {
            WZPurchaseDetailDAL dal = new WZPurchaseDetailDAL();
            dal.AddWZPurchaseDetail(wZPurchaseDetail);
        }

        public void UpdateWZPurchaseDetail(WZPurchaseDetail wZPurchaseDetail, int ID)
        {
            WZPurchaseDetailDAL dal = new WZPurchaseDetailDAL();
            dal.UpdateWZPurchaseDetail(wZPurchaseDetail, ID);
        }

        public void DeleteWZPurchaseDetail(WZPurchaseDetail wZPurchaseDetail)
        {
            WZPurchaseDetailDAL dal = new WZPurchaseDetailDAL();
            dal.DeleteWZPurchaseDetail(wZPurchaseDetail);
        }

        public IList GetAllWZPurchaseDetails(string strHQL)
        {
            WZPurchaseDetailDAL dal = new WZPurchaseDetailDAL();
            return dal.GetAllWZPurchaseDetails(strHQL);
        }
    }
}