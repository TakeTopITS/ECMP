using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SystemActiveUserBLL
    {
        public void AddSystemActiveUser(SystemActiveUser systemActiveUser)
        {
            SystemActiveUserDAL dal = new SystemActiveUserDAL();
            dal.AddSystemActiveUser(systemActiveUser);
        }

        public void UpdateSystemActiveUser(SystemActiveUser systemActiveUser, string UserCode)
        {
            SystemActiveUserDAL dal = new SystemActiveUserDAL();
            dal.UpdateSystemActiveUser(systemActiveUser, UserCode);
        }

        public void DeleteSystemActiveUser(SystemActiveUser systemActiveUser)
        {
            SystemActiveUserDAL dal = new SystemActiveUserDAL();
            dal.DeleteSystemActiveUser(systemActiveUser);
        }

        public IList GetAllSystemActiveUsers(string strHQL)
        {
            SystemActiveUserDAL dal = new SystemActiveUserDAL();
            return dal.GetAllSystemActiveUsers(strHQL);
        }

        public bool GetAuthobility(string strModuleName, string strUserCode)
        {
            string strHQL, strVisible;
            IList lst;

            strHQL = "from ProModule as proModule where proModule.UserCode = " + "'" + strUserCode + "'" + " and proModule.ModuleName = " + "'" + strModuleName + "'";
            ProModuleBLL proModuleBLL = new ProModuleBLL();
            lst = proModuleBLL.GetAllProModules(strHQL);

            if (lst.Count > 0)
            {
                ProModule proModule = (ProModule)lst[0];
                strVisible = proModule.Visible.Trim();

                if (strVisible == "True")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}