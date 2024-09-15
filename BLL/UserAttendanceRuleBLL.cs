using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserAttendanceRuleBLL
    {
        public void AddUserAttendanceRule(UserAttendanceRule userUserAttendanceRule)
        {
            UserAttendanceRuleDAL dal = new UserAttendanceRuleDAL();
            dal.AddUserAttendanceRule(userUserAttendanceRule);
        }

        public void UpdateUserAttendanceRule(UserAttendanceRule userUserAttendanceRule, int ID)
        {
            UserAttendanceRuleDAL dal = new UserAttendanceRuleDAL();
            dal.UpdateUserAttendanceRule(userUserAttendanceRule, ID);
        }

        public void DeleteUserAttendanceRule(UserAttendanceRule userUserAttendanceRule)
        {
            UserAttendanceRuleDAL dal = new UserAttendanceRuleDAL();
            dal.DeleteUserAttendanceRule(userUserAttendanceRule);
        }

        public IList GetAllUserAttendanceRules(string strHQL)
        {
            UserAttendanceRuleDAL dal = new UserAttendanceRuleDAL();
            return dal.GetAllUserAttendanceRules(strHQL);
        }
    }
}