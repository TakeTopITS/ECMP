using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityInspectionDAL
    {
        private EntityControl control;

        public QMQualityInspectionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityInspection(QMQualityInspection qMQualityInspection)
        {
            control.AddEntity(qMQualityInspection);
        }

        public void UpdateQMQualityInspection(QMQualityInspection qMQualityInspection, string Code)
        {
            control.UpdateEntity(qMQualityInspection, Code);
        }

        public void DeleteQMQualityInspection(QMQualityInspection qMQualityInspection)
        {
            control.DeleteEntity(qMQualityInspection);
        }

        public IList GetAllQMQualityInspections(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}