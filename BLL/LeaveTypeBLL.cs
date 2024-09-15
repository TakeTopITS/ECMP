using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class LeaveTypeBLL
    {
        public void AddLeaveType(LeaveType leaveType)
        {
            LeaveTypeDAL dal = new LeaveTypeDAL();
            dal.AddLeaveType(leaveType);
        }

        public void UpdateLeaveType(LeaveType leaveType, string Type)
        {
            LeaveTypeDAL dal = new LeaveTypeDAL();
            dal.UpdateLeaveType(leaveType, Type);
        }

        public void DeleteLeaveType(LeaveType leaveType)
        {
            LeaveTypeDAL dal = new LeaveTypeDAL();
            dal.DeleteLeaveType(leaveType);
        }

        public IList GetAllLeaveTypes(string strHQL)
        {
            LeaveTypeDAL dal = new LeaveTypeDAL();
            return dal.GetAllLeaveTypes(strHQL);
        }
    }
}