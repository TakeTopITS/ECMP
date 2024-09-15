using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMEngineerWarrantyDAL
    {
        private EntityControl control;

        public QMEngineerWarrantyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMEngineerWarranty(QMEngineerWarranty qMEngineerWarranty)
        {
            control.AddEntity(qMEngineerWarranty);
        }

        public void UpdateQMEngineerWarranty(QMEngineerWarranty qMEngineerWarranty, string Code)
        {
            control.UpdateEntity(qMEngineerWarranty, Code);
        }

        public void DeleteQMEngineerWarranty(QMEngineerWarranty qMEngineerWarranty)
        {
            control.DeleteEntity(qMEngineerWarranty);
        }

        public IList GetAllQMEngineerWarrantys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}