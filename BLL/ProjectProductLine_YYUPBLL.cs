using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectProductLine_YYUPBLL
    {
        public void AddProjectProductLine_YYUP(ProjectProductLine_YYUP projectProductLine_YYUP)
        {
            ProjectProductLine_YYUPDAL dal = new ProjectProductLine_YYUPDAL();
            dal.AddProjectProductLine_YYUP(projectProductLine_YYUP);
        }

        public void UpdateProjectProductLine_YYUP(ProjectProductLine_YYUP projectProductLine_YYUP, int ID)
        {
            ProjectProductLine_YYUPDAL dal = new ProjectProductLine_YYUPDAL();
            dal.UpdateProjectProductLine_YYUP(projectProductLine_YYUP, ID);
        }

        public void DeleteProjectProductLine_YYUP(ProjectProductLine_YYUP projectProductLine_YYUP)
        {
            ProjectProductLine_YYUPDAL dal = new ProjectProductLine_YYUPDAL();
            dal.DeleteProjectProductLine_YYUP(projectProductLine_YYUP);
        }

        public IList GetAllProjectProductLine_YYUPs(string strHQL)
        {
            ProjectProductLine_YYUPDAL dal = new ProjectProductLine_YYUPDAL();
            return dal.GetAllProjectProductLine_YYUPs(strHQL);
        }
    }
}