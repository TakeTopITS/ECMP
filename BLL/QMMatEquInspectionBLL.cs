using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMMatEquInspectionBLL
    {
        public void AddQMMatEquInspection(QMMatEquInspection qMMatEquInspection)
        {
            QMMatEquInspectionDAL dal = new QMMatEquInspectionDAL();
            dal.AddQMMatEquInspection(qMMatEquInspection);
        }

        public void UpdateQMMatEquInspection(QMMatEquInspection qMMatEquInspection, string Code)
        {
            QMMatEquInspectionDAL dal = new QMMatEquInspectionDAL();
            dal.UpdateQMMatEquInspection(qMMatEquInspection, Code);
        }

        public void DeleteQMMatEquInspection(QMMatEquInspection qMMatEquInspection)
        {
            QMMatEquInspectionDAL dal = new QMMatEquInspectionDAL();
            dal.DeleteQMMatEquInspection(qMMatEquInspection);
        }

        public IList GetAllQMMatEquInspections(string strHQL)
        {
            QMMatEquInspectionDAL dal = new QMMatEquInspectionDAL();
            return dal.GetAllQMMatEquInspections(strHQL);
        }
    }
}