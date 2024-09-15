using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectMemberStudentCostDAL
    {
        private EntityControl control;

        public ProjectMemberStudentCostDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberStudentCost(ProjectMemberStudentCost projectMemberStudentCost)
        {
            control.AddEntity(projectMemberStudentCost);
        }

        public void UpdateProjectMemberStudentCost(ProjectMemberStudentCost projectMemberStudentCost, int ID)
        {
            control.UpdateEntity(projectMemberStudentCost, ID);
        }

        public void DeleteProjectMemberStudentCost(ProjectMemberStudentCost projectMemberStudentCost)
        {
            control.DeleteEntity(projectMemberStudentCost);
        }

        public IList GetAllProjectMemberStudentCosts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}