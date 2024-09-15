using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectSubordinateIndustry_YYUPDAL
    {
        private EntityControl control;

        public ProjectSubordinateIndustry_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectSubordinateIndustry_YYUP(ProjectSubordinateIndustry_YYUP projectSubordinateIndustry_YYUP)
        {
            control.AddEntity(projectSubordinateIndustry_YYUP);
        }

        public void UpdateProjectSubordinateIndustry_YYUP(ProjectSubordinateIndustry_YYUP projectSubordinateIndustry_YYUP, int ID)
        {
            control.UpdateEntity(projectSubordinateIndustry_YYUP, ID);
        }

        public void DeleteProjectSubordinateIndustry_YYUP(ProjectSubordinateIndustry_YYUP projectSubordinateIndustry_YYUP)
        {
            control.DeleteEntity(projectSubordinateIndustry_YYUP);
        }

        public IList GetAllProjectSubordinateIndustry_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}