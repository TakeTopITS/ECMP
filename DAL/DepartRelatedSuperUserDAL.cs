using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedSuperUserDAL
    {
        private EntityControl control;

        public DepartRelatedSuperUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedSuperUser(DepartRelatedSuperUser departRelatedSuperUser)
        {
            control.AddEntity(departRelatedSuperUser);
        }

        public void UpdateDepartRelatedSuperUser(DepartRelatedSuperUser departRelatedSuperUser, int ID)
        {
            control.UpdateEntity(departRelatedSuperUser, ID);
        }

        public void DeleteDepartRelatedSuperUser(DepartRelatedSuperUser departRelatedSuperUser)
        {
            control.DeleteEntity(departRelatedSuperUser);
        }

        public IList GetAllDepartRelatedSuperUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}