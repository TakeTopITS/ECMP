using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetTypeDAL
    {
        private EntityControl control;

        public AssetTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetType(AssetType assetType)
        {
            control.AddEntity(assetType);
        }

        public void UpdateAssetType(AssetType assetType, string Type)
        {
            control.UpdateEntity(assetType, Type);
        }

        public void DeleteAssetType(AssetType assetType)
        {
            control.DeleteEntity(assetType);
        }

        public IList GetAllAssetTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}