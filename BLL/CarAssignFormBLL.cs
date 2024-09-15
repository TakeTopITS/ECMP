using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CarAssignFormBLL
    {
        public void AddCarAssignForm(CarAssignForm carAssignForm)
        {
            CarAssignFormDAL dal = new CarAssignFormDAL();
            dal.AddCarAssignForm(carAssignForm);
        }

        public void UpdateCarAssignForm(CarAssignForm carAssignForm, int ID)
        {
            CarAssignFormDAL dal = new CarAssignFormDAL();
            dal.UpdateCarAssignForm(carAssignForm, ID);
        }

        public void DeleteCarAssignForm(CarAssignForm carAssignForm)
        {
            CarAssignFormDAL dal = new CarAssignFormDAL();
            dal.DeleteCarAssignForm(carAssignForm);
        }

        public IList GetAllCarAssignForms(string strHQL)
        {
            CarAssignFormDAL dal = new CarAssignFormDAL();
            return dal.GetAllCarAssignForms(strHQL);
        }
    }
}