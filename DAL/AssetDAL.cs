using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetDAL
    {
        private EntityControl control;

        public AssetDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAsset(Asset asset)
        {
            control.AddEntity(asset);
        }

        public void UpdateAsset(Asset asset, int ID)
        {
            control.UpdateEntity(asset, ID);
        }

        public void DeleteAsset(Asset asset)
        {
            control.DeleteEntity(asset);
        }

        public IList GetAllAssets(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}