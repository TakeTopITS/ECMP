using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RelatedActorGroupBLL
    {
        public void AddRelatedActorGroup(RelatedActorGroup relatedActorGroup)
        {
            RelatedActorGroupDAL dal = new RelatedActorGroupDAL();
            dal.AddRelatedActorGroup(relatedActorGroup);
        }

        public void UpdateRelatedActorGroup(RelatedActorGroup relatedActorGroup, int ID)
        {
            RelatedActorGroupDAL dal = new RelatedActorGroupDAL();
            dal.UpdateRelatedActorGroup(relatedActorGroup, ID);
        }

        public void DeleteRelatedActorGroup(RelatedActorGroup relatedActorGroup)
        {
            RelatedActorGroupDAL dal = new RelatedActorGroupDAL();
            dal.DeleteRelatedActorGroup(relatedActorGroup);
        }

        public IList GetAllRelatedActorGroups(string strHQL)
        {
            RelatedActorGroupDAL dal = new RelatedActorGroupDAL();
            return dal.GetAllRelatedActorGroups(strHQL);
        }
    }
}