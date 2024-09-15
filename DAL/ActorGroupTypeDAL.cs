using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ActorGroupTypeDAL
    {
        private EntityControl control;

        public ActorGroupTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddActorGroupType(ActorGroupType actorGroupType)
        {
            control.AddEntity(actorGroupType);
        }

        public void UpdateActorGroupType(ActorGroupType actorGroupType, string Type)
        {
            control.UpdateEntity(actorGroupType, Type);
        }

        public void DeleteActorGroupType(ActorGroupType actorGroupType)
        {
            control.DeleteEntity(actorGroupType);
        }

        public IList GetAllActorGroupTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}