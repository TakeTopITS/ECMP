using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartRelatedWZFeeUserDAL
    {
        private EntityControl control;

        public DepartRelatedWZFeeUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartRelatedWZFeeUser(DepartRelatedWZFeeUser departRelatedWZFeeUser)
        {
            control.AddEntity(departRelatedWZFeeUser);
        }

        public void UpdateDepartRelatedWZFeeUser(DepartRelatedWZFeeUser departRelatedWZFeeUser, int ID)
        {
            control.UpdateEntity(departRelatedWZFeeUser, ID);
        }

        public void DeleteDepartRelatedWZFeeUser(DepartRelatedWZFeeUser departRelatedWZFeeUser)
        {
            control.DeleteEntity(departRelatedWZFeeUser);
        }

        public IList GetAllDepartRelatedWZFeeUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}