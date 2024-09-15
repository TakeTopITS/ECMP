using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedProjectDAL
    {
        private EntityControl control;

        public ConstractRelatedProjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedProject(ConstractRelatedProject constractRelatedProject)
        {
            control.AddEntity(constractRelatedProject);
        }

        public void UpdateConstractRelatedProject(ConstractRelatedProject constractRelatedProject, int ID)
        {
            control.UpdateEntity(constractRelatedProject, ID);
        }

        public void DeleteConstractRelatedProject(ConstractRelatedProject constractRelatedProject)
        {
            control.DeleteEntity(constractRelatedProject);
        }

        public IList GetAllConstractRelatedProjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}