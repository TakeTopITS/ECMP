using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectOfferStandard_YYUPDAL
    {
        private EntityControl control;

        public ProjectOfferStandard_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectOfferStandard_YYUP(ProjectOfferStandard_YYUP projectOfferStandard_YYUP)
        {
            control.AddEntity(projectOfferStandard_YYUP);
        }

        public void UpdateProjectOfferStandard_YYUP(ProjectOfferStandard_YYUP projectOfferStandard_YYUP, int ID)
        {
            control.UpdateEntity(projectOfferStandard_YYUP, ID);
        }

        public void DeleteProjectOfferStandard_YYUP(ProjectOfferStandard_YYUP projectOfferStandard_YYUP)
        {
            control.DeleteEntity(projectOfferStandard_YYUP);
        }

        public IList GetAllProjectOfferStandard_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}