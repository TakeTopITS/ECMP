using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEEnvironmentalObjectivesDAL
    {
        private EntityControl control;

        public HSEEnvironmentalObjectivesDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEEnvironmentalObjectives(HSEEnvironmentalObjectives hSEEnvironmentalObjectives)
        {
            control.AddEntity(hSEEnvironmentalObjectives);
        }

        public void UpdateHSEEnvironmentalObjectives(HSEEnvironmentalObjectives hSEEnvironmentalObjectives, string Code)
        {
            control.UpdateEntity(hSEEnvironmentalObjectives, Code);
        }

        public void DeleteHSEEnvironmentalObjectives(HSEEnvironmentalObjectives hSEEnvironmentalObjectives)
        {
            control.DeleteEntity(hSEEnvironmentalObjectives);
        }

        public IList GetAllHSEEnvironmentalObjectivess(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}