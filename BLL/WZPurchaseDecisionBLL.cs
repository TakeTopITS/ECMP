using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZPurchaseDecisionBLL
    {
        public void AddWZPurchaseDecision(WZPurchaseDecision wZPurchaseDecision)
        {
            WZPurchaseDecisionDAL dal = new WZPurchaseDecisionDAL();
            dal.AddWZPurchaseDecision(wZPurchaseDecision);
        }

        public void UpdateWZPurchaseDecision(WZPurchaseDecision wZPurchaseDecision, int ID)
        {
            WZPurchaseDecisionDAL dal = new WZPurchaseDecisionDAL();
            dal.UpdateWZPurchaseDecision(wZPurchaseDecision, ID);
        }

        public void DeleteWZPurchaseDecision(WZPurchaseDecision wZPurchaseDecision)
        {
            WZPurchaseDecisionDAL dal = new WZPurchaseDecisionDAL();
            dal.DeleteWZPurchaseDecision(wZPurchaseDecision);
        }

        public IList GetAllWZPurchaseDecisions(string strHQL)
        {
            WZPurchaseDecisionDAL dal = new WZPurchaseDecisionDAL();
            return dal.GetAllWZPurchaseDecisions(strHQL);
        }
    }
}