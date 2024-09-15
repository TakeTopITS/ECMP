using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityRectificationBLL
    {
        public void AddQMQualityRectification(QMQualityRectification qMQualityRectification)
        {
            QMQualityRectificationDAL dal = new QMQualityRectificationDAL();
            dal.AddQMQualityRectification(qMQualityRectification);
        }

        public void UpdateQMQualityRectification(QMQualityRectification qMQualityRectification, string Code)
        {
            QMQualityRectificationDAL dal = new QMQualityRectificationDAL();
            dal.UpdateQMQualityRectification(qMQualityRectification, Code);
        }

        public void DeleteQMQualityRectification(QMQualityRectification qMQualityRectification)
        {
            QMQualityRectificationDAL dal = new QMQualityRectificationDAL();
            dal.DeleteQMQualityRectification(qMQualityRectification);
        }

        public IList GetAllQMQualityRectifications(string strHQL)
        {
            QMQualityRectificationDAL dal = new QMQualityRectificationDAL();
            return dal.GetAllQMQualityRectifications(strHQL);
        }
    }
}