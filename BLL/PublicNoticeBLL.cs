using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class PublicNoticeBLL
    {
        public void AddPublicNotice(PublicNotice publicNotice)
        {
            PublicNoticeDAL dal = new PublicNoticeDAL();
            dal.AddPublicNotice(publicNotice);
        }

        public void UpdatePublicNotice(PublicNotice publicNotice, int DocID)
        {
            PublicNoticeDAL dal = new PublicNoticeDAL();
            dal.UpdatePublicNotice(publicNotice, DocID);
        }

        public void DeletePublicNotice(PublicNotice publicNotice)
        {
            PublicNoticeDAL dal = new PublicNoticeDAL();
            dal.DeletePublicNotice(publicNotice);
        }

        public IList GetAllPublicNotices(string strHQL)
        {
            PublicNoticeDAL dal = new PublicNoticeDAL();
            return dal.GetAllPublicNotices(strHQL);
        }
    }
}