using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DefectmentDAL
    {
        private EntityControl control;

        public DefectmentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDefectment(Defectment defectment)
        {
            control.AddEntity(defectment);
        }

        public void UpdateDefectment(Defectment defectment, int DefectID)
        {
            control.UpdateEntity(defectment, DefectID);
        }

        public void DeleteDefectment(Defectment defectment)
        {
            control.DeleteEntity(defectment);
        }

        public IList GetAllDefectments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}