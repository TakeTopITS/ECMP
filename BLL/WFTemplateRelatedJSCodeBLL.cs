using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WFTemplateRelatedJSCodeBLL
    {
        public void AddWFTemplateRelatedJSCode(WFTemplateRelatedJSCode wfTemplateRelatedJSCode)
        {
            WFTemplateRelatedJSCodeDAL dal = new WFTemplateRelatedJSCodeDAL();
            dal.AddWFTemplateRelatedJSCode(wfTemplateRelatedJSCode);
        }

        public void UpdateWFTemplateRelatedJSCode(WFTemplateRelatedJSCode wfTemplateRelatedJSCode, int ID)
        {
            WFTemplateRelatedJSCodeDAL dal = new WFTemplateRelatedJSCodeDAL();
            dal.UpdateWFTemplateRelatedJSCode(wfTemplateRelatedJSCode, ID);
        }

        public void DeleteWFTemplateRelatedJSCode(WFTemplateRelatedJSCode wfTemplateRelatedJSCode)
        {
            WFTemplateRelatedJSCodeDAL dal = new WFTemplateRelatedJSCodeDAL();
            dal.DeleteWFTemplateRelatedJSCode(wfTemplateRelatedJSCode);
        }

        public IList GetAllWFTemplateRelatedJSCodes(string strHQL)
        {
            WFTemplateRelatedJSCodeDAL dal = new WFTemplateRelatedJSCodeDAL();
            return dal.GetAllWFTemplateRelatedJSCodes(strHQL);
        }
    }
}