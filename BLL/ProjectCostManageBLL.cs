using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 项目成本管理
    /// </summary>
    public class ProjectCostManageBLL
    {
        public void AddProjectCostManage(ProjectCostManage projectCostManage)
        {
            ProjectCostManageDAL dal = new ProjectCostManageDAL();
            dal.AddProjectCostManage(projectCostManage);
        }

        public void UpdateProjectCostManage(ProjectCostManage projectCostManage, int ID)
        {
            ProjectCostManageDAL dal = new ProjectCostManageDAL();
            dal.UpdateProjectCostManage(projectCostManage, ID);
        }

        public void DeleteProjectCostManage(ProjectCostManage projectCostManage)
        {
            ProjectCostManageDAL dal = new ProjectCostManageDAL();
            dal.DeleteProjectCostManage(projectCostManage);
        }

        public IList GetAllProjectCostManages(string strHQL)
        {
            ProjectCostManageDAL dal = new ProjectCostManageDAL();
            return dal.GetAllProjectCostManages(strHQL);
        }
    }
}