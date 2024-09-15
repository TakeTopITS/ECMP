using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class UserKPICheckDetailBLL
    {
        public void AddUserKPICheckDetail(UserKPICheckDetail userKPICheckDetail)
        {
            UserKPICheckDetailDAL dal = new UserKPICheckDetailDAL();
            dal.AddUserKPICheckDetail(userKPICheckDetail);
        }

        public void UpdateUserKPICheckDetail(UserKPICheckDetail userKPICheckDetail, int ID)
        {
            UserKPICheckDetailDAL dal = new UserKPICheckDetailDAL();
            dal.UpdateUserKPICheckDetail(userKPICheckDetail, ID);
        }

        public void DeleteUserKPICheckDetail(UserKPICheckDetail userKPICheckDetail)
        {
            UserKPICheckDetailDAL dal = new UserKPICheckDetailDAL();
            dal.DeleteUserKPICheckDetail(userKPICheckDetail);
        }

        public IList GetAllUserKPICheckDetails(string strHQL)
        {
            UserKPICheckDetailDAL dal = new UserKPICheckDetailDAL();
            return dal.GetAllUserKPICheckDetails(strHQL);
        }
    }
}