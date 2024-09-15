using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityRectificationNoticeBLL
    {
        public void AddQMQualityRectificationNotice(QMQualityRectificationNotice qMQualityRectificationNotice)
        {
            QMQualityRectificationNoticeDAL dal = new QMQualityRectificationNoticeDAL();
            dal.AddQMQualityRectificationNotice(qMQualityRectificationNotice);
        }

        public void UpdateQMQualityRectificationNotice(QMQualityRectificationNotice qMQualityRectificationNotice, string Code)
        {
            QMQualityRectificationNoticeDAL dal = new QMQualityRectificationNoticeDAL();
            dal.UpdateQMQualityRectificationNotice(qMQualityRectificationNotice, Code);
        }

        public void DeleteQMQualityRectificationNotice(QMQualityRectificationNotice qMQualityRectificationNotice)
        {
            QMQualityRectificationNoticeDAL dal = new QMQualityRectificationNoticeDAL();
            dal.DeleteQMQualityRectificationNotice(qMQualityRectificationNotice);
        }

        public IList GetAllQMQualityRectificationNotices(string strHQL)
        {
            QMQualityRectificationNoticeDAL dal = new QMQualityRectificationNoticeDAL();
            return dal.GetAllQMQualityRectificationNotices(strHQL);
        }
    }
}