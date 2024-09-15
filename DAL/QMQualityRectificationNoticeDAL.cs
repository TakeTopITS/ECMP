using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityRectificationNoticeDAL
    {
        private EntityControl control;

        public QMQualityRectificationNoticeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityRectificationNotice(QMQualityRectificationNotice qMQualityRectificationNotice)
        {
            control.AddEntity(qMQualityRectificationNotice);
        }

        public void UpdateQMQualityRectificationNotice(QMQualityRectificationNotice qMQualityRectificationNotice, string Code)
        {
            control.UpdateEntity(qMQualityRectificationNotice, Code);
        }

        public void DeleteQMQualityRectificationNotice(QMQualityRectificationNotice qMQualityRectificationNotice)
        {
            control.DeleteEntity(qMQualityRectificationNotice);
        }

        public IList GetAllQMQualityRectificationNotices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}