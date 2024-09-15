using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedUserDAL
    {
        private EntityControl control;

        public ConstractRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedUser(ConstractRelatedUser constractRelatedUser)
        {
            control.AddEntity(constractRelatedUser);
        }

        public void UpdateConstractRelatedUser(ConstractRelatedUser constractRelatedUser, int ID)
        {
            control.UpdateEntity(constractRelatedUser, ID);
        }

        public void DeleteConstractRelatedUser(ConstractRelatedUser constractRelatedUser)
        {
            control.DeleteEntity(constractRelatedUser);
        }

        public IList GetAllConstractRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}