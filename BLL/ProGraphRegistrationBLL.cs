using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 收图登记表
    /// </summary>
    public class ProGraphRegistrationBLL
    {
        public void AddProGraphRegistration(ProGraphRegistration proGraphRegistration)
        {
            ProGraphRegistrationDAL dal = new ProGraphRegistrationDAL();
            dal.AddProGraphRegistration(proGraphRegistration);
        }

        public void UpdateProGraphRegistration(ProGraphRegistration proGraphRegistration, int ID)
        {
            ProGraphRegistrationDAL dal = new ProGraphRegistrationDAL();
            dal.UpdateProGraphRegistration(proGraphRegistration, ID);
        }

        public void DeleteProGraphRegistration(ProGraphRegistration proGraphRegistration)
        {
            ProGraphRegistrationDAL dal = new ProGraphRegistrationDAL();
            dal.DeleteProGraphRegistration(proGraphRegistration);
        }

        public IList GetAllProGraphRegistrations(string strHQL)
        {
            ProGraphRegistrationDAL dal = new ProGraphRegistrationDAL();
            return dal.GetAllProGraphRegistrations(strHQL);
        }
    }
}