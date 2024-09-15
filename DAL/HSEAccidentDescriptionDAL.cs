using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 事故描述
    /// </summary>
    public class HSEAccidentDescriptionDAL
    {
        private EntityControl control;

        public HSEAccidentDescriptionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEAccidentDescription(HSEAccidentDescription hSEAccidentDescription)
        {
            control.AddEntity(hSEAccidentDescription);
        }

        public void UpdateHSEAccidentDescription(HSEAccidentDescription hSEAccidentDescription, string Code)
        {
            control.UpdateEntity(hSEAccidentDescription, Code);
        }

        public void DeleteHSEAccidentDescription(HSEAccidentDescription hSEAccidentDescription)
        {
            control.DeleteEntity(hSEAccidentDescription);
        }

        public IList GetAllHSEAccidentDescriptions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}