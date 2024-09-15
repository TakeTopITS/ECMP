using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEEnvironmentalFactorsBLL
    {
        public void AddHSEEnvironmentalFactors(HSEEnvironmentalFactors hSEEnvironmentalFactors)
        {
            HSEEnvironmentalFactorsDAL dal = new HSEEnvironmentalFactorsDAL();
            dal.AddHSEEnvironmentalFactors(hSEEnvironmentalFactors);
        }

        public void UpdateHSEEnvironmentalFactors(HSEEnvironmentalFactors hSEEnvironmentalFactors, string Code)
        {
            HSEEnvironmentalFactorsDAL dal = new HSEEnvironmentalFactorsDAL();
            dal.UpdateHSEEnvironmentalFactors(hSEEnvironmentalFactors, Code);
        }

        public void DeleteHSEEnvironmentalFactors(HSEEnvironmentalFactors hSEEnvironmentalFactors)
        {
            HSEEnvironmentalFactorsDAL dal = new HSEEnvironmentalFactorsDAL();
            dal.DeleteHSEEnvironmentalFactors(hSEEnvironmentalFactors);
        }

        public IList GetAllHSEEnvironmentalFactorss(string strHQL)
        {
            HSEEnvironmentalFactorsDAL dal = new HSEEnvironmentalFactorsDAL();
            return dal.GetAllHSEEnvironmentalFactorss(strHQL);
        }
    }
}