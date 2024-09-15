using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectTaskBLL
    {
        public void AddProjectTask(ProjectTask projectTask)
        {
            ProjectTaskDAL dal = new ProjectTaskDAL();
            dal.AddProjectTask(projectTask);
        }

        public void UpdateProjectTask(ProjectTask projectTask, int TaskID)
        {
            ProjectTaskDAL dal = new ProjectTaskDAL();
            dal.UpdateProjectTask(projectTask, TaskID);
        }

        public void DeleteProjectTask(ProjectTask projectTask)
        {
            ProjectTaskDAL dal = new ProjectTaskDAL();
            dal.DeleteProjectTask(projectTask);
        }

        public IList GetAllProjectTasks(string strHQL)
        {
            ProjectTaskDAL dal = new ProjectTaskDAL();
            return dal.GetAllProjectTasks(strHQL);
        }
    }
}