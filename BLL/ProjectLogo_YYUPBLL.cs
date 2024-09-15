using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectLogo_YYUPBLL
    {
        public void AddProjectLogo_YYUP(ProjectLogo_YYUP projectLogo_YYUP)
        {
            ProjectLogo_YYUPDAL dal = new ProjectLogo_YYUPDAL();
            dal.AddProjectLogo_YYUP(projectLogo_YYUP);
        }

        public void UpdateProjectLogo_YYUP(ProjectLogo_YYUP projectLogo_YYUP, int ID)
        {
            ProjectLogo_YYUPDAL dal = new ProjectLogo_YYUPDAL();
            dal.UpdateProjectLogo_YYUP(projectLogo_YYUP, ID);
        }

        public void DeleteProjectLogo_YYUP(ProjectLogo_YYUP projectLogo_YYUP)
        {
            ProjectLogo_YYUPDAL dal = new ProjectLogo_YYUPDAL();
            dal.DeleteProjectLogo_YYUP(projectLogo_YYUP);
        }

        public IList GetAllProjectLogo_YYUPs(string strHQL)
        {
            ProjectLogo_YYUPDAL dal = new ProjectLogo_YYUPDAL();
            return dal.GetAllProjectLogo_YYUPs(strHQL);
        }
    }
}