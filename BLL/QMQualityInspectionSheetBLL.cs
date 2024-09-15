using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMQualityInspectionSheetBLL
    {
        public void AddQMQualityInspectionSheet(QMQualityInspectionSheet qMQualityInspectionSheet)
        {
            QMQualityInspectionSheetDAL dal = new QMQualityInspectionSheetDAL();
            dal.AddQMQualityInspectionSheet(qMQualityInspectionSheet);
        }

        public void UpdateQMQualityInspectionSheet(QMQualityInspectionSheet qMQualityInspectionSheet, string Code)
        {
            QMQualityInspectionSheetDAL dal = new QMQualityInspectionSheetDAL();
            dal.UpdateQMQualityInspectionSheet(qMQualityInspectionSheet, Code);
        }

        public void DeleteQMQualityInspectionSheet(QMQualityInspectionSheet qMQualityInspectionSheet)
        {
            QMQualityInspectionSheetDAL dal = new QMQualityInspectionSheetDAL();
            dal.DeleteQMQualityInspectionSheet(qMQualityInspectionSheet);
        }

        public IList GetAllQMQualityInspectionSheets(string strHQL)
        {
            QMQualityInspectionSheetDAL dal = new QMQualityInspectionSheetDAL();
            return dal.GetAllQMQualityInspectionSheets(strHQL);
        }
    }
}