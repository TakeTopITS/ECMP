using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDRTNotQualifiedDAL
    {
        private EntityControl control;

        public GDRTNotQualifiedDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDRTNotQualified(GDRTNotQualified gDRTNotQualified)
        {
            control.AddEntity(gDRTNotQualified);
        }

        public void UpdateGDRTNotQualified(GDRTNotQualified gDRTNotQualified, int ID)
        {
            control.UpdateEntity(gDRTNotQualified, ID);
        }

        public void DeleteGDRTNotQualified(GDRTNotQualified gDRTNotQualified)
        {
            control.DeleteEntity(gDRTNotQualified);
        }

        public IList GetAllGDRTNotQualifieds(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}