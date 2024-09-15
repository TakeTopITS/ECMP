using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 管板预焊接附加工艺评定报告
    /// </summary>
    public class WPQMWeldAddProReportDAL
    {
        private EntityControl control;

        public WPQMWeldAddProReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMWeldAddProReport(WPQMWeldAddProReport wPQMWeldAddProReport)
        {
            control.AddEntity(wPQMWeldAddProReport);
        }

        public void UpdateWPQMWeldAddProReport(WPQMWeldAddProReport wPQMWeldAddProReport, int ID)
        {
            control.UpdateEntity(wPQMWeldAddProReport, ID);
        }

        public void DeleteWPQMWeldAddProReport(WPQMWeldAddProReport wPQMWeldAddProReport)
        {
            control.DeleteEntity(wPQMWeldAddProReport);
        }

        public IList GetAllWPQMWeldAddProReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}