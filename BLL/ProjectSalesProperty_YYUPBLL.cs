using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectSalesProperty_YYUPBLL
    {
        public void AddProjectSalesProperty_YYUP(ProjectSalesProperty_YYUP projectSalesProperty_YYUP)
        {
            ProjectSalesProperty_YYUPDAL dal = new ProjectSalesProperty_YYUPDAL();
            dal.AddProjectSalesProperty_YYUP(projectSalesProperty_YYUP);
        }

        public void UpdateProjectSalesProperty_YYUP(ProjectSalesProperty_YYUP projectSalesProperty_YYUP, int ID)
        {
            ProjectSalesProperty_YYUPDAL dal = new ProjectSalesProperty_YYUPDAL();
            dal.UpdateProjectSalesProperty_YYUP(projectSalesProperty_YYUP, ID);
        }

        public void DeleteProjectSalesProperty_YYUP(ProjectSalesProperty_YYUP projectSalesProperty_YYUP)
        {
            ProjectSalesProperty_YYUPDAL dal = new ProjectSalesProperty_YYUPDAL();
            dal.DeleteProjectSalesProperty_YYUP(projectSalesProperty_YYUP);
        }

        public IList GetAllProjectSalesProperty_YYUPs(string strHQL)
        {
            ProjectSalesProperty_YYUPDAL dal = new ProjectSalesProperty_YYUPDAL();
            return dal.GetAllProjectSalesProperty_YYUPs(strHQL);
        }
    }
}