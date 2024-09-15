using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DocRelatedUserDAL
    {
        private EntityControl control;

        public DocRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDocRelatedUser(DocRelatedUser docRelatedUser)
        {
            control.AddEntity(docRelatedUser);
        }

        public void UpdateDocRelatedUser(DocRelatedUser docRelatedUser, int ID)
        {
            control.UpdateEntity(docRelatedUser, ID);
        }

        public void DeleteDocRelatedUser(DocRelatedUser docRelatedUser)
        {
            control.DeleteEntity(docRelatedUser);
        }

        public IList GetAllDocRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}