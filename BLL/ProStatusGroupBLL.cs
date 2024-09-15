using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProStatusGroupBLL
    {
        public void AddProStatusGroup(ProStatusGroup proStatusGroup)
        {
            ProStatusGroupDAL dal = new ProStatusGroupDAL();
            dal.AddProStatusGroup(proStatusGroup);
        }

        public void UpdateProStatusGroup(ProStatusGroup proStatusGroup, string Status)
        {
            ProStatusGroupDAL dal = new ProStatusGroupDAL();
            dal.UpdateProStatusGroup(proStatusGroup, Status);
        }

        public void DeleteProStatusGroup(ProStatusGroup proStatusGroup)
        {
            ProStatusGroupDAL dal = new ProStatusGroupDAL();
            dal.DeleteProStatusGroup(proStatusGroup);
        }

        public IList GetAllProStatusGroups(string strHQL)
        {
            ProStatusGroupDAL dal = new ProStatusGroupDAL();
            return dal.GetAllProStatusGroups(strHQL);
        }
    }
}