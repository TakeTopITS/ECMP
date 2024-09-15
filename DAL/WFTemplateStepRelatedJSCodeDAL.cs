using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WFTemplateStepRelatedJSCodeDAL
    {
        private EntityControl control;

        public WFTemplateStepRelatedJSCodeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWFTemplateStepRelatedJSCode(WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode)
        {
            control.AddEntity(wFTemplateStepRelatedJSCode);
        }

        public void UpdateWFTemplateStepRelatedJSCode(WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode, int ID)
        {
            control.UpdateEntity(wFTemplateStepRelatedJSCode, ID);
        }

        public void DeleteWFTemplateStepRelatedJSCode(WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode)
        {
            control.DeleteEntity(wFTemplateStepRelatedJSCode);
        }

        public IList GetAllWFTemplateStepRelatedJSCodes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}