using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class FunInforDialBoxBLL
    {
        public void AddFunInforDialBox(FunInforDialBox funInforDialBox)
        {
            FunInforDialBoxDAL dal = new FunInforDialBoxDAL();
            dal.AddFunInforDialBox(funInforDialBox);
        }

        public void UpdateFunInforDialBox(FunInforDialBox funInforDialBox, int ID)
        {
            FunInforDialBoxDAL dal = new FunInforDialBoxDAL();
            dal.UpdateFunInforDialBox(funInforDialBox, ID);
        }

        public void DeleteFunInforDialBox(FunInforDialBox funInforDialBox)
        {
            FunInforDialBoxDAL dal = new FunInforDialBoxDAL();
            dal.DeleteFunInforDialBox(funInforDialBox);
        }

        public IList GetAllFunInforDialBoxs(string strHQL)
        {
            FunInforDialBoxDAL dal = new FunInforDialBoxDAL();
            return dal.GetAllFunInforDialBoxs(strHQL);
        }
    }
}