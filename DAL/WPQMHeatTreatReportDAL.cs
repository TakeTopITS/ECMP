using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 热处理报告
    /// </summary>
    public class WPQMHeatTreatReportDAL
    {
        private EntityControl control;

        public WPQMHeatTreatReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMHeatTreatReport(WPQMHeatTreatReport wPQMHeatTreatReport)
        {
            control.AddEntity(wPQMHeatTreatReport);
        }

        public void UpdateWPQMHeatTreatReport(WPQMHeatTreatReport wPQMHeatTreatReport, int ID)
        {
            control.UpdateEntity(wPQMHeatTreatReport, ID);
        }

        public void DeleteWPQMHeatTreatReport(WPQMHeatTreatReport wPQMHeatTreatReport)
        {
            control.DeleteEntity(wPQMHeatTreatReport);
        }

        public IList GetAllWPQMHeatTreatReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}