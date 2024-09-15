using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectProgressStatus_YYUPBLL
    {
        public void AddProjectProgressStatus_YYUP(ProjectProgressStatus_YYUP projectProgressStatus_YYUP)
        {
            ProjectProgressStatus_YYUPDAL dal = new ProjectProgressStatus_YYUPDAL();
            dal.AddProjectProgressStatus_YYUP(projectProgressStatus_YYUP);
        }

        public void UpdateProjectProgressStatus_YYUP(ProjectProgressStatus_YYUP projectProgressStatus_YYUP, int ID)
        {
            ProjectProgressStatus_YYUPDAL dal = new ProjectProgressStatus_YYUPDAL();
            dal.UpdateProjectProgressStatus_YYUP(projectProgressStatus_YYUP, ID);
        }

        public void DeleteProjectProgressStatus_YYUP(ProjectProgressStatus_YYUP projectProgressStatus_YYUP)
        {
            ProjectProgressStatus_YYUPDAL dal = new ProjectProgressStatus_YYUPDAL();
            dal.DeleteProjectProgressStatus_YYUP(projectProgressStatus_YYUP);
        }

        public IList GetAllProjectProgressStatus_YYUPs(string strHQL)
        {
            ProjectProgressStatus_YYUPDAL dal = new ProjectProgressStatus_YYUPDAL();
            return dal.GetAllProjectProgressStatus_YYUPs(strHQL);
        }
    }
}