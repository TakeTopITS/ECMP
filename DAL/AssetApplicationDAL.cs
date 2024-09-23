using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetApplicationDAL
    {
        private EntityControl control;

        public AssetApplicationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }


        public void AddAssetApplication(AssetApplication assetApplication)
        {
            control.AddEntity(assetApplication);
        }

        public void UpdateAssetApplication(AssetApplication assetApplication, int AAID)
        {
            control.UpdateEntity(assetApplication, AAID);
        }

        public void DeleteAssetApplication(AssetApplication assetApplication)
        {
            control.DeleteEntity(assetApplication);
        }

        public IList GetAllAssetApplications(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}