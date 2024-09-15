using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEEnvironmentalObjectivesBLL
    {
        public void AddHSEEnvironmentalObjectives(HSEEnvironmentalObjectives hSEEnvironmentalObjectives)
        {
            HSEEnvironmentalObjectivesDAL dal = new HSEEnvironmentalObjectivesDAL();
            dal.AddHSEEnvironmentalObjectives(hSEEnvironmentalObjectives);
        }

        public void UpdateHSEEnvironmentalObjectives(HSEEnvironmentalObjectives hSEEnvironmentalObjectives, string Code)
        {
            HSEEnvironmentalObjectivesDAL dal = new HSEEnvironmentalObjectivesDAL();
            dal.UpdateHSEEnvironmentalObjectives(hSEEnvironmentalObjectives, Code);
        }

        public void DeleteHSEEnvironmentalObjectives(HSEEnvironmentalObjectives hSEEnvironmentalObjectives)
        {
            HSEEnvironmentalObjectivesDAL dal = new HSEEnvironmentalObjectivesDAL();
            dal.DeleteHSEEnvironmentalObjectives(hSEEnvironmentalObjectives);
        }

        public IList GetAllHSEEnvironmentalObjectivess(string strHQL)
        {
            HSEEnvironmentalObjectivesDAL dal = new HSEEnvironmentalObjectivesDAL();
            return dal.GetAllHSEEnvironmentalObjectivess(strHQL);
        }
    }
}