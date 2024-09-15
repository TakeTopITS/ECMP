using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMMatEquInspectionDAL
    {
        private EntityControl control;

        public QMMatEquInspectionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMMatEquInspection(QMMatEquInspection qMMatEquInspection)
        {
            control.AddEntity(qMMatEquInspection);
        }

        public void UpdateQMMatEquInspection(QMMatEquInspection qMMatEquInspection, string Code)
        {
            control.UpdateEntity(qMMatEquInspection, Code);
        }

        public void DeleteQMMatEquInspection(QMMatEquInspection qMMatEquInspection)
        {
            control.DeleteEntity(qMMatEquInspection);
        }

        public IList GetAllQMMatEquInspections(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}