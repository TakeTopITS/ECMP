using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 项目成员人力计划标准
    /// </summary>
    public class ProjectMemberScheduleBaseDAL
    {
        private EntityControl control;

        public ProjectMemberScheduleBaseDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectMemberScheduleBase(ProjectMemberScheduleBase projectMemberScheduleBase)
        {
            control.AddEntity(projectMemberScheduleBase);
        }

        public void UpdateProjectMemberScheduleBase(ProjectMemberScheduleBase projectMemberScheduleBase, int ID)
        {
            control.UpdateEntity(projectMemberScheduleBase, ID);
        }

        public void DeleteProjectMemberScheduleBase(ProjectMemberScheduleBase projectMemberScheduleBase)
        {
            control.DeleteEntity(projectMemberScheduleBase);
        }

        public IList GetAllProjectMemberScheduleBases(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}