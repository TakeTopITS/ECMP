using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProRelatedUserDAL
    {
        private EntityControl control;

        public ProRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProRelatedUser(ProRelatedUser proRelatedUser)
        {
            control.AddEntity(proRelatedUser);
        }

        public void UpdateProRelatedUser(ProRelatedUser proRelatedUser, int ID)
        {
            control.UpdateEntity(proRelatedUser, ID);
        }

        public void DeleteProRelatedUser(ProRelatedUser proRelatedUser)
        {
            control.DeleteEntity(proRelatedUser);
        }

        public IList GetAllProRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}