using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ActorGroupDetailDAL
    {
        private EntityControl control;

        public ActorGroupDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddActorGroupDetail(ActorGroupDetail actorGroupDetail)
        {
            control.AddEntity(actorGroupDetail);
        }

        public void UpdateActorGroupDetail(ActorGroupDetail actorGroupDetail, int GroupID)
        {
            control.UpdateEntity(actorGroupDetail, GroupID);
        }

        public void DeleteActorGroupDetail(ActorGroupDetail actorGroupDetail)
        {
            control.DeleteEntity(actorGroupDetail);
        }

        public IList GetAllActorGroupDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}