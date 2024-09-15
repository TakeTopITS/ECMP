using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedWZCheckUserDAL
    {
        private EntityControl control;

        public DepartRelatedWZCheckUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedWZCheckUser(DepartRelatedWZCheckUser departRelatedWZCheckUser)
        {
            control.AddEntity(departRelatedWZCheckUser);
        }

        public void UpdateDepartRelatedWZCheckUser(DepartRelatedWZCheckUser departRelatedWZCheckUser, int ID)
        {
            control.UpdateEntity(departRelatedWZCheckUser, ID);
        }

        public void DeleteDepartRelatedWZCheckUser(DepartRelatedWZCheckUser departRelatedWZCheckUser)
        {
            control.DeleteEntity(departRelatedWZCheckUser);
        }

        public IList GetAllDepartRelatedWZCheckUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}