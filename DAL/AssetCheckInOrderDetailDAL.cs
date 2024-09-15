using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetCheckInOrderDetailDAL
    {
        private EntityControl control;

        public AssetCheckInOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetCheckInOrderDetail(AssetCheckInOrderDetail assetCheckInOrderDetail)
        {
            control.AddEntity(assetCheckInOrderDetail);
        }

        public void UpdateAssetCheckInOrderDetail(AssetCheckInOrderDetail assetCheckInOrderDetail, int ID)
        {
            control.UpdateEntity(assetCheckInOrderDetail, ID);
        }

        public void DeleteAssetCheckInOrderDetail(AssetCheckInOrderDetail assetCheckInOrderDetail)
        {
            control.DeleteEntity(assetCheckInOrderDetail);
        }

        public IList GetAllAssetCheckInOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}