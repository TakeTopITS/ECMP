using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDWPSCodeDAL
    {
        private EntityControl control;

        public GDWPSCodeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDWPSCode(GDWPSCode gDWPSCode)
        {
            control.AddEntity(gDWPSCode);
        }

        public void UpdateGDWPSCode(GDWPSCode gDWPSCode, string strWPSNo)
        {
            control.UpdateEntity(gDWPSCode, strWPSNo);
        }

        public void DeleteGDWPSCode(GDWPSCode gDWPSCode)
        {
            control.DeleteEntity(gDWPSCode);
        }

        public IList GetAllGDWPSCodes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}