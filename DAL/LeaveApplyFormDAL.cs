using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class LeaveApplyFormDAL
    {
        private EntityControl control;

        public LeaveApplyFormDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddLeaveApplyForm(LeaveApplyForm leaveApplyForm)
        {
            control.AddEntity(leaveApplyForm);
        }

        public void UpdateLeaveApplyForm(LeaveApplyForm leaveApplyForm, int ID)
        {
            control.UpdateEntity(leaveApplyForm, ID);
        }

        public void DeleteLeaveApplyForm(LeaveApplyForm leaveApplyForm)
        {
            control.DeleteEntity(leaveApplyForm);
        }

        public IList GetAllLeaveApplyForms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}