using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectLogo_YYUPDAL
    {
        private EntityControl control;

        public ProjectLogo_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectLogo_YYUP(ProjectLogo_YYUP projectLogo_YYUP)
        {
            control.AddEntity(projectLogo_YYUP);
        }

        public void UpdateProjectLogo_YYUP(ProjectLogo_YYUP projectLogo_YYUP, int ID)
        {
            control.UpdateEntity(projectLogo_YYUP, ID);
        }

        public void DeleteProjectLogo_YYUP(ProjectLogo_YYUP projectLogo_YYUP)
        {
            control.DeleteEntity(projectLogo_YYUP);
        }

        public IList GetAllProjectLogo_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}