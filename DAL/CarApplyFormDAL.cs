using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CarApplyFormDAL
    {
        private EntityControl control;

        public CarApplyFormDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCarApplyForm(CarApplyForm carApplyForm)
        {
            control.AddEntity(carApplyForm);
        }

        public void UpdateCarApplyForm(CarApplyForm carApplyForm, int ID)
        {
            control.UpdateEntity(carApplyForm, ID);
        }

        public void DeleteCarApplyForm(CarApplyForm carApplyForm)
        {
            control.DeleteEntity(carApplyForm);
        }

        public IList GetAllCarApplyForms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}