using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEDiseasePreventionDAL
    {
        private EntityControl control;

        public HSEDiseasePreventionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEDiseasePrevention(HSEDiseasePrevention hSEDiseasePrevention)
        {
            control.AddEntity(hSEDiseasePrevention);
        }

        public void UpdateHSEDiseasePrevention(HSEDiseasePrevention hSEDiseasePrevention, string Code)
        {
            control.UpdateEntity(hSEDiseasePrevention, Code);
        }

        public void DeleteHSEDiseasePrevention(HSEDiseasePrevention hSEDiseasePrevention)
        {
            control.DeleteEntity(hSEDiseasePrevention);
        }

        public IList GetAllHSEDiseasePreventions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}