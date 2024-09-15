using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 项目成本管理
    /// </summary>
    public class ProjectCostManageDAL
    {
        private EntityControl control;

        public ProjectCostManageDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectCostManage(ProjectCostManage projectCostManage)
        {
            control.AddEntity(projectCostManage);
        }

        public void UpdateProjectCostManage(ProjectCostManage projectCostManage, int ID)
        {
            control.UpdateEntity(projectCostManage, ID);
        }

        public void DeleteProjectCostManage(ProjectCostManage projectCostManage)
        {
            control.DeleteEntity(projectCostManage);
        }

        public IList GetAllProjectCostManages(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}