using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReportTemplateDAL
    {
        private EntityControl control;

        public ReportTemplateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReportTemplate(ReportTemplate reportTemplate)
        {
            control.AddEntity(reportTemplate);
        }

        public void UpdateReportTemplate(ReportTemplate reportTemplate, int ID)
        {
            control.UpdateEntity(reportTemplate, ID);
        }

        public void DeleteReportTemplate(ReportTemplate reportTemplate)
        {
            control.DeleteEntity(reportTemplate);
        }

        public IList GetAllReportTemplates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}