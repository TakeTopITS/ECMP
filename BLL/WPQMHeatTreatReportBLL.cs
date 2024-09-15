using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 热处理报告
    /// </summary>
    public class WPQMHeatTreatReportBLL
    {
        public void AddWPQMHeatTreatReport(WPQMHeatTreatReport wPQMHeatTreatReport)
        {
            WPQMHeatTreatReportDAL dal = new WPQMHeatTreatReportDAL();
            dal.AddWPQMHeatTreatReport(wPQMHeatTreatReport);
        }

        public void UpdateWPQMHeatTreatReport(WPQMHeatTreatReport wPQMHeatTreatReport, int ID)
        {
            WPQMHeatTreatReportDAL dal = new WPQMHeatTreatReportDAL();
            dal.UpdateWPQMHeatTreatReport(wPQMHeatTreatReport, ID);
        }

        public void DeleteWPQMHeatTreatReport(WPQMHeatTreatReport wPQMHeatTreatReport)
        {
            WPQMHeatTreatReportDAL dal = new WPQMHeatTreatReportDAL();
            dal.DeleteWPQMHeatTreatReport(wPQMHeatTreatReport);
        }

        public IList GetAllWPQMHeatTreatReports(string strHQL)
        {
            WPQMHeatTreatReportDAL dal = new WPQMHeatTreatReportDAL();
            return dal.GetAllWPQMHeatTreatReports(strHQL);
        }
    }
}