using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetCheckInOrderDAL
    {
        private EntityControl control;

        public AssetCheckInOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetCheckInOrder(AssetCheckInOrder assetCheckInOrderCheckInOrder)
        {
            control.AddEntity(assetCheckInOrderCheckInOrder);
        }

        public void UpdateAssetCheckInOrder(AssetCheckInOrder assetCheckInOrderCheckInOrder, int CheckInID)
        {
            control.UpdateEntity(assetCheckInOrderCheckInOrder, CheckInID);
        }

        public void DeleteAssetCheckInOrder(AssetCheckInOrder assetCheckInOrderCheckInOrder)
        {
            control.DeleteEntity(assetCheckInOrderCheckInOrder);
        }

        public IList GetAllAssetCheckInOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}