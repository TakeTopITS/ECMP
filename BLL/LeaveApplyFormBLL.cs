using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class LeaveApplyFormBLL
    {
        public void AddLeaveApplyForm(LeaveApplyForm leaveApplyForm)
        {
            LeaveApplyFormDAL dal = new LeaveApplyFormDAL();
            dal.AddLeaveApplyForm(leaveApplyForm);
        }

        public void UpdateLeaveApplyForm(LeaveApplyForm leaveApplyForm, int ID)
        {
            LeaveApplyFormDAL dal = new LeaveApplyFormDAL();
            dal.UpdateLeaveApplyForm(leaveApplyForm, ID);
        }

        public void DeleteLeaveApplyForm(LeaveApplyForm leaveApplyForm)
        {
            LeaveApplyFormDAL dal = new LeaveApplyFormDAL();
            dal.DeleteLeaveApplyForm(leaveApplyForm);
        }

        public IList GetAllLeaveApplyForms(string strHQL)
        {
            LeaveApplyFormDAL dal = new LeaveApplyFormDAL();
            return dal.GetAllLeaveApplyForms(strHQL);
        }
    }
}