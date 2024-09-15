using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 评标报告
    /// </summary>
    public class BMAssessBidReportBLL
    {
        public void AddBMAssessBidReport(BMAssessBidReport bMAssessBidReport)
        {
            BMAssessBidReportDAL dal = new BMAssessBidReportDAL();
            dal.AddBMAssessBidReport(bMAssessBidReport);
        }

        public void UpdateBMAssessBidReport(BMAssessBidReport bMAssessBidReport, int ID)
        {
            BMAssessBidReportDAL dal = new BMAssessBidReportDAL();
            dal.UpdateBMAssessBidReport(bMAssessBidReport, ID);
        }

        public void DeleteBMAssessBidReport(BMAssessBidReport bMAssessBidReport)
        {
            BMAssessBidReportDAL dal = new BMAssessBidReportDAL();
            dal.DeleteBMAssessBidReport(bMAssessBidReport);
        }

        public IList GetAllBMAssessBidReports(string strHQL)
        {
            BMAssessBidReportDAL dal = new BMAssessBidReportDAL();
            return dal.GetAllBMAssessBidReports(strHQL);
        }
    }
}