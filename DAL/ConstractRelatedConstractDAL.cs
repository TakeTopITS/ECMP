using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedConstractDAL
    {
        private EntityControl control;

        public ConstractRelatedConstractDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedConstract(ConstractRelatedConstract constractRelatedConstract)
        {
            control.AddEntity(constractRelatedConstract);
        }

        public void UpdateConstractRelatedConstract(ConstractRelatedConstract constractRelatedConstract, int ID)
        {
            control.UpdateEntity(constractRelatedConstract, ID);
        }

        public void DeleteConstractRelatedConstract(ConstractRelatedConstract constractRelatedConstract)
        {
            control.DeleteEntity(constractRelatedConstract);
        }

        public IList GetAllConstractRelatedConstracts(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}