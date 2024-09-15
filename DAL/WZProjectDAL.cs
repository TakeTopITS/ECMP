using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZProjectDAL
    {
        private EntityControl control;

        public WZProjectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZProject(WZProject wzProject)
        {
            control.AddEntity(wzProject);
        }

        public void UpdateWZProject(WZProject wzProject, string strProjectCode)
        {
            control.UpdateEntity(wzProject, strProjectCode);
        }

        public void DeleteWZProject(WZProject wzProject)
        {
            control.DeleteEntity(wzProject);
        }

        public IList GetAllWZProjects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}