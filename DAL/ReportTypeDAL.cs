using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReportTypeDAL
    {
        private EntityControl control;

        public ReportTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReportType(ReportType reportType)
        {
            control.AddEntity(reportType);
        }

        public void UpdateReportType(ReportType reportType, string Type)
        {
            control.UpdateEntity(reportType, Type);
        }

        public void DeleteReportType(ReportType reportType)
        {
            control.DeleteEntity(reportType);
        }

        public IList GetAllReportTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}