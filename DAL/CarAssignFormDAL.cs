using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CarAssignFormDAL
    {
        private EntityControl control;

        public CarAssignFormDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCarAssignForm(CarAssignForm carAssignForm)
        {
            control.AddEntity(carAssignForm);
        }

        public void UpdateCarAssignForm(CarAssignForm carAssignForm, int ID)
        {
            control.UpdateEntity(carAssignForm, ID);
        }

        public void DeleteCarAssignForm(CarAssignForm carAssignForm)
        {
            control.DeleteEntity(carAssignForm);
        }

        public IList GetAllCarAssignForms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}