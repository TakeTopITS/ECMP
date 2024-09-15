using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 收文登记表
    /// </summary>
    public class ProReceiptRegistrationBLL
    {
        public void AddProReceiptRegistration(ProReceiptRegistration proReceiptRegistration)
        {
            ProReceiptRegistrationDAL dal = new ProReceiptRegistrationDAL();
            dal.AddProReceiptRegistration(proReceiptRegistration);
        }

        public void UpdateProReceiptRegistration(ProReceiptRegistration proReceiptRegistration, int ID)
        {
            ProReceiptRegistrationDAL dal = new ProReceiptRegistrationDAL();
            dal.UpdateProReceiptRegistration(proReceiptRegistration, ID);
        }

        public void DeleteProReceiptRegistration(ProReceiptRegistration proReceiptRegistration)
        {
            ProReceiptRegistrationDAL dal = new ProReceiptRegistrationDAL();
            dal.DeleteProReceiptRegistration(proReceiptRegistration);
        }

        public IList GetAllProReceiptRegistrations(string strHQL)
        {
            ProReceiptRegistrationDAL dal = new ProReceiptRegistrationDAL();
            return dal.GetAllProReceiptRegistrations(strHQL);
        }
    }
}