using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectSalesProperty_YYUPDAL
    {
        private EntityControl control;

        public ProjectSalesProperty_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectSalesProperty_YYUP(ProjectSalesProperty_YYUP projectSalesProperty_YYUP)
        {
            control.AddEntity(projectSalesProperty_YYUP);
        }

        public void UpdateProjectSalesProperty_YYUP(ProjectSalesProperty_YYUP projectSalesProperty_YYUP, int ID)
        {
            control.UpdateEntity(projectSalesProperty_YYUP, ID);
        }

        public void DeleteProjectSalesProperty_YYUP(ProjectSalesProperty_YYUP projectSalesProperty_YYUP)
        {
            control.DeleteEntity(projectSalesProperty_YYUP);
        }

        public IList GetAllProjectSalesProperty_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}