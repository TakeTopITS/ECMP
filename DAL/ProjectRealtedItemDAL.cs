using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectRelatedItemDAL
    {
        private EntityControl control;

        public ProjectRelatedItemDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectRelatedItem(ProjectRelatedItem projectRelatedItem)
        {
            control.AddEntity(projectRelatedItem);
        }

        public void UpdateProjectRelatedItem(ProjectRelatedItem projectRelatedItem, int ID)
        {
            control.UpdateEntity(projectRelatedItem, ID);
        }

        public void DeleteProjectRelatedItem(ProjectRelatedItem projectRelatedItem)
        {
            control.DeleteEntity(projectRelatedItem);
        }

        public IList GetAllProjectRelatedItems(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}