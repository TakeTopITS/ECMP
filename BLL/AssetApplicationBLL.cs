using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class AssetApplicationBLL
    {
        public void AddAssetApplication(AssetApplication assetApplication)
        {
            AssetApplicationDAL dal = new AssetApplicationDAL();
            dal.AddAssetApplication(assetApplication);
        }

        public void UpdateAssetApplication(AssetApplication assetApplication, int AAID)
        {
            AssetApplicationDAL dal = new AssetApplicationDAL();
            dal.UpdateAssetApplication(assetApplication, AAID);
        }

        public void DeleteAssetApplication(AssetApplication assetApplication)
        {
            AssetApplicationDAL dal = new AssetApplicationDAL();
            dal.DeleteAssetApplication(assetApplication);
        }

        public IList GetAllAssetApplications(string strHQL)
        {
            AssetApplicationDAL dal = new AssetApplicationDAL();
            return dal.GetAllAssetApplications(strHQL);
        }
    }
}