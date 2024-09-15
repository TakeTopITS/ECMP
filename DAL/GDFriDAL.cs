using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDFriDAL
    {
        private EntityControl control;

        public GDFriDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDFri(GDFri gDFri)
        {
            control.AddEntity(gDFri);
        }

        public void UpdateGDFri(GDFri gDFri, int ID)
        {
            control.UpdateEntity(gDFri, ID);
        }

        public void DeleteGDFri(GDFri gDFri)
        {
            control.DeleteEntity(gDFri);
        }

        public IList GetAllGDFris(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}