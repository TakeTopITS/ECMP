using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 项目成员人力计划标准
    /// </summary>
    public class ProjectMemberScheduleBaseBLL
    {
        public void AddProjectMemberScheduleBase(ProjectMemberScheduleBase projectMemberScheduleBase)
        {
            ProjectMemberScheduleBaseDAL dal = new ProjectMemberScheduleBaseDAL();
            dal.AddProjectMemberScheduleBase(projectMemberScheduleBase);
        }

        public void UpdateProjectMemberScheduleBase(ProjectMemberScheduleBase projectMemberScheduleBase, int ID)
        {
            ProjectMemberScheduleBaseDAL dal = new ProjectMemberScheduleBaseDAL();
            dal.UpdateProjectMemberScheduleBase(projectMemberScheduleBase, ID);
        }

        public void DeleteProjectMemberScheduleBase(ProjectMemberScheduleBase projectMemberScheduleBase)
        {
            ProjectMemberScheduleBaseDAL dal = new ProjectMemberScheduleBaseDAL();
            dal.DeleteProjectMemberScheduleBase(projectMemberScheduleBase);
        }

        public IList GetAllProjectMemberScheduleBases(string strHQL)
        {
            ProjectMemberScheduleBaseDAL dal = new ProjectMemberScheduleBaseDAL();
            return dal.GetAllProjectMemberScheduleBases(strHQL);
        }
    }
}