using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectPlan_YYUPBLL
    {
        public void AddProjectPlan_YYUP(ProjectPlan_YYUP projectPlan_YYUP)
        {
            ProjectPlan_YYUPDAL dal = new ProjectPlan_YYUPDAL();
            dal.AddProjectPlan_YYUP(projectPlan_YYUP);
        }

        public void UpdateProjectPlan_YYUP(ProjectPlan_YYUP projectPlan_YYUP, int ID)
        {
            ProjectPlan_YYUPDAL dal = new ProjectPlan_YYUPDAL();
            dal.UpdateProjectPlan_YYUP(projectPlan_YYUP, ID);
        }

        public void DeleteProjectPlan_YYUP(ProjectPlan_YYUP projectPlan_YYUP)
        {
            ProjectPlan_YYUPDAL dal = new ProjectPlan_YYUPDAL();
            dal.DeleteProjectPlan_YYUP(projectPlan_YYUP);
        }

        public IList GetAllProjectPlan_YYUPs(string strHQL)
        {
            ProjectPlan_YYUPDAL dal = new ProjectPlan_YYUPDAL();
            return dal.GetAllProjectPlan_YYUPs(strHQL);
        }
    }
}