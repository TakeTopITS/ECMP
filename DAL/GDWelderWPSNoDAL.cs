using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDWelderWPSNoDAL
    {
        private EntityControl control;

        public GDWelderWPSNoDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDWelderWPSNo(GDWelderWPSNo gDWelderWPSNo)
        {
            control.AddEntity(gDWelderWPSNo);
        }

        public void UpdateGDWelderWPSNo(GDWelderWPSNo gDWelderWPSNo, int ID)
        {
            control.UpdateEntity(gDWelderWPSNo, ID);
        }

        public void DeleteGDWelderWPSNo(GDWelderWPSNo gDWelderWPSNo)
        {
            control.DeleteEntity(gDWelderWPSNo);
        }

        public IList GetAllGDWelderWPSNos(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}