using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectOutsourcInformat_YYUPBLL
    {
        public void AddProjectOutsourcInformat_YYUP(ProjectOutsourcInformat_YYUP projectOutsourcInformat_YYUP)
        {
            ProjectOutsourcInformat_YYUPDAL dal = new ProjectOutsourcInformat_YYUPDAL();
            dal.AddProjectOutsourcInformat_YYUP(projectOutsourcInformat_YYUP);
        }

        public void UpdateProjectOutsourcInformat_YYUP(ProjectOutsourcInformat_YYUP projectOutsourcInformat_YYUP, int ID)
        {
            ProjectOutsourcInformat_YYUPDAL dal = new ProjectOutsourcInformat_YYUPDAL();
            dal.UpdateProjectOutsourcInformat_YYUP(projectOutsourcInformat_YYUP, ID);
        }

        public void DeleteProjectOutsourcInformat_YYUP(ProjectOutsourcInformat_YYUP projectOutsourcInformat_YYUP)
        {
            ProjectOutsourcInformat_YYUPDAL dal = new ProjectOutsourcInformat_YYUPDAL();
            dal.DeleteProjectOutsourcInformat_YYUP(projectOutsourcInformat_YYUP);
        }

        public IList GetAllProjectOutsourcInformat_YYUPs(string strHQL)
        {
            ProjectOutsourcInformat_YYUPDAL dal = new ProjectOutsourcInformat_YYUPDAL();
            return dal.GetAllProjectOutsourcInformat_YYUPs(strHQL);
        }
    }
}