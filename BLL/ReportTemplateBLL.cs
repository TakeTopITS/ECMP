using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReportTemplateBLL
    {
        public void AddReportTemplate(ReportTemplate reportTemplate)
        {
            ReportTemplateDAL dal = new ReportTemplateDAL();
            dal.AddReportTemplate(reportTemplate);
        }

        public void UpdateReportTemplate(ReportTemplate reportTemplate, int ID)
        {
            ReportTemplateDAL dal = new ReportTemplateDAL();
            dal.UpdateReportTemplate(reportTemplate, ID);
        }

        public void DeleteReportTemplate(ReportTemplate reportTemplate)
        {
            ReportTemplateDAL dal = new ReportTemplateDAL();
            dal.DeleteReportTemplate(reportTemplate);
        }

        public IList GetAllReportTemplates(string strHQL)
        {
            ReportTemplateDAL dal = new ReportTemplateDAL();
            return dal.GetAllReportTemplates(strHQL);
        }
    }
}