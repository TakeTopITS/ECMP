using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class Project_YYUPDAL
    {
        private EntityControl control;

        public Project_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProject_YYUP(Project_YYUP project_YYUP)
        {
            control.AddEntity(project_YYUP);
        }

        public void UpdateProject_YYUP(Project_YYUP project_YYUP, int ID)
        {
            control.UpdateEntity(project_YYUP, ID);
        }

        public void DeleteProject_YYUP(Project_YYUP project_YYUP)
        {
            control.DeleteEntity(project_YYUP);
        }

        public IList GetAllProject_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}