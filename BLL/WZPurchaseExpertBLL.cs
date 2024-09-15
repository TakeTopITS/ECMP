using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseExpertBLL
    {
        public void AddWZPurchaseExpert(WZPurchaseExpert wZPurchaseExpert)
        {
            WZPurchaseExpertDAL dal = new WZPurchaseExpertDAL();
            dal.AddWZPurchaseExpert(wZPurchaseExpert);
        }

        public void UpdateWZPurchaseExpert(WZPurchaseExpert wZPurchaseExpert, int ID)
        {
            WZPurchaseExpertDAL dal = new WZPurchaseExpertDAL();
            dal.UpdateWZPurchaseExpert(wZPurchaseExpert, ID);
        }

        public void DeleteWZPurchaseExpert(WZPurchaseExpert wZPurchaseExpert)
        {
            WZPurchaseExpertDAL dal = new WZPurchaseExpertDAL();
            dal.DeleteWZPurchaseExpert(wZPurchaseExpert);
        }

        public IList GetAllWZPurchaseExperts(string strHQL)
        {
            WZPurchaseExpertDAL dal = new WZPurchaseExpertDAL();
            return dal.GetAllWZPurchaseExperts(strHQL);
        }
    }
}