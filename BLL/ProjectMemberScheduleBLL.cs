using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 项目成员任务安排
    /// </summary>
    public class ProjectMemberScheduleBLL
    {
        public void AddProjectMemberSchedule(ProjectMemberSchedule projectMemberSchedule)
        {
            ProjectMemberScheduleDAL dal = new ProjectMemberScheduleDAL();
            dal.AddProjectMemberSchedule(projectMemberSchedule);
        }

        public void UpdateProjectMemberSchedule(ProjectMemberSchedule projectMemberSchedule, int ID)
        {
            ProjectMemberScheduleDAL dal = new ProjectMemberScheduleDAL();
            dal.UpdateProjectMemberSchedule(projectMemberSchedule, ID);
        }

        public void DeleteProjectMemberSchedule(ProjectMemberSchedule projectMemberSchedule)
        {
            ProjectMemberScheduleDAL dal = new ProjectMemberScheduleDAL();
            dal.DeleteProjectMemberSchedule(projectMemberSchedule);
        }

        public IList GetAllProjectMemberSchedules(string strHQL)
        {
            ProjectMemberScheduleDAL dal = new ProjectMemberScheduleDAL();
            return dal.GetAllProjectMemberSchedules(strHQL);
        }
    }
}