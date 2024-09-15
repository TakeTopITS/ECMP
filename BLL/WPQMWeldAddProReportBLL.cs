using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 管板预焊接附加工艺评定报告
    /// </summary>
    public class WPQMWeldAddProReportBLL
    {
        public void AddWPQMWeldAddProReport(WPQMWeldAddProReport wPQMWeldAddProReport)
        {
            WPQMWeldAddProReportDAL dal = new WPQMWeldAddProReportDAL();
            dal.AddWPQMWeldAddProReport(wPQMWeldAddProReport);
        }

        public void UpdateWPQMWeldAddProReport(WPQMWeldAddProReport wPQMWeldAddProReport, int ID)
        {
            WPQMWeldAddProReportDAL dal = new WPQMWeldAddProReportDAL();
            dal.UpdateWPQMWeldAddProReport(wPQMWeldAddProReport, ID);
        }

        public void DeleteWPQMWeldAddProReport(WPQMWeldAddProReport wPQMWeldAddProReport)
        {
            WPQMWeldAddProReportDAL dal = new WPQMWeldAddProReportDAL();
            dal.DeleteWPQMWeldAddProReport(wPQMWeldAddProReport);
        }

        public IList GetAllWPQMWeldAddProReports(string strHQL)
        {
            WPQMWeldAddProReportDAL dal = new WPQMWeldAddProReportDAL();
            return dal.GetAllWPQMWeldAddProReports(strHQL);
        }
    }
}