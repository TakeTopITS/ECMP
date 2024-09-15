using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectProduct_YYUPBLL
    {
        public void AddProjectProduct_YYUP(ProjectProduct_YYUP projectProduct_YYUP)
        {
            ProjectProduct_YYUPDAL dal = new ProjectProduct_YYUPDAL();
            dal.AddProjectProduct_YYUP(projectProduct_YYUP);
        }

        public void UpdateProjectProduct_YYUP(ProjectProduct_YYUP projectProduct_YYUP, int ID)
        {
            ProjectProduct_YYUPDAL dal = new ProjectProduct_YYUPDAL();
            dal.UpdateProjectProduct_YYUP(projectProduct_YYUP, ID);
        }

        public void DeleteProjectProduct_YYUP(ProjectProduct_YYUP projectProduct_YYUP)
        {
            ProjectProduct_YYUPDAL dal = new ProjectProduct_YYUPDAL();
            dal.DeleteProjectProduct_YYUP(projectProduct_YYUP);
        }

        public IList GetAllProjectProduct_YYUPs(string strHQL)
        {
            ProjectProduct_YYUPDAL dal = new ProjectProduct_YYUPDAL();
            return dal.GetAllProjectProduct_YYUPs(strHQL);
        }
    }
}