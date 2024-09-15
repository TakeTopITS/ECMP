using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectVendorBLL
    {
        public void AddProjectVendor(ProjectVendor projectVendor)
        {
            ProjectVendorDAL dal = new ProjectVendorDAL();
            dal.AddProjectVendor(projectVendor);
        }

        public void UpdateProjectVendor(ProjectVendor projectVendor, int ID)
        {
            ProjectVendorDAL dal = new ProjectVendorDAL();
            dal.UpdateProjectVendor(projectVendor, ID);
        }

        public void DeleteProjectVendor(ProjectVendor projectVendor)
        {
            ProjectVendorDAL dal = new ProjectVendorDAL();
            dal.DeleteProjectVendor(projectVendor);
        }

        public IList GetAllProjectVendors(string strHQL)
        {
            ProjectVendorDAL dal = new ProjectVendorDAL();
            return dal.GetAllProjectVendors(strHQL);
        }
    }
}