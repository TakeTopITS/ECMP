using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityDefectProcessBLL
    {
        public void AddQMQualityDefectProcess(QMQualityDefectProcess qMQualityDefectProcess)
        {
            QMQualityDefectProcessDAL dal = new QMQualityDefectProcessDAL();
            dal.AddQMQualityDefectProcess(qMQualityDefectProcess);
        }

        public void UpdateQMQualityDefectProcess(QMQualityDefectProcess qMQualityDefectProcess, string Code)
        {
            QMQualityDefectProcessDAL dal = new QMQualityDefectProcessDAL();
            dal.UpdateQMQualityDefectProcess(qMQualityDefectProcess, Code);
        }

        public void DeleteQMQualityDefectProcess(QMQualityDefectProcess qMQualityDefectProcess)
        {
            QMQualityDefectProcessDAL dal = new QMQualityDefectProcessDAL();
            dal.DeleteQMQualityDefectProcess(qMQualityDefectProcess);
        }

        public IList GetAllQMQualityDefectProcesss(string strHQL)
        {
            QMQualityDefectProcessDAL dal = new QMQualityDefectProcessDAL();
            return dal.GetAllQMQualityDefectProcesss(strHQL);
        }
    }
}