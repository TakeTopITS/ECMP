using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RelatedWorkFlowTemplateBLL
    {
        public void AddRelatedWorkFlowTemplate(RelatedWorkFlowTemplate relatedWorkFlowTemplate)
        {
            RelatedWorkFlowTemplateDAL dal = new RelatedWorkFlowTemplateDAL();
            dal.AddRelatedWorkFlowTemplate(relatedWorkFlowTemplate);
        }

        public void UpdateRelatedWorkFlowTemplate(RelatedWorkFlowTemplate relatedWorkFlowTemplate, int ID)
        {
            RelatedWorkFlowTemplateDAL dal = new RelatedWorkFlowTemplateDAL();
            dal.UpdateRelatedWorkFlowTemplate(relatedWorkFlowTemplate, ID);
        }

        public void DeleteRelatedWorkFlowTemplate(RelatedWorkFlowTemplate relatedWorkFlowTemplate)
        {
            RelatedWorkFlowTemplateDAL dal = new RelatedWorkFlowTemplateDAL();
            dal.DeleteRelatedWorkFlowTemplate(relatedWorkFlowTemplate);
        }

        public IList GetAllRelatedWorkFlowTemplates(string strHQL)
        {
            RelatedWorkFlowTemplateDAL dal = new RelatedWorkFlowTemplateDAL();
            return dal.GetAllRelatedWorkFlowTemplates(strHQL);
        }
    }
}