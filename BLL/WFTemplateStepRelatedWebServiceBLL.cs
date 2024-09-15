using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WFTemplateStepRelatedWebServiceBLL
    {
        public void AddWFTemplateStepRelatedWebService(WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService)
        {
            WFTemplateStepRelatedWebServiceDAL dal = new WFTemplateStepRelatedWebServiceDAL();
            dal.AddWFTemplateStepRelatedWebService(wFTemplateStepRelatedWebService);
        }

        public void UpdateWFTemplateStepRelatedWebService(WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService, int ID)
        {
            WFTemplateStepRelatedWebServiceDAL dal = new WFTemplateStepRelatedWebServiceDAL();
            dal.UpdateWFTemplateStepRelatedWebService(wFTemplateStepRelatedWebService, ID);
        }

        public void DeleteWFTemplateStepRelatedWebService(WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService)
        {
            WFTemplateStepRelatedWebServiceDAL dal = new WFTemplateStepRelatedWebServiceDAL();
            dal.DeleteWFTemplateStepRelatedWebService(wFTemplateStepRelatedWebService);
        }

        public IList GetAllWFTemplateStepRelatedWebServices(string strHQL)
        {
            WFTemplateStepRelatedWebServiceDAL dal = new WFTemplateStepRelatedWebServiceDAL();
            return dal.GetAllWFTemplateStepRelatedWebServices(strHQL);
        }
    }
}