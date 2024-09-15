using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectPrimaveraBLL
    {
        public void AddProjectPrimavera(ProjectPrimavera projectPrimavera)
        {
            ProjectPrimaveraDAL dal = new ProjectPrimaveraDAL();
            dal.AddProjectPrimavera(projectPrimavera);
        }

        public void UpdateProjectPrimavera(ProjectPrimavera projectPrimavera, int ID)
        {
            ProjectPrimaveraDAL dal = new ProjectPrimaveraDAL();
            dal.UpdateProjectPrimavera(projectPrimavera, ID);
        }

        public void DeleteProjectPrimavera(ProjectPrimavera projectPrimavera)
        {
            ProjectPrimaveraDAL dal = new ProjectPrimaveraDAL();
            dal.DeleteProjectPrimavera(projectPrimavera);
        }

        public IList GetAllProjectPrimaveras(string strHQL)
        {
            ProjectPrimaveraDAL dal = new ProjectPrimaveraDAL();
            return dal.GetAllProjectPrimaveras(strHQL);
        }
    }
}