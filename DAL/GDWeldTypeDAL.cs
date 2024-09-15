using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDWeldTypeDAL
    {
        private EntityControl control;

        public GDWeldTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDWeldType(GDWeldType gDWeldType)
        {
            control.AddEntity(gDWeldType);
        }

        public void UpdateGDWeldType(GDWeldType gDWeldType, int ID)
        {
            control.UpdateEntity(gDWeldType, ID);
        }

        public void DeleteGDWeldType(GDWeldType gDWeldType)
        {
            control.DeleteEntity(gDWeldType);
        }

        public IList GetAllGDWeldTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}