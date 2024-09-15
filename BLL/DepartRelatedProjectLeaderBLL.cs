using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartRelatedProjectLeaderBLL
    {
        public void AddDepartRelatedProjectLeader(DepartRelatedProjectLeader departRelatedProjectLeader)
        {
            DepartRelatedProjectLeaderDAL dal = new DepartRelatedProjectLeaderDAL();
            dal.AddDepartRelatedProjectLeader(departRelatedProjectLeader);
        }

        public void UpdateDepartRelatedProjectLeader(DepartRelatedProjectLeader departRelatedProjectLeader, int ID)
        {
            DepartRelatedProjectLeaderDAL dal = new DepartRelatedProjectLeaderDAL();
            dal.UpdateDepartRelatedProjectLeader(departRelatedProjectLeader, ID);
        }

        public void DeleteDepartRelatedProjectLeader(DepartRelatedProjectLeader departRelatedProjectLeader)
        {
            DepartRelatedProjectLeaderDAL dal = new DepartRelatedProjectLeaderDAL();
            dal.DeleteDepartRelatedProjectLeader(departRelatedProjectLeader);
        }

        public IList GetAllDepartRelatedProjectLeaders(string strHQL)
        {
            DepartRelatedProjectLeaderDAL dal = new DepartRelatedProjectLeaderDAL();
            return dal.GetAllDepartRelatedProjectLeaders(strHQL);
        }
    }
}