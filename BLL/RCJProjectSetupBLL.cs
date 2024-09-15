using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    internal class RCJProjectSetupBLL
    {
        public void AddRCJProjectSetup(RCJProjectSetup pwd)
        {
            RCJProjectSetupDAL dal = new RCJProjectSetupDAL();
            dal.AddRCJProjectSetup(pwd);
        }

        public void UpdateRCJProjectSetup(RCJProjectSetup pwd, int ID)
        {
            RCJProjectSetupDAL dal = new RCJProjectSetupDAL();
            dal.UpdateRCJProjectSetup(pwd, ID);
        }

        public void DeleteRCJProjectSetup(RCJProjectSetup pwd)
        {
            RCJProjectSetupDAL dal = new RCJProjectSetupDAL();
            dal.DeleteRCJProjectSetup(pwd);
        }

        public IList GetAllRCJProjectSetup(string strHQL)
        {
            RCJProjectSetupDAL dal = new RCJProjectSetupDAL();
            return dal.GetAllRCJProjectSetup(strHQL);
        }
    }
}