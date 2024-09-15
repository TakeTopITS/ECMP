using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class RelatedReqBLL
    {
        public void AddRelatedReq(RelatedReq relatedReq)
        {
            RelatedReqDAL dal = new RelatedReqDAL();
            dal.AddRelatedReq(relatedReq);
        }

        public void UpdateRelatedReq(RelatedReq relatedReq, int ID)
        {
            RelatedReqDAL dal = new RelatedReqDAL();
            dal.UpdateRelatedReq(relatedReq, ID);
        }

        public void DeleteRelatedReq(RelatedReq relatedReq)
        {
            RelatedReqDAL dal = new RelatedReqDAL();
            dal.DeleteRelatedReq(relatedReq);
        }

        public IList GetAllRelatedReqs(string strHQL)
        {
            RelatedReqDAL dal = new RelatedReqDAL();
            return dal.GetAllRelatedReqs(strHQL);
        }
    }
}