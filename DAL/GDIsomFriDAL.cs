using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDIsomFriDAL
    {
        private EntityControl control;

        public GDIsomFriDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDIsomFri(GDIsomFri gDIsomFri)
        {
            control.AddEntity(gDIsomFri);
        }

        public void UpdateGDIsomFri(GDIsomFri gDIsomFri, int ID)
        {
            control.UpdateEntity(gDIsomFri, ID);
        }

        public void DeleteGDIsomFri(GDIsomFri gDIsomFri)
        {
            control.DeleteEntity(gDIsomFri);
        }

        public IList GetAllGDGDIsomFris(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}