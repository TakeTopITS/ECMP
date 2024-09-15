using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class UserKPICheckDetailDAL
    {
        private EntityControl control;

        public UserKPICheckDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddUserKPICheckDetail(UserKPICheckDetail userKPICheckDetail)
        {
            control.AddEntity(userKPICheckDetail);
        }

        public void UpdateUserKPICheckDetail(UserKPICheckDetail userKPICheckDetail, int ID)
        {
            control.UpdateEntity(userKPICheckDetail, ID);
        }

        public void DeleteUserKPICheckDetail(UserKPICheckDetail userKPICheckDetail)
        {
            control.DeleteEntity(userKPICheckDetail);
        }

        public IList GetAllUserKPICheckDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}