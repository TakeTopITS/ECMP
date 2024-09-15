using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 合格工评通知单
    /// </summary>
    public class WPQMQuaAssessNoticeBLL
    {
        public void AddWPQMQuaAssessNotice(WPQMQuaAssessNotice wPQMQuaAssessNotice)
        {
            WPQMQuaAssessNoticeDAL dal = new WPQMQuaAssessNoticeDAL();
            dal.AddWPQMQuaAssessNotice(wPQMQuaAssessNotice);
        }

        public void UpdateWPQMQuaAssessNotice(WPQMQuaAssessNotice wPQMQuaAssessNotice, int ID)
        {
            WPQMQuaAssessNoticeDAL dal = new WPQMQuaAssessNoticeDAL();
            dal.UpdateWPQMQuaAssessNotice(wPQMQuaAssessNotice, ID);
        }

        public void DeleteWPQMQuaAssessNotice(WPQMQuaAssessNotice wPQMQuaAssessNotice)
        {
            WPQMQuaAssessNoticeDAL dal = new WPQMQuaAssessNoticeDAL();
            dal.DeleteWPQMQuaAssessNotice(wPQMQuaAssessNotice);
        }

        public IList GetAllWPQMQuaAssessNotices(string strHQL)
        {
            WPQMQuaAssessNoticeDAL dal = new WPQMQuaAssessNoticeDAL();
            return dal.GetAllWPQMQuaAssessNotices(strHQL);
        }
    }
}