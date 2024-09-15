using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AllProStatusGroupBLL
    {
        public void AddAllProStatusGroup(AllProStatusGroup allAllProStatusGroup)
        {
            AllProStatusGroupDAL dal = new AllProStatusGroupDAL();
            dal.AddAllProStatusGroup(allAllProStatusGroup);
        }

        public void UpdateAllProStatusGroup(AllProStatusGroup allAllProStatusGroup, string Status)
        {
            AllProStatusGroupDAL dal = new AllProStatusGroupDAL();
            dal.UpdateAllProStatusGroup(allAllProStatusGroup, Status);
        }

        public void DeleteAllProStatusGroup(AllProStatusGroup allAllProStatusGroup)
        {
            AllProStatusGroupDAL dal = new AllProStatusGroupDAL();
            dal.DeleteAllProStatusGroup(allAllProStatusGroup);
        }

        public IList GetAllAllProStatusGroups(string strHQL)
        {
            AllProStatusGroupDAL dal = new AllProStatusGroupDAL();
            return dal.GetAllAllProStatusGroups(strHQL);
        }
    }
}