using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class OvertimeApplyFormBLL
    {
        public void AddOvertimeApplyForm(OvertimeApplyForm overtimeApplyForm)
        {
            OvertimeApplyFormDAL dal = new OvertimeApplyFormDAL();
            dal.AddOvertimeApplyForm(overtimeApplyForm);
        }

        public void UpdateOvertimeApplyForm(OvertimeApplyForm overtimeApplyForm, int ID)
        {
            OvertimeApplyFormDAL dal = new OvertimeApplyFormDAL();
            dal.UpdateOvertimeApplyForm(overtimeApplyForm, ID);
        }

        public void DeleteOvertimeApplyForm(OvertimeApplyForm overtimeApplyForm)
        {
            OvertimeApplyFormDAL dal = new OvertimeApplyFormDAL();
            dal.DeleteOvertimeApplyForm(overtimeApplyForm);
        }

        public IList GetAllOvertimeApplyForms(string strHQL)
        {
            OvertimeApplyFormDAL dal = new OvertimeApplyFormDAL();
            return dal.GetAllOvertimeApplyForms(strHQL);
        }
    }
}