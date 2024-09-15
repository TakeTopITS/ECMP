using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartUserInforRelatedUserDAL
    {
        private EntityControl control;

        public DepartUserInforRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartUserInforRelatedUser(DepartUserInforRelatedUser departUserInforRelatedUser)
        {
            control.AddEntity(departUserInforRelatedUser);
        }

        public void UpdateDepartUserInforRelatedUser(DepartUserInforRelatedUser departUserInforRelatedUser, int ID)
        {
            control.UpdateEntity(departUserInforRelatedUser, ID);
        }

        public void DeleteDepartUserInforRelatedUser(DepartUserInforRelatedUser departUserInforRelatedUser)
        {
            control.DeleteEntity(departUserInforRelatedUser);
        }

        public IList GetAllDepartUserInforRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}