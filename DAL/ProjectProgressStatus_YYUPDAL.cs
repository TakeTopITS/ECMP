using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectProgressStatus_YYUPDAL
    {
        private EntityControl control;

        public ProjectProgressStatus_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectProgressStatus_YYUP(ProjectProgressStatus_YYUP projectProgressStatus_YYUP)
        {
            control.AddEntity(projectProgressStatus_YYUP);
        }

        public void UpdateProjectProgressStatus_YYUP(ProjectProgressStatus_YYUP projectProgressStatus_YYUP, int ID)
        {
            control.UpdateEntity(projectProgressStatus_YYUP, ID);
        }

        public void DeleteProjectProgressStatus_YYUP(ProjectProgressStatus_YYUP projectProgressStatus_YYUP)
        {
            control.DeleteEntity(projectProgressStatus_YYUP);
        }

        public IList GetAllProjectProgressStatus_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}