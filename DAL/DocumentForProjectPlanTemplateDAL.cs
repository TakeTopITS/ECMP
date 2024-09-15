using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DocumentForProjectPlanTemplateDAL
    {
        private EntityControl control;

        public DocumentForProjectPlanTemplateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDocumentForProjectPlanTemplate(DocumentForProjectPlanTemplate documentForProjectPlanTemplate)
        {
            control.AddEntity(documentForProjectPlanTemplate);
        }

        public void UpdateDocumentForProjectPlanTemplate(DocumentForProjectPlanTemplate documentForProjectPlanTemplate, int DocID)
        {
            control.UpdateEntity(documentForProjectPlanTemplate, DocID);
        }

        public void DeleteDocumentForProjectPlanTemplate(DocumentForProjectPlanTemplate documentForProjectPlanTemplate)
        {
            control.DeleteEntity(documentForProjectPlanTemplate);
        }

        public IList GetAllDocumentForProjectPlanTemplates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}