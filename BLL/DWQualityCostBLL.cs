using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWQualityCostBLL
    {
        public void AddDWQualityCost(DWQualityCost dWQualityCost)
        {
            DWQualityCostDAL dal = new DWQualityCostDAL();
            dal.AddDWQualityCost(dWQualityCost);
        }

        public void UpdateDWQualityCost(DWQualityCost dWQualityCost, int ID)
        {
            DWQualityCostDAL dal = new DWQualityCostDAL();
            dal.UpdateDWQualityCost(dWQualityCost, ID);
        }

        public void DeleteDWQualityCost(DWQualityCost dWQualityCost)
        {
            DWQualityCostDAL dal = new DWQualityCostDAL();
            dal.DeleteDWQualityCost(dWQualityCost);
        }

        public IList GetAllDWQualityCosts(string strHQL)
        {
            DWQualityCostDAL dal = new DWQualityCostDAL();
            return dal.GetAllDWQualityCosts(strHQL);
        }
    }
}