using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectProductLine_YYUPDAL
    {
        private EntityControl control;

        public ProjectProductLine_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectProductLine_YYUP(ProjectProductLine_YYUP projectProductLine_YYUP)
        {
            control.AddEntity(projectProductLine_YYUP);
        }

        public void UpdateProjectProductLine_YYUP(ProjectProductLine_YYUP projectProductLine_YYUP, int ID)
        {
            control.UpdateEntity(projectProductLine_YYUP, ID);
        }

        public void DeleteProjectProductLine_YYUP(ProjectProductLine_YYUP projectProductLine_YYUP)
        {
            control.DeleteEntity(projectProductLine_YYUP);
        }

        public IList GetAllProjectProductLine_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}