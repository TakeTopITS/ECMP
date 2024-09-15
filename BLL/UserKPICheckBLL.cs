using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserKPICheckBLL
    {
        public void AddUserKPICheck(UserKPICheck userKPICheck)
        {
            UserKPICheckDAL dal = new UserKPICheckDAL();
            dal.AddUserKPICheck(userKPICheck);
        }

        public void UpdateUserKPICheck(UserKPICheck userKPICheck, int KPICheckID)
        {
            UserKPICheckDAL dal = new UserKPICheckDAL();
            dal.UpdateUserKPICheck(userKPICheck, KPICheckID);
        }

        public void DeleteUserKPICheck(UserKPICheck userKPICheck)
        {
            UserKPICheckDAL dal = new UserKPICheckDAL();
            dal.DeleteUserKPICheck(userKPICheck);
        }

        public IList GetAllUserKPIChecks(string strHQL)
        {
            UserKPICheckDAL dal = new UserKPICheckDAL();
            return dal.GetAllUserKPIChecks(strHQL);
        }
    }
}