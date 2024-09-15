using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractPayableVisaDetailBLL
    {
        public void AddConstractPayableVisaDetail(ConstractPayableVisaDetail constractPayableVisaDetail)
        {
            ConstractPayableVisaDetailDAL dal = new ConstractPayableVisaDetailDAL();
            dal.AddConstractPayableVisaDetail(constractPayableVisaDetail);
        }

        public void UpdateConstractPayableVisaDetail(ConstractPayableVisaDetail constractPayableVisaDetail, int ID)
        {
            ConstractPayableVisaDetailDAL dal = new ConstractPayableVisaDetailDAL();
            dal.UpdateConstractPayableVisaDetail(constractPayableVisaDetail, ID);
        }

        public void DeleteConstractPayableVisaDetail(ConstractPayableVisaDetail constractPayableVisaDetail)
        {
            ConstractPayableVisaDetailDAL dal = new ConstractPayableVisaDetailDAL();
            dal.DeleteConstractPayableVisaDetail(constractPayableVisaDetail);
        }

        public IList GetAllConstractPayableVisaDetails(string strHQL)
        {
            ConstractPayableVisaDetailDAL dal = new ConstractPayableVisaDetailDAL();
            return dal.GetAllConstractPayableVisaDetails(strHQL);
        }
    }
}