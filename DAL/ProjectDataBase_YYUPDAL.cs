using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectDataBase_YYUPDAL
    {
        private EntityControl control;

        public ProjectDataBase_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectDataBase_YYUP(ProjectDataBase_YYUP projectDataBase_YYUP)
        {
            control.AddEntity(projectDataBase_YYUP);
        }

        public void UpdateProjectDataBase_YYUP(ProjectDataBase_YYUP projectDataBase_YYUP, int ID)
        {
            control.UpdateEntity(projectDataBase_YYUP, ID);
        }

        public void DeleteProjectDataBase_YYUP(ProjectDataBase_YYUP projectDataBase_YYUP)
        {
            control.DeleteEntity(projectDataBase_YYUP);
        }

        public IList GetAllProjectDataBase_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}