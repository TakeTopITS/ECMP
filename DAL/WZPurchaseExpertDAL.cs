using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPurchaseExpertDAL
    {
        private EntityControl control;

        public WZPurchaseExpertDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPurchaseExpert(WZPurchaseExpert wZPurchaseExpert)
        {
            control.AddEntity(wZPurchaseExpert);
        }

        public void UpdateWZPurchaseExpert(WZPurchaseExpert wZPurchaseExpert, int ID)
        {
            control.UpdateEntity(wZPurchaseExpert, ID);
        }

        public void DeleteWZPurchaseExpert(WZPurchaseExpert wZPurchaseExpert)
        {
            control.DeleteEntity(wZPurchaseExpert);
        }

        public IList GetAllWZPurchaseExperts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}