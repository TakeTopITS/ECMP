using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDPressureObjectDAL
    {
        private EntityControl control;

        public GDPressureObjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDPressureObject(GDPressureObject gDPressureObject)
        {
            control.AddEntity(gDPressureObject);
        }

        public void UpdateGDPressureObject(GDPressureObject gDPressureObject, int ID)
        {
            control.UpdateEntity(gDPressureObject, ID);
        }

        public void DeleteGDPressureObject(GDPressureObject gDPressureObject)
        {
            control.DeleteEntity(gDPressureObject);
        }

        public IList GetAllGDPressureObjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}