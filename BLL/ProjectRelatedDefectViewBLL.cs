using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectRelatedDefectViewBLL
    {
        public void AddProjectRelatedDefectView(ProjectRelatedDefectView projectRelatedDefectView)
        {
            ProjectRelatedDefectViewDAL dal = new ProjectRelatedDefectViewDAL();
            dal.AddProjectRelatedDefectView(projectRelatedDefectView);
        }

        public void UpdateProjectRelatedDefectView(ProjectRelatedDefectView projectRelatedDefectView, int DefectID)
        {
            ProjectRelatedDefectViewDAL dal = new ProjectRelatedDefectViewDAL();
            dal.UpdateProjectRelatedDefectView(projectRelatedDefectView, DefectID);
        }

        public void DeleteProjectRelatedDefectView(ProjectRelatedDefectView projectRelatedDefectView)
        {
            ProjectRelatedDefectViewDAL dal = new ProjectRelatedDefectViewDAL();
            dal.DeleteProjectRelatedDefectView(projectRelatedDefectView);
        }

        public IList GetAllProjectRelatedDefectViews(string strHQL)
        {
            ProjectRelatedDefectViewDAL dal = new ProjectRelatedDefectViewDAL();
            return dal.GetAllProjectRelatedDefectViews(strHQL);
        }
    }
}