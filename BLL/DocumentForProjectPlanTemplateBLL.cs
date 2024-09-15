using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DocumentForProjectPlanTemplateBLL
    {
        public void AddDocumentForProjectPlanTemplate(DocumentForProjectPlanTemplate documentForProjectPlanTemplate)
        {
            DocumentForProjectPlanTemplateDAL dal = new DocumentForProjectPlanTemplateDAL();
            dal.AddDocumentForProjectPlanTemplate(documentForProjectPlanTemplate);
        }

        public void UpdateDocumentForProjectPlanTemplate(DocumentForProjectPlanTemplate documentForProjectPlanTemplate, int DocID)
        {
            DocumentForProjectPlanTemplateDAL dal = new DocumentForProjectPlanTemplateDAL();
            dal.UpdateDocumentForProjectPlanTemplate(documentForProjectPlanTemplate, DocID);
        }

        public void DeleteDocumentForProjectPlanTemplate(DocumentForProjectPlanTemplate documentForProjectPlanTemplate)
        {
            DocumentForProjectPlanTemplateDAL dal = new DocumentForProjectPlanTemplateDAL();
            dal.DeleteDocumentForProjectPlanTemplate(documentForProjectPlanTemplate);
        }

        public IList GetAllDocumentForProjectPlanTemplates(string strHQL)
        {
            DocumentForProjectPlanTemplateDAL dal = new DocumentForProjectPlanTemplateDAL();
            return dal.GetAllDocumentForProjectPlanTemplates(strHQL);
        }
    }
}