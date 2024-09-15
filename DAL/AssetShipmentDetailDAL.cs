using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetShipmentDetailDAL
    {
        private EntityControl control;

        public AssetShipmentDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetShipmentDetail(AssetShipmentDetail assetShipmentDetail)
        {
            control.AddEntity(assetShipmentDetail);
        }

        public void UpdateAssetShipmentDetail(AssetShipmentDetail assetShipmentDetail, int ID)
        {
            control.UpdateEntity(assetShipmentDetail, ID);
        }

        public void DeleteAssetShipmentDetail(AssetShipmentDetail assetShipmentDetail)
        {
            control.DeleteEntity(assetShipmentDetail);
        }

        public IList GetAllAssetShipmentDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}