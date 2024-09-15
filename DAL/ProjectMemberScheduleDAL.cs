using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 项目成员任务安排
    /// </summary>
    public class ProjectMemberScheduleDAL
    {
        private EntityControl control;

        public ProjectMemberScheduleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberSchedule(ProjectMemberSchedule projectMemberSchedule)
        {
            control.AddEntity(projectMemberSchedule);
        }

        public void UpdateProjectMemberSchedule(ProjectMemberSchedule projectMemberSchedule, int ID)
        {
            control.UpdateEntity(projectMemberSchedule, ID);
        }

        public void DeleteProjectMemberSchedule(ProjectMemberSchedule projectMemberSchedule)
        {
            control.DeleteEntity(projectMemberSchedule);
        }

        public IList GetAllProjectMemberSchedules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}