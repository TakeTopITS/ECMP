using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityInspectionBLL
    {
        public void AddQMQualityInspection(QMQualityInspection qMQualityInspection)
        {
            QMQualityInspectionDAL dal = new QMQualityInspectionDAL();
            dal.AddQMQualityInspection(qMQualityInspection);
        }

        public void UpdateQMQualityInspection(QMQualityInspection qMQualityInspection, string Code)
        {
            QMQualityInspectionDAL dal = new QMQualityInspectionDAL();
            dal.UpdateQMQualityInspection(qMQualityInspection, Code);
        }

        public void DeleteQMQualityInspection(QMQualityInspection qMQualityInspection)
        {
            QMQualityInspectionDAL dal = new QMQualityInspectionDAL();
            dal.DeleteQMQualityInspection(qMQualityInspection);
        }

        public IList GetAllQMQualityInspections(string strHQL)
        {
            QMQualityInspectionDAL dal = new QMQualityInspectionDAL();
            return dal.GetAllQMQualityInspections(strHQL);
        }
    }
}