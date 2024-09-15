using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectOfferStandard_YYUPBLL
    {
        public void AddProjectOfferStandard_YYUP(ProjectOfferStandard_YYUP projectOfferStandard_YYUP)
        {
            ProjectOfferStandard_YYUPDAL dal = new ProjectOfferStandard_YYUPDAL();
            dal.AddProjectOfferStandard_YYUP(projectOfferStandard_YYUP);
        }

        public void UpdateProjectOfferStandard_YYUP(ProjectOfferStandard_YYUP projectOfferStandard_YYUP, int ID)
        {
            ProjectOfferStandard_YYUPDAL dal = new ProjectOfferStandard_YYUPDAL();
            dal.UpdateProjectOfferStandard_YYUP(projectOfferStandard_YYUP, ID);
        }

        public void DeleteProjectOfferStandard_YYUP(ProjectOfferStandard_YYUP projectOfferStandard_YYUP)
        {
            ProjectOfferStandard_YYUPDAL dal = new ProjectOfferStandard_YYUPDAL();
            dal.DeleteProjectOfferStandard_YYUP(projectOfferStandard_YYUP);
        }

        public IList GetAllProjectOfferStandard_YYUPs(string strHQL)
        {
            ProjectOfferStandard_YYUPDAL dal = new ProjectOfferStandard_YYUPDAL();
            return dal.GetAllProjectOfferStandard_YYUPs(strHQL);
        }
    }
}