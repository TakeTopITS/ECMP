using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AttendanceRuleBLL
    {
        public void AddAttendanceRule(AttendanceRule attendanceRule)
        {
            AttendanceRuleDAL dal = new AttendanceRuleDAL();
            dal.AddAttendanceRule(attendanceRule);
        }

        public void UpdateAttendanceRule(AttendanceRule attendanceRule, int ID)
        {
            AttendanceRuleDAL dal = new AttendanceRuleDAL();
            dal.UpdateAttendanceRule(attendanceRule, ID);
        }

        public void DeleteAttendanceRule(AttendanceRule attendanceRule)
        {
            AttendanceRuleDAL dal = new AttendanceRuleDAL();
            dal.DeleteAttendanceRule(attendanceRule);
        }

        public IList GetAllAttendanceRules(string strHQL)
        {
            AttendanceRuleDAL dal = new AttendanceRuleDAL();
            return dal.GetAllAttendanceRules(strHQL);
        }
    }
}