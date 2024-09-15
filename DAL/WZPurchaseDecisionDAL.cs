using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseDecisionDAL
    {
        private EntityControl control;

        public WZPurchaseDecisionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseDecision(WZPurchaseDecision wZPurchaseDecision)
        {
            control.AddEntity(wZPurchaseDecision);
        }

        public void UpdateWZPurchaseDecision(WZPurchaseDecision wZPurchaseDecision, int ID)
        {
            control.UpdateEntity(wZPurchaseDecision, ID);
        }

        public void DeleteWZPurchaseDecision(WZPurchaseDecision wZPurchaseDecision)
        {
            control.DeleteEntity(wZPurchaseDecision);
        }

        public IList GetAllWZPurchaseDecisions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}