using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityRectificationDAL
    {
        private EntityControl control;

        public QMQualityRectificationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityRectification(QMQualityRectification qMQualityRectification)
        {
            control.AddEntity(qMQualityRectification);
        }

        public void UpdateQMQualityRectification(QMQualityRectification qMQualityRectification, string Code)
        {
            control.UpdateEntity(qMQualityRectification, Code);
        }

        public void DeleteQMQualityRectification(QMQualityRectification qMQualityRectification)
        {
            control.DeleteEntity(qMQualityRectification);
        }

        public IList GetAllQMQualityRectifications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}