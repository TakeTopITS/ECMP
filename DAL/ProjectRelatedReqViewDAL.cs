using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectRelatedReqViewDAL
    {
        private EntityControl control;

        public ProjectRelatedReqViewDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectRelatedReqView(ProjectRelatedReqView projectRelatedReqView)
        {
            control.AddEntity(projectRelatedReqView);
        }

        public void UpdateProjectRelatedReqView(ProjectRelatedReqView projectRelatedReqView, int ReqID)
        {
            control.UpdateEntity(projectRelatedReqView, ReqID);
        }

        public void DeleteProjectRelatedReqView(ProjectRelatedReqView projectRelatedReqView)
        {
            control.DeleteEntity(projectRelatedReqView);
        }

        public IList GetAllProjectRelatedReqViews(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}