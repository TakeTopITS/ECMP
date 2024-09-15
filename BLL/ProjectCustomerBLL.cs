using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProjectCustomerBLL
    {
        public void AddProjectCustomer(ProjectCustomer projectCustomer)
        {
            ProjectCustomerDAL dal = new ProjectCustomerDAL();
            dal.AddProjectCustomer(projectCustomer);
        }

        public void UpdateProjectCustomer(ProjectCustomer projectCustomer, int ID)
        {
            ProjectCustomerDAL dal = new ProjectCustomerDAL();
            dal.UpdateProjectCustomer(projectCustomer, ID);
        }

        public void DeleteProjectCustomer(ProjectCustomer projectCustomer)
        {
            ProjectCustomerDAL dal = new ProjectCustomerDAL();
            dal.DeleteProjectCustomer(projectCustomer);
        }

        public IList GetAllProjectCustomers(string strHQL)
        {
            ProjectCustomerDAL dal = new ProjectCustomerDAL();
            return dal.GetAllProjectCustomers(strHQL);
        }
    }
}