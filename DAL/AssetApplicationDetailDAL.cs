using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetApplicationDetailDAL
    {
        private EntityControl control;

        public AssetApplicationDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetApplicationDetail(AssetApplicationDetail assetApplicationDetail)
        {
            control.AddEntity(assetApplicationDetail);
        }

        public void UpdateAssetApplicationDetail(AssetApplicationDetail assetApplicationDetail, int ID)
        {
            control.UpdateEntity(assetApplicationDetail, ID);
        }

        public void DeleteAssetApplicationDetail(AssetApplicationDetail assetApplicationDetail)
        {
            control.DeleteEntity(assetApplicationDetail);
        }

        public IList GetAllAssetApplicationDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}