using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ActorGroupBLL
    {
        public void AddActorGroup(ActorGroup actorGroup)
        {
            ActorGroupDAL dal = new ActorGroupDAL();
            dal.AddActorGroup(actorGroup);
        }

        public void UpdateActorGroup(ActorGroup actorGroup, int ID)
        {
            ActorGroupDAL dal = new ActorGroupDAL();
            dal.UpdateActorGroup(actorGroup, ID);
        }

        public void DeleteActorGroup(ActorGroup actorGroup)
        {
            ActorGroupDAL dal = new ActorGroupDAL();
            dal.DeleteActorGroup(actorGroup);
        }

        public IList GetAllActorGroups(string strHQL)
        {
            ActorGroupDAL dal = new ActorGroupDAL();
            return dal.GetAllActorGroups(strHQL);
        }
    }
}