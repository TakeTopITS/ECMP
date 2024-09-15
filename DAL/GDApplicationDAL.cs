using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDApplicationDAL
    {
        private EntityControl control;

        public GDApplicationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDApplication(GDApplication gDApplication)
        {
            control.AddEntity(gDApplication);
        }

        public void UpdateGDApplication(GDApplication gDApplication, int ID)
        {
            control.UpdateEntity(gDApplication, ID);
        }

        public void DeleteGDApplication(GDApplication gDApplication)
        {
            control.DeleteEntity(gDApplication);
        }

        public IList GetAllGDApplications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}