using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserAttendanceRecordBLL
    {
        public void AddUserAttendanceRecord(UserAttendanceRecord userUserAttendanceRecord)
        {
            UserAttendanceRecordDAL dal = new UserAttendanceRecordDAL();
            dal.AddUserAttendanceRecord(userUserAttendanceRecord);
        }

        public void UpdateUserAttendanceRecord(UserAttendanceRecord userUserAttendanceRecord, int ID)
        {
            UserAttendanceRecordDAL dal = new UserAttendanceRecordDAL();
            dal.UpdateUserAttendanceRecord(userUserAttendanceRecord, ID);
        }

        public void DeleteUserAttendanceRecord(UserAttendanceRecord userUserAttendanceRecord)
        {
            UserAttendanceRecordDAL dal = new UserAttendanceRecordDAL();
            dal.DeleteUserAttendanceRecord(userUserAttendanceRecord);
        }

        public IList GetAllUserAttendanceRecords(string strHQL)
        {
            UserAttendanceRecordDAL dal = new UserAttendanceRecordDAL();
            return dal.GetAllUserAttendanceRecords(strHQL);
        }
    }
}