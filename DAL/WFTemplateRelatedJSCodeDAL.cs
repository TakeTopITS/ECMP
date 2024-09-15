using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WFTemplateRelatedJSCodeDAL
    {
        private EntityControl control;

        public WFTemplateRelatedJSCodeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWFTemplateRelatedJSCode(WFTemplateRelatedJSCode wfTemplateRelatedJSCode)
        {
            control.AddEntity(wfTemplateRelatedJSCode);
        }

        public void UpdateWFTemplateRelatedJSCode(WFTemplateRelatedJSCode wfTemplateRelatedJSCode, int ID)
        {
            control.UpdateEntity(wfTemplateRelatedJSCode, ID);
        }

        public void DeleteWFTemplateRelatedJSCode(WFTemplateRelatedJSCode wfTemplateRelatedJSCode)
        {
            control.DeleteEntity(wfTemplateRelatedJSCode);
        }

        public IList GetAllWFTemplateRelatedJSCodes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}