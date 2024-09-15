using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class PublicNoticeDAL
    {
        private EntityControl control;

        public PublicNoticeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddPublicNotice(PublicNotice publicNotice)
        {
            control.AddEntity(publicNotice);
        }

        public void UpdatePublicNotice(PublicNotice publicNotice, int DocID)
        {
            control.UpdateEntity(publicNotice, DocID);
        }

        public void DeletePublicNotice(PublicNotice publicNotice)
        {
            control.DeleteEntity(publicNotice);
        }

        public IList GetAllPublicNotices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}