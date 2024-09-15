using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class OvertimeApplyFormDAL
    {
        private EntityControl control;

        public OvertimeApplyFormDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddOvertimeApplyForm(OvertimeApplyForm overtimeApplyForm)
        {
            control.AddEntity(overtimeApplyForm);
        }

        public void UpdateOvertimeApplyForm(OvertimeApplyForm overtimeApplyForm, int ID)
        {
            control.UpdateEntity(overtimeApplyForm, ID);
        }

        public void DeleteOvertimeApplyForm(OvertimeApplyForm overtimeApplyForm)
        {
            control.DeleteEntity(overtimeApplyForm);
        }

        public IList GetAllOvertimeApplyForms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}