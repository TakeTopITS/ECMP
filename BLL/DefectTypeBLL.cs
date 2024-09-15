using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DefectTypeBLL
    {
        public void AddDefectType(DefectType defectType)
        {
            DefectTypeDAL dal = new DefectTypeDAL();
            dal.AddDefectType(defectType);
        }

        public void UpdateDefectType(DefectType defectType, string Type)
        {
            DefectTypeDAL dal = new DefectTypeDAL();
            dal.UpdateDefectType(defectType, Type);
        }

        public void DeleteDefectType(DefectType defectType)
        {
            DefectTypeDAL dal = new DefectTypeDAL();
            dal.DeleteDefectType(defectType);
        }

        public IList GetAllDefectTypes(string strHQL)
        {
            DefectTypeDAL dal = new DefectTypeDAL();
            return dal.GetAllDefectTypes(strHQL);
        }
    }
}