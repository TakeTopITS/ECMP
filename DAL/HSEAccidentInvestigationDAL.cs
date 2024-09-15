using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 事故调查报告
    /// </summary>
    public class HSEAccidentInvestigationDAL
    {
        private EntityControl control;

        public HSEAccidentInvestigationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEAccidentInvestigation(HSEAccidentInvestigation hSEAccidentInvestigation)
        {
            control.AddEntity(hSEAccidentInvestigation);
        }

        public void UpdateHSEAccidentInvestigation(HSEAccidentInvestigation hSEAccidentInvestigation, string Code)
        {
            control.UpdateEntity(hSEAccidentInvestigation, Code);
        }

        public void DeleteHSEAccidentInvestigation(HSEAccidentInvestigation hSEAccidentInvestigation)
        {
            control.DeleteEntity(hSEAccidentInvestigation);
        }

        public IList GetAllHSEAccidentInvestigations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}