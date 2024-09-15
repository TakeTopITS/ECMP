using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDNotDestroyDAL
    {
        private EntityControl control;

        public GDNotDestroyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDNotDestroy(GDNotDestroy gDNotDestroy)
        {
            control.AddEntity(gDNotDestroy);
        }

        public void UpdateGDNotDestroy(GDNotDestroy gDNotDestroy, int ID)
        {
            control.UpdateEntity(gDNotDestroy, ID);
        }

        public void DeleteGDNotDestroy(GDNotDestroy gDNotDestroy)
        {
            control.DeleteEntity(gDNotDestroy);
        }

        public IList GetAllGDNotDestroys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}