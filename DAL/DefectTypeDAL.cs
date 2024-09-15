using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DefectTypeDAL
    {
        private EntityControl control;

        public DefectTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDefectType(DefectType defectType)
        {
            control.AddEntity(defectType);
        }

        public void UpdateDefectType(DefectType defectType, string Type)
        {
            control.UpdateEntity(defectType, Type);
        }

        public void DeleteDefectType(DefectType defectType)
        {
            control.DeleteEntity(defectType);
        }

        public IList GetAllDefectTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}