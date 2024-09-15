using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWMakeCostBLL
    {
        public void AddDWMakeCost(DWMakeCost dWMakeCost)
        {
            DWMakeCostDAL dal = new DWMakeCostDAL();
            dal.AddDWMakeCost(dWMakeCost);
        }

        public void UpdateDWMakeCost(DWMakeCost dWMakeCost, int ID)
        {
            DWMakeCostDAL dal = new DWMakeCostDAL();
            dal.UpdateDWMakeCost(dWMakeCost, ID);
        }

        public void DeleteDWMakeCost(DWMakeCost dWMakeCost)
        {
            DWMakeCostDAL dal = new DWMakeCostDAL();
            dal.DeleteDWMakeCost(dWMakeCost);
        }

        public IList GetAllDWMakeCosts(string strHQL)
        {
            DWMakeCostDAL dal = new DWMakeCostDAL();
            return dal.GetAllDWMakeCosts(strHQL);
        }
    }
}