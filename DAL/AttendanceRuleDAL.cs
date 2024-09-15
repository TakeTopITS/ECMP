using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AttendanceRuleDAL
    {
        private EntityControl control;

        public AttendanceRuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAttendanceRule(AttendanceRule attendanceRule)
        {
            control.AddEntity(attendanceRule);
        }

        public void UpdateAttendanceRule(AttendanceRule attendanceRule, int ID)
        {
            control.UpdateEntity(attendanceRule, ID);
        }

        public void DeleteAttendanceRule(AttendanceRule attendanceRule)
        {
            control.DeleteEntity(attendanceRule);
        }

        public IList GetAllAttendanceRules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}