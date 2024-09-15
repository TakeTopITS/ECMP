using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityTechnicalDisclosureDAL
    {
        private EntityControl control;

        public QMQualityTechnicalDisclosureDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityTechnicalDisclosure(QMQualityTechnicalDisclosure qMQualityTechnicalDisclosure)
        {
            control.AddEntity(qMQualityTechnicalDisclosure);
        }

        public void UpdateQMQualityTechnicalDisclosure(QMQualityTechnicalDisclosure qMQualityTechnicalDisclosure, string Code)
        {
            control.UpdateEntity(qMQualityTechnicalDisclosure, Code);
        }

        public void DeleteQMQualityTechnicalDisclosure(QMQualityTechnicalDisclosure qMQualityTechnicalDisclosure)
        {
            control.DeleteEntity(qMQualityTechnicalDisclosure);
        }

        public IList GetAllQMQualityTechnicalDisclosures(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}