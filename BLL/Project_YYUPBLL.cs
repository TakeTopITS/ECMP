using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class Project_YYUPBLL
    {
        public void AddProject_YYUP(Project_YYUP project_YYUP)
        {
            Project_YYUPDAL dal = new Project_YYUPDAL();
            dal.AddProject_YYUP(project_YYUP);
        }

        public void UpdateProject_YYUP(Project_YYUP project_YYUP, int ID)
        {
            Project_YYUPDAL dal = new Project_YYUPDAL();
            dal.UpdateProject_YYUP(project_YYUP, ID);
        }

        public void DeleteProject_YYUP(Project_YYUP project_YYUP)
        {
            Project_YYUPDAL dal = new Project_YYUPDAL();
            dal.DeleteProject_YYUP(project_YYUP);
        }

        public IList GetAllProject_YYUPs(string strHQL)
        {
            Project_YYUPDAL dal = new Project_YYUPDAL();
            return dal.GetAllProject_YYUPs(strHQL);
        }
    }
}