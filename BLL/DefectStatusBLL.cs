using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DefectStatusBLL
    {
        public void AddDefectStatus(DefectStatus defectStatus)
        {
            DefectStatusDAL dal = new DefectStatusDAL();
            dal.AddDefectStatus(defectStatus);
        }

        public void UpdateDefectStatus(DefectStatus defectStatus, string Status)
        {
            DefectStatusDAL dal = new DefectStatusDAL();
            dal.UpdateDefectStatus(defectStatus, Status);
        }

        public void DeleteDefectStatus(DefectStatus defectStatus)
        {
            DefectStatusDAL dal = new DefectStatusDAL();
            dal.DeleteDefectStatus(defectStatus);
        }

        public IList GetAllDefectStatuss(string strHQL)
        {
            DefectStatusDAL dal = new DefectStatusDAL();
            return dal.GetAllDefectStatuss(strHQL);
        }
    }
}