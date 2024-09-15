using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDWeldersDAL
    {
        private EntityControl control;

        public GDWeldersDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDWelders(GDWelders gDWelders)
        {
            control.AddEntity(gDWelders);
        }

        public void UpdateGDWelders(GDWelders gDWelders, string strWelders)
        {
            control.UpdateEntity(gDWelders, strWelders);
        }

        public void DeleteGDWelders(GDWelders gDWelders)
        {
            control.DeleteEntity(gDWelders);
        }

        public IList GetAllGDWelderss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}