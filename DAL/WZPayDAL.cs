using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZPayDAL
    {
        private EntityControl control;

        public WZPayDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZPay(WZPay wZPay)
        {
            control.AddEntity(wZPay);
        }

        public void UpdateWZPay(WZPay wZPay, string strPayID)
        {
            control.UpdateEntity(wZPay, strPayID);
        }

        public void DeleteWZPay(WZPay wZPay)
        {
            control.DeleteEntity(wZPay);
        }

        public IList GetAllWZPays(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}