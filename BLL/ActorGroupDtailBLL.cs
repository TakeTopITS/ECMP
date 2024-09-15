using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ActorGroupDetailBLL
    {
        public void AddActorGroupDetail(ActorGroupDetail actorGroupDetail)
        {
            ActorGroupDetailDAL dal = new ActorGroupDetailDAL();
            dal.AddActorGroupDetail(actorGroupDetail);
        }

        public void UpdateActorGroupDetail(ActorGroupDetail actorGroupDetail, int GroupID)
        {
            ActorGroupDetailDAL dal = new ActorGroupDetailDAL();
            dal.UpdateActorGroupDetail(actorGroupDetail, GroupID);
        }

        public void DeleteActorGroupDetail(ActorGroupDetail actorGroupDetail)
        {
            ActorGroupDetailDAL dal = new ActorGroupDetailDAL();
            dal.DeleteActorGroupDetail(actorGroupDetail);
        }

        public IList GetAllActorGroupDetails(string strHQL)
        {
            ActorGroupDetailDAL dal = new ActorGroupDetailDAL();
            return dal.GetAllActorGroupDetails(strHQL);
        }
    }
}