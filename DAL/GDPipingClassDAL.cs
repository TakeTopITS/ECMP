using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDPipingClassDAL
    {
        private EntityControl control;

        public GDPipingClassDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDPipingClass(GDPipingClass gDPipingClass)
        {
            control.AddEntity(gDPipingClass);
        }

        public void UpdateGDPipingClass(GDPipingClass gDPipingClass, int ID)
        {
            control.UpdateEntity(gDPipingClass, ID);
        }

        public void DeleteGDPipingClass(GDPipingClass gDPipingClass)
        {
            control.DeleteEntity(gDPipingClass);
        }

        public IList GetAllGDPipingClasss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}