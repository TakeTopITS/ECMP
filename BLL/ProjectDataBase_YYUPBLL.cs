using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectDataBase_YYUPBLL
    {
        public void AddProjectDataBase_YYUP(ProjectDataBase_YYUP projectDataBase_YYUP)
        {
            ProjectDataBase_YYUPDAL dal = new ProjectDataBase_YYUPDAL();
            dal.AddProjectDataBase_YYUP(projectDataBase_YYUP);
        }

        public void UpdateProjectDataBase_YYUP(ProjectDataBase_YYUP projectDataBase_YYUP, int ID)
        {
            ProjectDataBase_YYUPDAL dal = new ProjectDataBase_YYUPDAL();
            dal.UpdateProjectDataBase_YYUP(projectDataBase_YYUP, ID);
        }

        public void DeleteProjectDataBase_YYUP(ProjectDataBase_YYUP projectDataBase_YYUP)
        {
            ProjectDataBase_YYUPDAL dal = new ProjectDataBase_YYUPDAL();
            dal.DeleteProjectDataBase_YYUP(projectDataBase_YYUP);
        }

        public IList GetAllProjectDataBase_YYUPs(string strHQL)
        {
            ProjectDataBase_YYUPDAL dal = new ProjectDataBase_YYUPDAL();
            return dal.GetAllProjectDataBase_YYUPs(strHQL);
        }
    }
}