using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 事故调查报告
    /// </summary>
    public class HSEAccidentInvestigationBLL
    {
        public void AddHSEAccidentInvestigation(HSEAccidentInvestigation hSEAccidentInvestigation)
        {
            HSEAccidentInvestigationDAL dal = new HSEAccidentInvestigationDAL();
            dal.AddHSEAccidentInvestigation(hSEAccidentInvestigation);
        }

        public void UpdateHSEAccidentInvestigation(HSEAccidentInvestigation hSEAccidentInvestigation, string Code)
        {
            HSEAccidentInvestigationDAL dal = new HSEAccidentInvestigationDAL();
            dal.UpdateHSEAccidentInvestigation(hSEAccidentInvestigation, Code);
        }

        public void DeleteHSEAccidentInvestigation(HSEAccidentInvestigation hSEAccidentInvestigation)
        {
            HSEAccidentInvestigationDAL dal = new HSEAccidentInvestigationDAL();
            dal.DeleteHSEAccidentInvestigation(hSEAccidentInvestigation);
        }

        public IList GetAllHSEAccidentInvestigations(string strHQL)
        {
            HSEAccidentInvestigationDAL dal = new HSEAccidentInvestigationDAL();
            return dal.GetAllHSEAccidentInvestigations(strHQL);
        }
    }
}