using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMEngineerWarrantyBLL
    {
        public void AddQMEngineerWarranty(QMEngineerWarranty qMEngineerWarranty)
        {
            QMEngineerWarrantyDAL dal = new QMEngineerWarrantyDAL();
            dal.AddQMEngineerWarranty(qMEngineerWarranty);
        }

        public void UpdateQMEngineerWarranty(QMEngineerWarranty qMEngineerWarranty, string Code)
        {
            QMEngineerWarrantyDAL dal = new QMEngineerWarrantyDAL();
            dal.UpdateQMEngineerWarranty(qMEngineerWarranty, Code);
        }

        public void DeleteQMEngineerWarranty(QMEngineerWarranty qMEngineerWarranty)
        {
            QMEngineerWarrantyDAL dal = new QMEngineerWarrantyDAL();
            dal.DeleteQMEngineerWarranty(qMEngineerWarranty);
        }

        public IList GetAllQMEngineerWarrantys(string strHQL)
        {
            QMEngineerWarrantyDAL dal = new QMEngineerWarrantyDAL();
            return dal.GetAllQMEngineerWarrantys(strHQL);
        }
    }
}