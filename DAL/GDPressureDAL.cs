using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDPressureDAL
    {
        private EntityControl control;

        public GDPressureDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDPressure(GDPressure gDPressure)
        {
            control.AddEntity(gDPressure);
        }

        public void UpdateGDPressure(GDPressure gDPressure, string strPressureCode)
        {
            control.UpdateEntity(gDPressure, strPressureCode);
        }

        public void DeleteGDPressure(GDPressure gDPressure)
        {
            control.DeleteEntity(gDPressure);
        }

        public IList GetAllGDPressures(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}