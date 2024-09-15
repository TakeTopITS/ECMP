using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDLineWeldDAL
    {
        private EntityControl control;

        public GDLineWeldDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDLineWeld(GDLineWeld gDLineWeld)
        {
            control.AddEntity(gDLineWeld);
        }

        public void UpdateGDLineWeld(GDLineWeld gDLineWeld, int ID)
        {
            control.UpdateEntity(gDLineWeld, ID);
        }

        public void DeleteGDLineWeld(GDLineWeld gDLineWeld)
        {
            control.DeleteEntity(gDLineWeld);
        }

        public IList GetAllGDLineWelds(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}