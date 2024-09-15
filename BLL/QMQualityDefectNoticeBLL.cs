using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityDefectNoticeBLL
    {
        public void AddQMQualityDefectNotice(QMQualityDefectNotice qMQualityDefectNotice)
        {
            QMQualityDefectNoticeDAL dal = new QMQualityDefectNoticeDAL();
            dal.AddQMQualityDefectNotice(qMQualityDefectNotice);
        }

        public void UpdateQMQualityDefectNotice(QMQualityDefectNotice qMQualityDefectNotice, string Code)
        {
            QMQualityDefectNoticeDAL dal = new QMQualityDefectNoticeDAL();
            dal.UpdateQMQualityDefectNotice(qMQualityDefectNotice, Code);
        }

        public void DeleteQMQualityDefectNotice(QMQualityDefectNotice qMQualityDefectNotice)
        {
            QMQualityDefectNoticeDAL dal = new QMQualityDefectNoticeDAL();
            dal.DeleteQMQualityDefectNotice(qMQualityDefectNotice);
        }

        public IList GetAllQMQualityDefectNotices(string strHQL)
        {
            QMQualityDefectNoticeDAL dal = new QMQualityDefectNoticeDAL();
            return dal.GetAllQMQualityDefectNotices(strHQL);
        }
    }
}