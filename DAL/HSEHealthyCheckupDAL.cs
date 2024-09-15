using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEHealthyCheckupDAL
    {
        private EntityControl control;

        public HSEHealthyCheckupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEHealthyCheckup(HSEHealthyCheckup hSEHealthyCheckup)
        {
            control.AddEntity(hSEHealthyCheckup);
        }

        public void UpdateHSEHealthyCheckup(HSEHealthyCheckup hSEHealthyCheckup, string Code)
        {
            control.UpdateEntity(hSEHealthyCheckup, Code);
        }

        public void DeleteHSEHealthyCheckup(HSEHealthyCheckup hSEHealthyCheckup)
        {
            control.DeleteEntity(hSEHealthyCheckup);
        }

        public IList GetAllHSEHealthyCheckups(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}