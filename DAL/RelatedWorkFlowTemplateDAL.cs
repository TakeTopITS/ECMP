using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RelatedWorkFlowTemplateDAL
    {
        private EntityControl control;

        public RelatedWorkFlowTemplateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRelatedWorkFlowTemplate(RelatedWorkFlowTemplate relatedWorkFlowTemplate)
        {
            control.AddEntity(relatedWorkFlowTemplate);
        }

        public void UpdateRelatedWorkFlowTemplate(RelatedWorkFlowTemplate relatedWorkFlowTemplate, int ID)
        {
            control.UpdateEntity(relatedWorkFlowTemplate, ID);
        }

        public void DeleteRelatedWorkFlowTemplate(RelatedWorkFlowTemplate relatedWorkFlowTemplate)
        {
            control.DeleteEntity(relatedWorkFlowTemplate);
        }

        public IList GetAllRelatedWorkFlowTemplates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}