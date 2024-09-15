using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectWZDetailDAL
    {
        private EntityControl control;

        public ProjectWZDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectWZDetail(ProjectWZDetail projectWZDetail)
        {
            control.AddEntity(projectWZDetail);
        }

        public void UpdateProjectWZDetail(ProjectWZDetail projectWZDetail, int ID)
        {
            control.UpdateEntity(projectWZDetail, ID);
        }

        public void DeleteProjectWZDetail(ProjectWZDetail projectWZDetail)
        {
            control.DeleteEntity(projectWZDetail);
        }

        public IList GetAllProjectWZDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}