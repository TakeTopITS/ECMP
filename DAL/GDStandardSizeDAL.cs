using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDStandardSizeDAL
    {
        private EntityControl control;

        public GDStandardSizeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDStandardSize(GDStandardSize gDStandardSize)
        {
            control.AddEntity(gDStandardSize);
        }

        public void UpdateGDStandardSize(GDStandardSize gDStandardSize, int ID)
        {
            control.UpdateEntity(gDStandardSize, ID);
        }

        public void DeleteGDStandardSize(GDStandardSize gDStandardSize)
        {
            control.DeleteEntity(gDStandardSize);
        }

        public IList GetAllGDStandardSizes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}