using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectRelatedDefectViewDAL
    {
        private EntityControl control;

        public ProjectRelatedDefectViewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectRelatedDefectView(ProjectRelatedDefectView projectRelatedDefectView)
        {
            control.AddEntity(projectRelatedDefectView);
        }

        public void UpdateProjectRelatedDefectView(ProjectRelatedDefectView projectRelatedDefectView, int DefectID)
        {
            control.UpdateEntity(projectRelatedDefectView, DefectID);
        }

        public void DeleteProjectRelatedDefectView(ProjectRelatedDefectView projectRelatedDefectView)
        {
            control.DeleteEntity(projectRelatedDefectView);
        }

        public IList GetAllProjectRelatedDefectViews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}