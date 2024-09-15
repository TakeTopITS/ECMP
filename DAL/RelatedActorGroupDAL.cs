using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RelatedActorGroupDAL
    {
        private EntityControl control;

        public RelatedActorGroupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRelatedActorGroup(RelatedActorGroup relatedActorGroup)
        {
            control.AddEntity(relatedActorGroup);
        }

        public void UpdateRelatedActorGroup(RelatedActorGroup relatedActorGroup, int ID)
        {
            control.UpdateEntity(relatedActorGroup, ID);
        }

        public void DeleteRelatedActorGroup(RelatedActorGroup relatedActorGroup)
        {
            control.DeleteEntity(relatedActorGroup);
        }

        public IList GetAllRelatedActorGroups(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}