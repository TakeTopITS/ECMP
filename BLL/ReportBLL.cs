using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ReportBLL
    {
        public void AddReport(Report report)
        {
            ReportDAL dal = new ReportDAL();
            dal.AddReport(report);
        }

        public void UpdateReport(Report report, int ID)
        {
            ReportDAL dal = new ReportDAL();
            dal.UpdateReport(report, ID);
        }

        public void DeleteReport(Report report)
        {
            ReportDAL dal = new ReportDAL();
            dal.DeleteReport(report);
        }

        public IList GetAllReports(string strHQL)
        {
            ReportDAL dal = new ReportDAL();
            return dal.GetAllReports(strHQL);
        }
    }
}