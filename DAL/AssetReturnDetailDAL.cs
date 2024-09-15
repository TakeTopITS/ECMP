using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetReturnDetailDAL
    {
        private EntityControl control;

        public AssetReturnDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetReturnDetail(AssetReturnDetail assetReturnDetail)
        {
            control.AddEntity(assetReturnDetail);
        }

        public void UpdateAssetReturnDetail(AssetReturnDetail assetReturnDetail, int ID)
        {
            control.UpdateEntity(assetReturnDetail, ID);
        }

        public void DeleteAssetReturnDetail(AssetReturnDetail assetReturnDetail)
        {
            control.DeleteEntity(assetReturnDetail);
        }

        public IList GetAllAssetReturnDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}