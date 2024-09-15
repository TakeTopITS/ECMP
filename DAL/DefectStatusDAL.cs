using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DefectStatusDAL
    {
        private EntityControl control;

        public DefectStatusDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDefectStatus(DefectStatus defectStatus)
        {
            control.AddEntity(defectStatus);
        }

        public void UpdateDefectStatus(DefectStatus defectStatus, string Status)
        {
            control.UpdateEntity(defectStatus, Status);
        }

        public void DeleteDefectStatus(DefectStatus defectStatus)
        {
            control.DeleteEntity(defectStatus);
        }

        public IList GetAllDefectStatuss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}