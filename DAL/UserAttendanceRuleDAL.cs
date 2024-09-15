using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserAttendanceRuleDAL
    {
        private EntityControl control;

        public UserAttendanceRuleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserAttendanceRule(UserAttendanceRule userAttendanceRule)
        {
            control.AddEntity(userAttendanceRule);
        }

        public void UpdateUserAttendanceRule(UserAttendanceRule userAttendanceRule, int ID)
        {
            control.UpdateEntity(userAttendanceRule, ID);
        }

        public void DeleteUserAttendanceRule(UserAttendanceRule userAttendanceRule)
        {
            control.DeleteEntity(userAttendanceRule);
        }

        public IList GetAllUserAttendanceRules(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}