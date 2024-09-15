using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 评标报告
    /// </summary>
    public class BMAssessBidReportDAL
    {
        private EntityControl control;

        public BMAssessBidReportDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMAssessBidReport(BMAssessBidReport bMAssessBidReport)
        {
            control.AddEntity(bMAssessBidReport);
        }

        public void UpdateBMAssessBidReport(BMAssessBidReport bMAssessBidReport, int ID)
        {
            control.UpdateEntity(bMAssessBidReport, ID);
        }

        public void DeleteBMAssessBidReport(BMAssessBidReport bMAssessBidReport)
        {
            control.DeleteEntity(bMAssessBidReport);
        }

        public IList GetAllBMAssessBidReports(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}