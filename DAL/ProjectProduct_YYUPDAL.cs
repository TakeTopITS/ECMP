using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectProduct_YYUPDAL
    {
        private EntityControl control;

        public ProjectProduct_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectProduct_YYUP(ProjectProduct_YYUP projectProduct_YYUP)
        {
            control.AddEntity(projectProduct_YYUP);
        }

        public void UpdateProjectProduct_YYUP(ProjectProduct_YYUP projectProduct_YYUP, int ID)
        {
            control.UpdateEntity(projectProduct_YYUP, ID);
        }

        public void DeleteProjectProduct_YYUP(ProjectProduct_YYUP projectProduct_YYUP)
        {
            control.DeleteEntity(projectProduct_YYUP);
        }

        public IList GetAllProjectProduct_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}