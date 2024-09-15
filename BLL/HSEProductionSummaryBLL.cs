using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEProductionSummaryBLL
    {
        public void AddHSEProductionSummary(HSEProductionSummary hSEProductionSummary)
        {
            HSEProductionSummaryDAL dal = new HSEProductionSummaryDAL();
            dal.AddHSEProductionSummary(hSEProductionSummary);
        }

        public void UpdateHSEProductionSummary(HSEProductionSummary hSEProductionSummary, string Code)
        {
            HSEProductionSummaryDAL dal = new HSEProductionSummaryDAL();
            dal.UpdateHSEProductionSummary(hSEProductionSummary, Code);
        }

        public void DeleteHSEProductionSummary(HSEProductionSummary hSEProductionSummary)
        {
            HSEProductionSummaryDAL dal = new HSEProductionSummaryDAL();
            dal.DeleteHSEProductionSummary(hSEProductionSummary);
        }

        public IList GetAllHSEProductionSummarys(string strHQL)
        {
            HSEProductionSummaryDAL dal = new HSEProductionSummaryDAL();
            return dal.GetAllHSEProductionSummarys(strHQL);
        }
    }
}