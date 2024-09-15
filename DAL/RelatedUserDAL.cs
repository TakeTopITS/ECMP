using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RelatedUserDAL
    {
        private EntityControl control;

        public RelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRelatedUser(RelatedUser relatedUser)
        {
            control.AddEntity(relatedUser);
        }

        public void UpdateRelatedUser(RelatedUser relatedUser, int ID)
        {
            control.UpdateEntity(relatedUser, ID);
        }

        public void DeleteRelatedUser(RelatedUser relatedUser)
        {
            control.DeleteEntity(relatedUser);
        }

        public IList GetAllRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}