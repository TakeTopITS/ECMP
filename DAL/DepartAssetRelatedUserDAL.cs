using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartAssetRelatedUserDAL
    {
        private EntityControl control;

        public DepartAssetRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartAssetRelatedUser(DepartAssetRelatedUser departAssetRelatedUser)
        {
            control.AddEntity(departAssetRelatedUser);
        }

        public void UpdateDepartAssetRelatedUser(DepartAssetRelatedUser departAssetRelatedUser, int ID)
        {
            control.UpdateEntity(departAssetRelatedUser, ID);
        }

        public void DeleteDepartAssetRelatedUser(DepartAssetRelatedUser departAssetRelatedUser)
        {
            control.DeleteEntity(departAssetRelatedUser);
        }

        public IList GetAllDepartAssetRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}