using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 发图登记表
    /// </summary>
    public class ProSendFigureRegistrationBLL
    {
        public void AddProSendFigureRegistration(ProSendFigureRegistration proSendFigureRegistration)
        {
            ProSendFigureRegistrationDAL dal = new ProSendFigureRegistrationDAL();
            dal.AddProSendFigureRegistration(proSendFigureRegistration);
        }

        public void UpdateProSendFigureRegistration(ProSendFigureRegistration proSendFigureRegistration, int ID)
        {
            ProSendFigureRegistrationDAL dal = new ProSendFigureRegistrationDAL();
            dal.UpdateProSendFigureRegistration(proSendFigureRegistration, ID);
        }

        public void DeleteProSendFigureRegistration(ProSendFigureRegistration proSendFigureRegistration)
        {
            ProSendFigureRegistrationDAL dal = new ProSendFigureRegistrationDAL();
            dal.DeleteProSendFigureRegistration(proSendFigureRegistration);
        }

        public IList GetAllProSendFigureRegistrations(string strHQL)
        {
            ProSendFigureRegistrationDAL dal = new ProSendFigureRegistrationDAL();
            return dal.GetAllProSendFigureRegistrations(strHQL);
        }
    }
}