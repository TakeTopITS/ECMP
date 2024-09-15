using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class AssetReturnOrderDAL
    {
        private EntityControl control;

        public AssetReturnOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddAssetReturnOrder(AssetReturnOrder assetReturnOrder)
        {
            control.AddEntity(assetReturnOrder);
        }

        public void UpdateAssetReturnOrder(AssetReturnOrder assetReturnOrder, int ROID)
        {
            control.UpdateEntity(assetReturnOrder, ROID);
        }

        public void DeleteAssetReturnOrder(AssetReturnOrder assetReturnOrder)
        {
            control.DeleteEntity(assetReturnOrder);
        }

        public IList GetAllAssetReturnOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}