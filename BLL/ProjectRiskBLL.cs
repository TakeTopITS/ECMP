using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectRiskBLL
    {
        public void AddProjectRisk(ProjectRisk projectRisk)
        {
            ProjectRiskDAL dal = new ProjectRiskDAL();
            dal.AddProjectRisk(projectRisk);
        }

        public void UpdateProjectRisk(ProjectRisk projectRisk, int ID)
        {
            ProjectRiskDAL dal = new ProjectRiskDAL();
            dal.UpdateProjectRisk(projectRisk, ID);
        }

        public void DeleteProjectRisk(ProjectRisk projectRisk)
        {
            ProjectRiskDAL dal = new ProjectRiskDAL();
            dal.DeleteProjectRisk(projectRisk);
        }

        public IList GetAllProjectRisks(string strHQL)
        {
            ProjectRiskDAL dal = new ProjectRiskDAL();
            return dal.GetAllProjectRisks(strHQL);
        }
    }
}