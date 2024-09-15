using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectPlan_YYUPDAL
    {
        private EntityControl control;

        public ProjectPlan_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectPlan_YYUP(ProjectPlan_YYUP projectPlan_YYUP)
        {
            control.AddEntity(projectPlan_YYUP);
        }

        public void UpdateProjectPlan_YYUP(ProjectPlan_YYUP projectPlan_YYUP, int ID)
        {
            control.UpdateEntity(projectPlan_YYUP, ID);
        }

        public void DeleteProjectPlan_YYUP(ProjectPlan_YYUP projectPlan_YYUP)
        {
            control.DeleteEntity(projectPlan_YYUP);
        }

        public IList GetAllProjectPlan_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}