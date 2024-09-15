using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class VisitRegistration_StudentDAL
    {
        private EntityControl control;

        public VisitRegistration_StudentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddVisitRegistration_Student(VisitRegistration_Student visitRegistration_Student)
        {
            control.AddEntity(visitRegistration_Student);
        }

        public void UpdateVisitRegistration_Student(VisitRegistration_Student visitRegistration_Student, int ID)
        {
            control.UpdateEntity(visitRegistration_Student, ID);
        }

        public void DeleteVisitRegistration_Student(VisitRegistration_Student visitRegistration_Student)
        {
            control.DeleteEntity(visitRegistration_Student);
        }

        public IList GetAllVisitRegistration_Students(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}