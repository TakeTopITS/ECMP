using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMQualityInspectionSheetDAL
    {
        private EntityControl control;

        public QMQualityInspectionSheetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMQualityInspectionSheet(QMQualityInspectionSheet qMQualityInspectionSheet)
        {
            control.AddEntity(qMQualityInspectionSheet);
        }

        public void UpdateQMQualityInspectionSheet(QMQualityInspectionSheet qMQualityInspectionSheet, string Code)
        {
            control.UpdateEntity(qMQualityInspectionSheet, Code);
        }

        public void DeleteQMQualityInspectionSheet(QMQualityInspectionSheet qMQualityInspectionSheet)
        {
            control.DeleteEntity(qMQualityInspectionSheet);
        }

        public IList GetAllQMQualityInspectionSheets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}