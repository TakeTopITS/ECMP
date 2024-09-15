using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserAttendanceRecordDAL
    {
        private EntityControl control;

        public UserAttendanceRecordDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserAttendanceRecord(UserAttendanceRecord userAttendanceRecord)
        {
            control.AddEntity(userAttendanceRecord);
        }

        public void UpdateUserAttendanceRecord(UserAttendanceRecord userAttendanceRecord, int ID)
        {
            control.UpdateEntity(userAttendanceRecord, ID);
        }

        public void DeleteUserAttendanceRecord(UserAttendanceRecord userAttendanceRecord)
        {
            control.DeleteEntity(userAttendanceRecord);
        }

        public IList GetAllUserAttendanceRecords(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}