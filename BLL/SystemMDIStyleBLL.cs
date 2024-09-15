using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SystemMDIStyleBLL
    {
        public void AddSystemMDIStyle(SystemMDIStyle systemMDIStyle)
        {
            SystemMDIStyleDAL dal = new SystemMDIStyleDAL();
            dal.AddSystemMDIStyle(systemMDIStyle);
        }

        public void UpdateSystemMDIStyle(SystemMDIStyle systemMDIStyle, string MDIStyle)
        {
            SystemMDIStyleDAL dal = new SystemMDIStyleDAL();
            dal.UpdateSystemMDIStyle(systemMDIStyle, MDIStyle);
        }

        public void DeleteSystemMDIStyle(SystemMDIStyle systemMDIStyle)
        {
            SystemMDIStyleDAL dal = new SystemMDIStyleDAL();
            dal.DeleteSystemMDIStyle(systemMDIStyle);
        }

        public IList GetAllSystemMDIStyles(string strHQL)
        {
            SystemMDIStyleDAL dal = new SystemMDIStyleDAL();
            return dal.GetAllSystemMDIStyles(strHQL);
        }
    }
}