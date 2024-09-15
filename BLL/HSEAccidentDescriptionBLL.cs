using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 事故描述
    /// </summary>
    public class HSEAccidentDescriptionBLL
    {
        public void AddHSEAccidentDescription(HSEAccidentDescription hSEAccidentDescription)
        {
            HSEAccidentDescriptionDAL dal = new HSEAccidentDescriptionDAL();
            dal.AddHSEAccidentDescription(hSEAccidentDescription);
        }

        public void UpdateHSEAccidentDescription(HSEAccidentDescription hSEAccidentDescription, string Code)
        {
            HSEAccidentDescriptionDAL dal = new HSEAccidentDescriptionDAL();
            dal.UpdateHSEAccidentDescription(hSEAccidentDescription, Code);
        }

        public void DeleteHSEAccidentDescription(HSEAccidentDescription hSEAccidentDescription)
        {
            HSEAccidentDescriptionDAL dal = new HSEAccidentDescriptionDAL();
            dal.DeleteHSEAccidentDescription(hSEAccidentDescription);
        }

        public IList GetAllHSEAccidentDescriptions(string strHQL)
        {
            HSEAccidentDescriptionDAL dal = new HSEAccidentDescriptionDAL();
            return dal.GetAllHSEAccidentDescriptions(strHQL);
        }
    }
}