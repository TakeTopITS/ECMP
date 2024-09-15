using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectRelatedReqViewBLL
    {
        public void AddProjectRelatedReqView(ProjectRelatedReqView projectRelatedReqView)
        {
            ProjectRelatedReqViewDAL dal = new ProjectRelatedReqViewDAL();
            dal.AddProjectRelatedReqView(projectRelatedReqView);
        }

        public void UpdateProjectRelatedReqView(ProjectRelatedReqView projectRelatedReqView, int ReqID)
        {
            ProjectRelatedReqViewDAL dal = new ProjectRelatedReqViewDAL();
            dal.UpdateProjectRelatedReqView(projectRelatedReqView, ReqID);
        }

        public void DeleteProjectRelatedReqView(ProjectRelatedReqView projectRelatedReqView)
        {
            ProjectRelatedReqViewDAL dal = new ProjectRelatedReqViewDAL();
            dal.DeleteProjectRelatedReqView(projectRelatedReqView);
        }

        public IList GetAllProjectRelatedReqViews(string strHQL)
        {
            ProjectRelatedReqViewDAL dal = new ProjectRelatedReqViewDAL();
            return dal.GetAllProjectRelatedReqViews(strHQL);
        }
    }
}