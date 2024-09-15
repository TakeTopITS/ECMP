using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class LeaveTypeDAL
    {
        private EntityControl control;

        public LeaveTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddLeaveType(LeaveType leaveType)
        {
            control.AddEntity(leaveType);
        }

        public void UpdateLeaveType(LeaveType leaveType, string Type)
        {
            control.UpdateEntity(leaveType, Type);
        }

        public void DeleteLeaveType(LeaveType leaveType)
        {
            control.DeleteEntity(leaveType);
        }

        public IList GetAllLeaveTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}