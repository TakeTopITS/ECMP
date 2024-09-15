using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RelatedReqDAL
    {
        private EntityControl control;

        public RelatedReqDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRelatedReq(RelatedReq relatedReq)
        {
            control.AddEntity(relatedReq);
        }

        public void UpdateRelatedReq(RelatedReq relatedReq, int ID)
        {
            control.UpdateEntity(relatedReq, ID);
        }

        public void DeleteRelatedReq(RelatedReq relatedReq)
        {
            control.DeleteEntity(relatedReq);
        }

        public IList GetAllRelatedReqs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}