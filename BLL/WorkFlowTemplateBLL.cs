using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WorkFlowTemplateBLL
    {
        public void AddWorkFlowTemplate(WorkFlowTemplate workFlowTemplate)
        {
            WorkFlowTemplateDAL dal = new WorkFlowTemplateDAL();
            dal.AddWorkFlowTemplate(workFlowTemplate);
        }

        public void UpdateWorkFlowTemplate(WorkFlowTemplate workFlowTemplate, string TemName)
        {
            WorkFlowTemplateDAL dal = new WorkFlowTemplateDAL();
            dal.UpdateWorkFlowTemplate(workFlowTemplate, TemName);
        }

        public void DeleteWorkFlowTemplate(WorkFlowTemplate workFlowTemplate)
        {
            WorkFlowTemplateDAL dal = new WorkFlowTemplateDAL();
            dal.DeleteWorkFlowTemplate(workFlowTemplate);
        }

        public IList GetAllWorkFlowTemplates(string strHQL)
        {
            WorkFlowTemplateDAL dal = new WorkFlowTemplateDAL();
            return dal.GetAllWorkFlowTemplates(strHQL);
        }
    }
}