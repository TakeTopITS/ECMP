using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityDefectProcessDAL
    {
        private EntityControl control;

        public QMQualityDefectProcessDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityDefectProcess(QMQualityDefectProcess qMQualityDefectProcess)
        {
            control.AddEntity(qMQualityDefectProcess);
        }

        public void UpdateQMQualityDefectProcess(QMQualityDefectProcess qMQualityDefectProcess, string Code)
        {
            control.UpdateEntity(qMQualityDefectProcess, Code);
        }

        public void DeleteQMQualityDefectProcess(QMQualityDefectProcess qMQualityDefectProcess)
        {
            control.DeleteEntity(qMQualityDefectProcess);
        }

        public IList GetAllQMQualityDefectProcesss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}