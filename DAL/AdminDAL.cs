using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AdminDAL
    {
        private EntityControl control;

        public AdminDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAdmin(Admin admin)
        {
            control.AddEntity(admin);
        }

        public void UpdateAdmin(Admin admin, string UserCode)
        {
            control.UpdateEntity(admin, UserCode);
        }

        public void DeleteAdmin(Admin admin)
        {
            control.DeleteEntity(admin);
        }

        public IList GetAllAdmins(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}