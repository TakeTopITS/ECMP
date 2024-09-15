using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReportTypeBLL
    {
        public void AddReportType(ReportType reportType)
        {
            ReportTypeDAL dal = new ReportTypeDAL();
            dal.AddReportType(reportType);
        }

        public void UpdateReportType(ReportType reportType, string Type)
        {
            ReportTypeDAL dal = new ReportTypeDAL();
            dal.UpdateReportType(reportType, Type);
        }

        public void DeleteReportType(ReportType reportType)
        {
            ReportTypeDAL dal = new ReportTypeDAL();
            dal.DeleteReportType(reportType);
        }

        public IList GetAllReportTypes(string strHQL)
        {
            ReportTypeDAL dal = new ReportTypeDAL();
            return dal.GetAllReportTypes(strHQL);
        }
    }
}