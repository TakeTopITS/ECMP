using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectOutsourcInformat_YYUPDAL
    {
        private EntityControl control;

        public ProjectOutsourcInformat_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectOutsourcInformat_YYUP(ProjectOutsourcInformat_YYUP projectOutsourcInformat_YYUP)
        {
            control.AddEntity(projectOutsourcInformat_YYUP);
        }

        public void UpdateProjectOutsourcInformat_YYUP(ProjectOutsourcInformat_YYUP projectOutsourcInformat_YYUP, int ID)
        {
            control.UpdateEntity(projectOutsourcInformat_YYUP, ID);
        }

        public void DeleteProjectOutsourcInformat_YYUP(ProjectOutsourcInformat_YYUP projectOutsourcInformat_YYUP)
        {
            control.DeleteEntity(projectOutsourcInformat_YYUP);
        }

        public IList GetAllProjectOutsourcInformat_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}