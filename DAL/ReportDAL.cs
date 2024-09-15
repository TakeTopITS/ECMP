using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReportDAL
    {
        private EntityControl control;

        public ReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReport(Report report)
        {
            control.AddEntity(report);
        }

        public void UpdateReport(Report report, int ID)
        {
            control.UpdateEntity(report, ID);
        }

        public void DeleteReport(Report report)
        {
            control.DeleteEntity(report);
        }

        public IList GetAllReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}