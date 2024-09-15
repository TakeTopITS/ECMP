using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEHealthyCheckupBLL
    {
        public void AddHSEHealthyCheckup(HSEHealthyCheckup hSEHealthyCheckup)
        {
            HSEHealthyCheckupDAL dal = new HSEHealthyCheckupDAL();
            dal.AddHSEHealthyCheckup(hSEHealthyCheckup);
        }

        public void UpdateHSEHealthyCheckup(HSEHealthyCheckup hSEHealthyCheckup, string Code)
        {
            HSEHealthyCheckupDAL dal = new HSEHealthyCheckupDAL();
            dal.UpdateHSEHealthyCheckup(hSEHealthyCheckup, Code);
        }

        public void DeleteHSEHealthyCheckup(HSEHealthyCheckup hSEHealthyCheckup)
        {
            HSEHealthyCheckupDAL dal = new HSEHealthyCheckupDAL();
            dal.DeleteHSEHealthyCheckup(hSEHealthyCheckup);
        }

        public IList GetAllHSEHealthyCheckups(string strHQL)
        {
            HSEHealthyCheckupDAL dal = new HSEHealthyCheckupDAL();
            return dal.GetAllHSEHealthyCheckups(strHQL);
        }
    }
}