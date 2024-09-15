using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class VisitRegistration_StudentBLL
    {
        public void AddVisitRegistration_Student(VisitRegistration_Student visitRegistration_Student)
        {
            VisitRegistration_StudentDAL dal = new VisitRegistration_StudentDAL();
            dal.AddVisitRegistration_Student(visitRegistration_Student);
        }

        public void UpdateVisitRegistration_Student(VisitRegistration_Student visitRegistration_Student, int ID)
        {
            VisitRegistration_StudentDAL dal = new VisitRegistration_StudentDAL();
            dal.UpdateVisitRegistration_Student(visitRegistration_Student, ID);
        }

        public void DeleteVisitRegistration_Student(VisitRegistration_Student visitRegistration_Student)
        {
            VisitRegistration_StudentDAL dal = new VisitRegistration_StudentDAL();
            dal.DeleteVisitRegistration_Student(visitRegistration_Student);
        }

        public IList GetAllVisitRegistration_Students(string strHQL)
        {
            VisitRegistration_StudentDAL dal = new VisitRegistration_StudentDAL();
            return dal.GetAllVisitRegistration_Students(strHQL);
        }
    }
}