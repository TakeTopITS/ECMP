using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDAreaDAL
    {
        private EntityControl control;

        public GDAreaDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDArea(GDArea gDArea)
        {
            control.AddEntity(gDArea);
        }

        public void UpdateGDArea(GDArea gDArea, int ID)
        {
            control.UpdateEntity(gDArea, ID);
        }

        public void DeleteGDArea(GDArea gDArea)
        {
            control.DeleteEntity(gDArea);
        }

        public IList GetAllGDAreas(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}