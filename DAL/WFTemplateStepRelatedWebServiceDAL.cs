using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WFTemplateStepRelatedWebServiceDAL
    {
        private EntityControl control;

        public WFTemplateStepRelatedWebServiceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWFTemplateStepRelatedWebService(WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService)
        {
            control.AddEntity(wFTemplateStepRelatedWebService);
        }

        public void UpdateWFTemplateStepRelatedWebService(WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService, int ID)
        {
            control.UpdateEntity(wFTemplateStepRelatedWebService, ID);
        }

        public void DeleteWFTemplateStepRelatedWebService(WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService)
        {
            control.DeleteEntity(wFTemplateStepRelatedWebService);
        }

        public IList GetAllWFTemplateStepRelatedWebServices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}