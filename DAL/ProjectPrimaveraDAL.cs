using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectPrimaveraDAL
    {
        private EntityControl control;

        public ProjectPrimaveraDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectPrimavera(ProjectPrimavera projectPrimavera)
        {
            control.AddEntity(projectPrimavera);
        }

        public void UpdateProjectPrimavera(ProjectPrimavera projectPrimavera, int ID)
        {
            control.UpdateEntity(projectPrimavera, ID);
        }

        public void DeleteProjectPrimavera(ProjectPrimavera projectPrimavera)
        {
            control.DeleteEntity(projectPrimavera);
        }

        public IList GetAllProjectPrimaveras(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}