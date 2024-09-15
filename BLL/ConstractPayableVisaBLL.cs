using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractPayableVisaBLL
    {
        public void AddConstractPayableVisa(ConstractPayableVisa constractPayableVisa)
        {
            ConstractPayableVisaDAL dal = new ConstractPayableVisaDAL();
            dal.AddConstractPayableVisa(constractPayableVisa);
        }

        public void UpdateConstractPayableVisa(ConstractPayableVisa constractPayableVisa, int ID)
        {
            ConstractPayableVisaDAL dal = new ConstractPayableVisaDAL();
            dal.UpdateConstractPayableVisa(constractPayableVisa, ID);
        }

        public void DeleteConstractPayableVisa(ConstractPayableVisa constractPayableVisa)
        {
            ConstractPayableVisaDAL dal = new ConstractPayableVisaDAL();
            dal.DeleteConstractPayableVisa(constractPayableVisa);
        }

        public IList GetAllConstractPayableVisas(string strHQL)
        {
            ConstractPayableVisaDAL dal = new ConstractPayableVisaDAL();
            return dal.GetAllConstractPayableVisas(strHQL);
        }
    }
}