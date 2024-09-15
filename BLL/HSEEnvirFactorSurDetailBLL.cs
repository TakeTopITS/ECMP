using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEEnvirFactorSurDetailBLL
    {
        public void AddHSEEnvirFactorSurDetail(HSEEnvirFactorSurDetail hSEEnvirFactorSurDetail)
        {
            HSEEnvirFactorSurDetailDAL dal = new HSEEnvirFactorSurDetailDAL();
            dal.AddHSEEnvirFactorSurDetail(hSEEnvirFactorSurDetail);
        }

        public void UpdateHSEEnvirFactorSurDetail(HSEEnvirFactorSurDetail hSEEnvirFactorSurDetail, int ID)
        {
            HSEEnvirFactorSurDetailDAL dal = new HSEEnvirFactorSurDetailDAL();
            dal.UpdateHSEEnvirFactorSurDetail(hSEEnvirFactorSurDetail, ID);
        }

        public void DeleteHSEEnvirFactorSurDetail(HSEEnvirFactorSurDetail hSEEnvirFactorSurDetail)
        {
            HSEEnvirFactorSurDetailDAL dal = new HSEEnvirFactorSurDetailDAL();
            dal.DeleteHSEEnvirFactorSurDetail(hSEEnvirFactorSurDetail);
        }

        public IList GetAllHSEEnvirFactorSurDetails(string strHQL)
        {
            HSEEnvirFactorSurDetailDAL dal = new HSEEnvirFactorSurDetailDAL();
            return dal.GetAllHSEEnvirFactorSurDetails(strHQL);
        }
    }
}