using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WorkFlowTemplateDAL
    {
        private EntityControl control;

        public WorkFlowTemplateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWorkFlowTemplate(WorkFlowTemplate workFlowTemplate)
        {
            control.AddEntity(workFlowTemplate);
        }

        public void UpdateWorkFlowTemplate(WorkFlowTemplate workFlowTemplate, string TemName)
        {
            control.UpdateEntity(workFlowTemplate, TemName);
        }

        public void DeleteWorkFlowTemplate(WorkFlowTemplate workFlowTemplate)
        {
            control.DeleteEntity(workFlowTemplate);
        }

        public IList GetAllWorkFlowTemplates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}