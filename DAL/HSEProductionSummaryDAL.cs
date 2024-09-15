using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEProductionSummaryDAL
    {
        private EntityControl control;

        public HSEProductionSummaryDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEProductionSummary(HSEProductionSummary hSEProductionSummary)
        {
            control.AddEntity(hSEProductionSummary);
        }

        public void UpdateHSEProductionSummary(HSEProductionSummary hSEProductionSummary, string Code)
        {
            control.UpdateEntity(hSEProductionSummary, Code);
        }

        public void DeleteHSEProductionSummary(HSEProductionSummary hSEProductionSummary)
        {
            control.DeleteEntity(hSEProductionSummary);
        }

        public IList GetAllHSEProductionSummarys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}