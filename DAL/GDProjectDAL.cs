using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDProjectDAL
    {
        private EntityControl control;

        public GDProjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDProject(GDProject gDProject)
        {
            control.AddEntity(gDProject);
        }

        public void UpdateGDProject(GDProject gDProject, int ID)
        {
            control.UpdateEntity(gDProject, ID);
        }

        public void DeleteGDProject(GDProject gDProject)
        {
            control.DeleteEntity(gDProject);
        }

        public IList GetAllGDProjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}