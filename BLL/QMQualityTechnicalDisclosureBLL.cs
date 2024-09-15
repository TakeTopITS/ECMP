using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityTechnicalDisclosureBLL
    {
        public void AddQMQualityTechnicalDisclosure(QMQualityTechnicalDisclosure qMQualityTechnicalDisclosure)
        {
            QMQualityTechnicalDisclosureDAL dal = new QMQualityTechnicalDisclosureDAL();
            dal.AddQMQualityTechnicalDisclosure(qMQualityTechnicalDisclosure);
        }

        public void UpdateQMQualityTechnicalDisclosure(QMQualityTechnicalDisclosure qMQualityTechnicalDisclosure, string Code)
        {
            QMQualityTechnicalDisclosureDAL dal = new QMQualityTechnicalDisclosureDAL();
            dal.UpdateQMQualityTechnicalDisclosure(qMQualityTechnicalDisclosure, Code);
        }

        public void DeleteQMQualityTechnicalDisclosure(QMQualityTechnicalDisclosure qMQualityTechnicalDisclosure)
        {
            QMQualityTechnicalDisclosureDAL dal = new QMQualityTechnicalDisclosureDAL();
            dal.DeleteQMQualityTechnicalDisclosure(qMQualityTechnicalDisclosure);
        }

        public IList GetAllQMQualityTechnicalDisclosures(string strHQL)
        {
            QMQualityTechnicalDisclosureDAL dal = new QMQualityTechnicalDisclosureDAL();
            return dal.GetAllQMQualityTechnicalDisclosures(strHQL);
        }
    }
}