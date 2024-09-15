using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDSystemDAL
    {
        private EntityControl control;

        public GDSystemDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDSystem(GDSystem gDSystem)
        {
            control.AddEntity(gDSystem);
        }

        public void UpdateGDSystem(GDSystem gDSystem, int ID)
        {
            control.UpdateEntity(gDSystem, ID);
        }

        public void DeleteGDSystem(GDSystem gDSystem)
        {
            control.DeleteEntity(gDSystem);
        }

        public IList GetAllGDSystems(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}