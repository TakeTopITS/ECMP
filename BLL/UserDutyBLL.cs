using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserDutyBLL
    {
        public void AddUserDuty(UserDuty userDuty)
        {
            UserDutyDAL dal = new UserDutyDAL();
            dal.AddUserDuty(userDuty);
        }

        public void UpdateUserDuty(UserDuty userDuty, string Duty)
        {
            UserDutyDAL dal = new UserDutyDAL();
            dal.UpdateUserDuty(userDuty, Duty);
        }

        public void DeleteUserDuty(UserDuty userDuty)
        {
            UserDutyDAL dal = new UserDutyDAL();
            dal.DeleteUserDuty(userDuty);
        }

        public IList GetAllUserDutys(string strHQL)
        {
            UserDutyDAL dal = new UserDutyDAL();
            return dal.GetAllUserDutys(strHQL);
        }
    }
}