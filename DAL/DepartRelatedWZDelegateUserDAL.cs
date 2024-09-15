using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedWZDelegateUserDAL
    {
        private EntityControl control;

        public DepartRelatedWZDelegateUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedWZDelegateUser(DepartRelatedWZDelegateUser departRelatedWZDelegateUser)
        {
            control.AddEntity(departRelatedWZDelegateUser);
        }

        public void UpdateDepartRelatedWZDelegateUser(DepartRelatedWZDelegateUser departRelatedWZDelegateUser, int ID)
        {
            control.UpdateEntity(departRelatedWZDelegateUser, ID);
        }

        public void DeleteDepartRelatedWZDelegateUser(DepartRelatedWZDelegateUser departRelatedWZDelegateUser)
        {
            control.DeleteEntity(departRelatedWZDelegateUser);
        }

        public IList GetAllDepartRelatedWZDelegateUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}