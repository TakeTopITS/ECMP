using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDTestMediumDAL
    {
        private EntityControl control;

        public GDTestMediumDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDTestMedium(GDTestMedium gDTestMedium)
        {
            control.AddEntity(gDTestMedium);
        }

        public void UpdateGDTestMedium(GDTestMedium gDTestMedium, int ID)
        {
            control.UpdateEntity(gDTestMedium, ID);
        }

        public void DeleteGDTestMedium(GDTestMedium gDTestMedium)
        {
            control.DeleteEntity(gDTestMedium);
        }

        public IList GetAllGDTestMediums(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}