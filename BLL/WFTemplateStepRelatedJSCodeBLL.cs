using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WFTemplateStepRelatedJSCodeBLL
    {
        public void AddWFTemplateStepRelatedJSCode(WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode)
        {
            WFTemplateStepRelatedJSCodeDAL dal = new WFTemplateStepRelatedJSCodeDAL();
            dal.AddWFTemplateStepRelatedJSCode(wFTemplateStepRelatedJSCode);
        }

        public void UpdateWFTemplateStepRelatedJSCode(WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode, int ID)
        {
            WFTemplateStepRelatedJSCodeDAL dal = new WFTemplateStepRelatedJSCodeDAL();
            dal.UpdateWFTemplateStepRelatedJSCode(wFTemplateStepRelatedJSCode, ID);
        }

        public void DeleteWFTemplateStepRelatedJSCode(WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode)
        {
            WFTemplateStepRelatedJSCodeDAL dal = new WFTemplateStepRelatedJSCodeDAL();
            dal.DeleteWFTemplateStepRelatedJSCode(wFTemplateStepRelatedJSCode);
        }

        public IList GetAllWFTemplateStepRelatedJSCodes(string strHQL)
        {
            WFTemplateStepRelatedJSCodeDAL dal = new WFTemplateStepRelatedJSCodeDAL();
            return dal.GetAllWFTemplateStepRelatedJSCodes(strHQL);
        }
    }
}