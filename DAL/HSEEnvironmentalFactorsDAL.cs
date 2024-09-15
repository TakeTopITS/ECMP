using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEEnvironmentalFactorsDAL
    {
        private EntityControl control;

        public HSEEnvironmentalFactorsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEEnvironmentalFactors(HSEEnvironmentalFactors hSEEnvironmentalFactors)
        {
            control.AddEntity(hSEEnvironmentalFactors);
        }

        public void UpdateHSEEnvironmentalFactors(HSEEnvironmentalFactors hSEEnvironmentalFactors, string Code)
        {
            control.UpdateEntity(hSEEnvironmentalFactors, Code);
        }

        public void DeleteHSEEnvironmentalFactors(HSEEnvironmentalFactors hSEEnvironmentalFactors)
        {
            control.DeleteEntity(hSEEnvironmentalFactors);
        }

        public IList GetAllHSEEnvironmentalFactorss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}