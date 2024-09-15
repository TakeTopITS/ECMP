using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEDiseasePreventionBLL
    {
        public void AddHSEDiseasePrevention(HSEDiseasePrevention hSEDiseasePrevention)
        {
            HSEDiseasePreventionDAL dal = new HSEDiseasePreventionDAL();
            dal.AddHSEDiseasePrevention(hSEDiseasePrevention);
        }

        public void UpdateHSEDiseasePrevention(HSEDiseasePrevention hSEDiseasePrevention, string Code)
        {
            HSEDiseasePreventionDAL dal = new HSEDiseasePreventionDAL();
            dal.UpdateHSEDiseasePrevention(hSEDiseasePrevention, Code);
        }

        public void DeleteHSEDiseasePrevention(HSEDiseasePrevention hSEDiseasePrevention)
        {
            HSEDiseasePreventionDAL dal = new HSEDiseasePreventionDAL();
            dal.DeleteHSEDiseasePrevention(hSEDiseasePrevention);
        }

        public IList GetAllHSEDiseasePreventions(string strHQL)
        {
            HSEDiseasePreventionDAL dal = new HSEDiseasePreventionDAL();
            return dal.GetAllHSEDiseasePreventions(strHQL);
        }
    }
}