using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class BusinessFormReAndPayDAL
    {
        private EntityControl control;

        public BusinessFormReAndPayDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBusinessFormReAndPay(BusinessFormReAndPay businessFormReAndPay)
        {
            control.AddEntity(businessFormReAndPay);
        }

        public void UpdateBusinessFormReAndPay(BusinessFormReAndPay businessFormReAndPay, string FormCode)
        {
            control.UpdateEntity(businessFormReAndPay, FormCode);
        }

        public void DeleteBusinessFormReAndPay(BusinessFormReAndPay businessFormReAndPay)
        {
            control.DeleteEntity(businessFormReAndPay);
        }

        public IList GetAllBusinessFormReAndPays(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}