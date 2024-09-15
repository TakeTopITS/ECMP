using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProjectCustomerDAL
    {
        private EntityControl control;

        public ProjectCustomerDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProjectCustomer(ProjectCustomer projectCustomer)
        {
            control.AddEntity(projectCustomer);
        }

        public void UpdateProjectCustomer(ProjectCustomer projectCustomer, int ID)
        {
            control.UpdateEntity(projectCustomer, ID);
        }

        public void DeleteProjectCustomer(ProjectCustomer projectCustomer)
        {
            control.DeleteEntity(projectCustomer);
        }

        public IList GetAllProjectCustomers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}