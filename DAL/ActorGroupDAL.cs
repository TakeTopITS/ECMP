using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ActorGroupDAL
    {
        private EntityControl control;

        public ActorGroupDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddActorGroup(ActorGroup actorGroup)
        {
            control.AddEntity(actorGroup);
        }

        public void UpdateActorGroup(ActorGroup actorGroup, int ID)
        {
            control.UpdateEntity(actorGroup, ID);
        }

        public void DeleteActorGroup(ActorGroup actorGroup)
        {
            control.DeleteEntity(actorGroup);
        }

        public IList GetAllActorGroups(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}