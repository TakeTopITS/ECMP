using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityDefectNoticeDAL
    {
        private EntityControl control;

        public QMQualityDefectNoticeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityDefectNotice(QMQualityDefectNotice qMQualityDefectNotice)
        {
            control.AddEntity(qMQualityDefectNotice);
        }

        public void UpdateQMQualityDefectNotice(QMQualityDefectNotice qMQualityDefectNotice, string Code)
        {
            control.UpdateEntity(qMQualityDefectNotice, Code);
        }

        public void DeleteQMQualityDefectNotice(QMQualityDefectNotice qMQualityDefectNotice)
        {
            control.DeleteEntity(qMQualityDefectNotice);
        }

        public IList GetAllQMQualityDefectNotices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}