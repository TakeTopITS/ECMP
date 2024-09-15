using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDThicknessDAL
    {
        private EntityControl control;

        public GDThicknessDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDThickness(GDThickness gDThickness)
        {
            control.AddEntity(gDThickness);
        }

        public void UpdateGDThickness(GDThickness gDThickness, int ID)
        {
            control.UpdateEntity(gDThickness, ID);
        }

        public void DeleteGDThickness(GDThickness gDThickness)
        {
            control.DeleteEntity(gDThickness);
        }

        public IList GetAllGDThicknesss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}