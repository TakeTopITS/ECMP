using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class NewsRelatedUserDAL
    {
        private EntityControl control;

        public NewsRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddNewsRelatedUser(NewsRelatedUser newsRelatedUser)
        {
            control.AddEntity(newsRelatedUser);
        }

        public void UpdateNewsRelatedUser(NewsRelatedUser newsRelatedUser, int ID)
        {
            control.UpdateEntity(newsRelatedUser, ID);
        }

        public void DeleteNewsRelatedUser(NewsRelatedUser newsRelatedUser)
        {
            control.DeleteEntity(newsRelatedUser);
        }

        public IList GetAllNewsRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}