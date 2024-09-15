using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ActorGroupTypeBLL
    {
        public void AddActorGroupType(ActorGroupType actorGroupType)
        {
            ActorGroupTypeDAL dal = new ActorGroupTypeDAL();
            dal.AddActorGroupType(actorGroupType);
        }

        public void UpdateActorGroupType(ActorGroupType actorGroupType, string Type)
        {
            ActorGroupTypeDAL dal = new ActorGroupTypeDAL();
            dal.UpdateActorGroupType(actorGroupType, Type);
        }

        public void DeleteActorGroupType(ActorGroupType actorGroupType)
        {
            ActorGroupTypeDAL dal = new ActorGroupTypeDAL();
            dal.DeleteActorGroupType(actorGroupType);
        }

        public IList GetAllActorGroupTypes(string strHQL)
        {
            ActorGroupTypeDAL dal = new ActorGroupTypeDAL();
            return dal.GetAllActorGroupTypes(strHQL);
        }
    }
}