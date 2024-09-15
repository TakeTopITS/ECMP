using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractPayableBLL
    {
        public void AddConstractPayable(ConstractPayable constractPayable)
        {
            ConstractPayableDAL dal = new ConstractPayableDAL();
            dal.AddConstractPayable(constractPayable);
        }

        public void UpdateConstractPayable(ConstractPayable constractPayable, int ID)
        {
            ConstractPayableDAL dal = new ConstractPayableDAL();
            dal.UpdateConstractPayable(constractPayable, ID);
        }

        public void DeleteConstractPayable(ConstractPayable constractPayable)
        {
            ConstractPayableDAL dal = new ConstractPayableDAL();
            dal.DeleteConstractPayable(constractPayable);
        }

        public IList GetAllConstractPayables(string strHQL)
        {
            ConstractPayableDAL dal = new ConstractPayableDAL();
            return dal.GetAllConstractPayables(strHQL);
        }
    }
}