using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DefectmentBLL
    {
        public void AddDefectment(Defectment defectment)
        {
            DefectmentDAL dal = new DefectmentDAL();
            dal.AddDefectment(defectment);
        }

        public void UpdateDefectment(Defectment defectment, int DefectID)
        {
            DefectmentDAL dal = new DefectmentDAL();
            dal.UpdateDefectment(defectment, DefectID);
        }

        public void DeleteDefectment(Defectment defectment)
        {
            DefectmentDAL dal = new DefectmentDAL();
            dal.DeleteDefectment(defectment);
        }

        public IList GetAllDefectments(string strHQL)
        {
            DefectmentDAL dal = new DefectmentDAL();
            return dal.GetAllDefectments(strHQL);
        }
    }
}