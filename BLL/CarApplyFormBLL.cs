using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CarApplyFormBLL
    {
        public void AddCarApplyForm(CarApplyForm carApplyForm)
        {
            CarApplyFormDAL dal = new CarApplyFormDAL();
            dal.AddCarApplyForm(carApplyForm);
        }

        public void UpdateCarApplyForm(CarApplyForm carApplyForm, int ID)
        {
            CarApplyFormDAL dal = new CarApplyFormDAL();
            dal.UpdateCarApplyForm(carApplyForm, ID);
        }

        public void DeleteCarApplyForm(CarApplyForm carApplyForm)
        {
            CarApplyFormDAL dal = new CarApplyFormDAL();
            dal.DeleteCarApplyForm(carApplyForm);
        }

        public IList GetAllCarApplyForms(string strHQL)
        {
            CarApplyFormDAL dal = new CarApplyFormDAL();
            return dal.GetAllCarApplyForms(strHQL);
        }
    }
}