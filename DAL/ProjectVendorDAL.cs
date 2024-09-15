using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectVendorDAL
    {
        private EntityControl control;

        public ProjectVendorDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectVendor(ProjectVendor projectVendor)
        {
            control.AddEntity(projectVendor);
        }

        public void UpdateProjectVendor(ProjectVendor projectVendor, int ID)
        {
            control.UpdateEntity(projectVendor, ID);
        }

        public void DeleteProjectVendor(ProjectVendor projectVendor)
        {
            control.DeleteEntity(projectVendor);
        }

        public IList GetAllProjectVendors(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}