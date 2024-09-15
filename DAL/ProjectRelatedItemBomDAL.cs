using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectRelatedItemBomDAL
    {
        private EntityControl control;

        public ProjectRelatedItemBomDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectRelatedItemBom(ProjectRelatedItemBom projectRelatedItemBom)
        {
            control.AddEntity(projectRelatedItemBom);
        }

        public void UpdateProjectRelatedItemBom(ProjectRelatedItemBom projectRelatedItemBom, int ID)
        {
            control.UpdateEntity(projectRelatedItemBom, ID);
        }

        public void DeleteProjectRelatedItemBom(ProjectRelatedItemBom projectRelatedItemBom)
        {
            control.DeleteEntity(projectRelatedItemBom);
        }

        public IList GetAllProjectRelatedItemBoms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}