using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectSubordinateIndustry_YYUPBLL
    {
        public void AddProjectSubordinateIndustry_YYUP(ProjectSubordinateIndustry_YYUP projectSubordinateIndustry_YYUP)
        {
            ProjectSubordinateIndustry_YYUPDAL dal = new ProjectSubordinateIndustry_YYUPDAL();
            dal.AddProjectSubordinateIndustry_YYUP(projectSubordinateIndustry_YYUP);
        }

        public void UpdateProjectSubordinateIndustry_YYUP(ProjectSubordinateIndustry_YYUP projectSubordinateIndustry_YYUP, int ID)
        {
            ProjectSubordinateIndustry_YYUPDAL dal = new ProjectSubordinateIndustry_YYUPDAL();
            dal.UpdateProjectSubordinateIndustry_YYUP(projectSubordinateIndustry_YYUP, ID);
        }

        public void DeleteProjectSubordinateIndustry_YYUP(ProjectSubordinateIndustry_YYUP projectSubordinateIndustry_YYUP)
        {
            ProjectSubordinateIndustry_YYUPDAL dal = new ProjectSubordinateIndustry_YYUPDAL();
            dal.DeleteProjectSubordinateIndustry_YYUP(projectSubordinateIndustry_YYUP);
        }

        public IList GetAllProjectSubordinateIndustry_YYUPs(string strHQL)
        {
            ProjectSubordinateIndustry_YYUPDAL dal = new ProjectSubordinateIndustry_YYUPDAL();
            return dal.GetAllProjectSubordinateIndustry_YYUPs(strHQL);
        }
    }
}