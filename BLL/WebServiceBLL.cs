using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WebServiceBLL
    {
        public void AddWebService(WebService webService)
        {
            WebServiceDAL dal = new WebServiceDAL();
            dal.AddWebService(webService);
        }

        public void UpdateWebService(WebService webService, int ID)
        {
            WebServiceDAL dal = new WebServiceDAL();
            dal.UpdateWebService(webService, ID);
        }

        public void DeleteWebService(WebService webService)
        {
            WebServiceDAL dal = new WebServiceDAL();
            dal.DeleteWebService(webService);
        }

        public IList GetAllWebServices(string strHQL)
        {
            WebServiceDAL dal = new WebServiceDAL();
            return dal.GetAllWebServices(strHQL);
        }
    }
}