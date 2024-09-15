using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DepartAssetRelatedUserBLL
    {
        public void AddDepartAssetRelatedUser(DepartAssetRelatedUser departAssetRelatedUser)
        {
            DepartAssetRelatedUserDAL dal = new DepartAssetRelatedUserDAL();
            dal.AddDepartAssetRelatedUser(departAssetRelatedUser);
        }

        public void UpdateDepartAssetRelatedUser(DepartAssetRelatedUser departAssetRelatedUser, int ID)
        {
            DepartAssetRelatedUserDAL dal = new DepartAssetRelatedUserDAL();
            dal.UpdateDepartAssetRelatedUser(departAssetRelatedUser, ID);
        }

        public void DeleteDepartAssetRelatedUser(DepartAssetRelatedUser departAssetRelatedUser)
        {
            DepartAssetRelatedUserDAL dal = new DepartAssetRelatedUserDAL();
            dal.DeleteDepartAssetRelatedUser(departAssetRelatedUser);
        }

        public IList GetAllDepartAssetRelatedUsers(string strHQL)
        {
            DepartAssetRelatedUserDAL dal = new DepartAssetRelatedUserDAL();
            return dal.GetAllDepartAssetRelatedUsers(strHQL);
        }
    }
}