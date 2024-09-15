using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 收文登记表
    /// </summary>
    public class ProReceiptRegistrationDAL
    {
        private EntityControl control;

        public ProReceiptRegistrationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProReceiptRegistration(ProReceiptRegistration proReceiptRegistration)
        {
            control.AddEntity(proReceiptRegistration);
        }

        public void UpdateProReceiptRegistration(ProReceiptRegistration proReceiptRegistration, int ID)
        {
            control.UpdateEntity(proReceiptRegistration, ID);
        }

        public void DeleteProReceiptRegistration(ProReceiptRegistration proReceiptRegistration)
        {
            control.DeleteEntity(proReceiptRegistration);
        }

        public IList GetAllProReceiptRegistrations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}