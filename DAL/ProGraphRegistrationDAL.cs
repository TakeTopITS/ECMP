using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 收图登记表
    /// </summary>
    public class ProGraphRegistrationDAL
    {
        private EntityControl control;

        public ProGraphRegistrationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProGraphRegistration(ProGraphRegistration proGraphRegistration)
        {
            control.AddEntity(proGraphRegistration);
        }

        public void UpdateProGraphRegistration(ProGraphRegistration proGraphRegistration, int ID)
        {
            control.UpdateEntity(proGraphRegistration, ID);
        }

        public void DeleteProGraphRegistration(ProGraphRegistration proGraphRegistration)
        {
            control.DeleteEntity(proGraphRegistration);
        }

        public IList GetAllProGraphRegistrations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}